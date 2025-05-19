Scriptname GM_SACWL_AME_Menu extends ActiveMagicEffect  

{This script operates a system of message boxes that lets you set how much carry weight to add, then casts a spell that adds the increased weight by the value of the selection.}

; =============================================================
; VARIABLES
; =============================================================

; Properties -----------------------------------------------------

Actor               Property    _PLAYERREF          Auto

GlobalVariable      Property    _GLOBALVAR1_INDEX   Auto

Message             Property    _MESSAGE1_MENU      Auto
Message             Property    _MESSAGE2_MENU      Auto

Spell               Property    _SPELL1             Auto

; Arrays -----------------------------------------------------

float[] _array1

; =============================================================
; EVENTS
; =============================================================

Event OnEffectStart(Actor a_target, Actor a_caster)
    
    Menu1()

EndEvent

; =============================================================
; FUNCTIONS
; =============================================================

; Arrays -----------------------------------------------------

Function Menu2Array(float a_index = 0.0) ;sets the array size to 10 and assigns values to each one based on a starting value

    _array1 = new float[10] ;adds 10 entries to the array and first entry begins at 0

    int _count = 0
    While (_count < 10) ;loop that runs to assign the 10 values to the array

        _array1[_count] = a_index ;assigns the value to the array
        a_index += 1
        _count += 1

    EndWhile

    Menu2()

EndFunction

; Menus -----------------------------------------------------

Function Menu1(int a_button = 0)
    
    a_button = _MESSAGE1_MENU.Show()

    ; || Add Carry Weight || Choose the amount by which you would like to increase your carry weight.

    If (a_button == 1)      ; Disable

        _PLAYERREF.RemoveSpell(_SPELL1)

    ElseIf (a_button == 2)  ; 100

        Menu2Array(0)

    ElseIf (a_button == 3)  ; 1K

        Menu2Array(9)

    ElseIf (a_button == 4)  ; 10K

        Menu2Array(18)

    ElseIf (a_button == 5)  ; 100K

        Menu2Array(27)

    ElseIf (a_button == 6)  ; 1M

        Menu2Array(36)

    Else ;index 0           ; Exit

        ; do nothing

    EndIf

EndFunction



Function Menu2(int a_button = 0)
    
    a_button = _MESSAGE2_MENU.Show()

    ; || Multiplier || Choose by how much to multiply the amount.

    _GLOBALVAR1_INDEX.SetValue(_array1[a_button]) ;sets a global variable based on the value stored in the array
    _PLAYERREF.AddSpell(_SPELL1)

EndFunction