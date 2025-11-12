' ==========================
' MATH TOOLBOX
' Jesse Miller (2025) - Version 1.2
' Equation solver for PicoCalc 
' ==========================

Option BASE 1

Do
CLS
Print "            |==============|"
Print "            | MATH TOOLBOX |"
Print "            |==============|"
Print
Print "1. Quadratic Equation"
Print "2. Pythagorean Theorem"
Print "3. Ohm's Law"
Print "0. Exit"
Print
Input "Select option: ", mainChoice

If mainChoice = 1 Then
    GoSub QuadraticMenu
ElseIf mainChoice = 2 Then
    GoSub PythagoreanMenu
ElseIf mainChoice = 3 Then
    GoSub OhmsMenu
ElseIf mainChoice = 0 Then
    End
End If
Loop

End


' --------------------------
' Quadratic Equation Menu
' --------------------------
QuadraticMenu:

Do
CLS
Print "          Quadratic Equation"
Print "          ------------------"
Print "          ax^2 + bx + c = 0"
Print
Print "Solve for:"
Print "1. x (roots)"
Print "2. a"
Print "3. b"
Print "4. c"
Print "0. Back"
Print "======="
Input "Choice: ", quadChoice

If quadChoice = 1 Then GoSub SolveX
If quadChoice = 2 Then GoSub SolveA
If quadChoice = 3 Then GoSub SolveB
If quadChoice = 4 Then GoSub SolveC
If quadChoice = 0 Then Exit Do
Loop

Return


' --------------------------
' Solve for x (roots)
' --------------------------
SolveX:
CLS
Print "Solve for x (roots)"
Print
Input "a = ", a
Input "b = ", b
Input "c = ", c

disc = b^2 - 4*a*c

If disc < 0 Then
    Print
    Print "No real roots"
Else
    x1 = (-b + Sqr(disc)) / (2*a)
    x2 = (-b - Sqr(disc)) / (2*a)
    Print
    Print "x1 = "; x1
    Print "x2 = "; x2
End If

Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solve for a (given x,b,c)
' --------------------------
SolveA:
CLS
Print "Solve for a"
Print
Input "x = ", x
Input "b = ", b
Input "c = ", c

' a = -(bx + c) / x^2
If x = 0 Then
    Print
    Print "Error: x cannot be 0"
Else
    a = -(b*x + c) / (x^2)
    Print
    Print "a = "; a
End If

Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solve for b (given x,a,c)
' --------------------------
SolveB:
CLS
Print "Solve for b"
Print
Input "x = ", x
Input "a = ", a
Input "c = ", c

' b = -(ax^2 + c) / x
If x = 0 Then
    Print
    Print "Error: x cannot be 0"
Else
    b = -(a*x^2 + c) / x
    Print
    Print "b = "; b
End If

Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solve for c (given x,a,b)
' --------------------------
SolveC:
CLS
Print "Solve for c"
Print
Input "x = ", x
Input "a = ", a
Input "b = ", b

' c = -(ax^2 + bx)
c = -(a*x^2 + b*x)
Print
Print "c = "; c

Print : Input "Press Enter to return...", dummy$
Return


' ==========================
' Pythagorean Theorem Solver
' ==========================

PythagoreanMenu:
Do
CLS
Print "          Pythagorean Theorem"
Print "          -------------------"
Print "            a^2 + b^2 = c^2"
Print
Print "Solve for: "
Print "1. c (Hypotenuse)"
Print "2. a or b (Side)"
Print "0. Back"
Print "======="
Input "Choice: ", pythChoice

If pythChoice = 1 Then GoSub SolvePc
If pythChoice = 2 Then GoSub SolvePab
If pythChoice = 0 Then Exit Do
Loop
Return


' --------------------------
' Solve For Hypotenuse
' --------------------------
SolvePc:
CLS
Print "Solve for HYPOTENUSE"
Print
Input "Side a = ", a
Input "Side b = ", b
' c = sqr(a^2 + b^2)
c = Sqr(a^2 + b^2)
Print
Print "Hypotenuse = "; c
Print
Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Side Solver
' --------------------------
SolvePab:
CLS
Print "Solve for unknown side (a or b)"
Print
Input "Known Side = ", b
Input "Hypotenuse = ", c
' a = sqr(c^2 - b^2)
a = Sqr(c^2 - b^2)
If a = 0 Then
Print
Print "Not a Triangle!!! Check Values"
Else
Print
Print "Unknown Side = "; a
End If
Print : Input "Press Enter to return...", dummy$
Return



' ==========================
' Ohm's Law Solver
' ==========================

OhmsMenu:
Do
CLS
Print "               Ohm's Law"
Print "               ---------"
Print "               V = I * R"
Print
Print "Solve for: "
Print "1. V (Voltage)"
Print "2. I (Current)"
Print "3. R (Resistance)"
Print "0. Back"
Print "======="
Input "Choice: ", ohmChoice

If ohmChoice = 1 Then GoSub SolveOv
If ohmChoice = 2 Then GoSub SolveOi
If ohmChoice = 3 Then GoSub SolveOr
If ohmChoice = 0 Then Exit Do
Loop
Return


' --------------------------
' Solve For Voltage
' --------------------------
SolveOv:
CLS
Print "Solve For Voltage"
Print
Input "Current (I) = ", I
Input "Resistance (R) = ", R
' V = I * R
V = I * R
Print
Print "Voltage (V) = "; V
Print
Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solve For Current
' --------------------------
SolveOi:
CLS
Print "Solve For Current"
Print
Input "Voltage (V) = ", V
Input "Resistance (R) = ", R
' I = V / R
I = V / R
Print
Print "Current (I) = "; I
Print
Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solve For Resistance
' --------------------------
SolveOr:
CLS
Print "Solve For Resistance"
Print
Input "Voltage (V) = ", V
Input "Current (I) = ", I
' R = V / I
R = v / I
Print
Print "Resistance (R) = "; R
Print
Print : Input "Press Enter to return...", dummy$
Return



' below is basic layout for new eq

If 0 Then
' =================
' Title of Equztion
' =================

PythagoreanMenu: 'GoSub name
Do
CLS
Print "Equation description/title"
Print "-------------"
Print "1. Solver/Operation 1"
Print "2. Solver/Operation 2"
Print "0. Back"

Input "Choice: ", choice

If choice = 1 Then GoSub NewSolver1
If choice = 2 Then GoSub NewSolver2
If choice = 0 Then Exit Do
Loop
Return


' --------------------------
' Solver/Operation 1
' --------------------------
NewSolver1:
CLS
Print "Solver 1 description"
' <-- put your calculations here -->
Print "Result = "; result
Print : Input "Press Enter to return...", dummy$
Return


' --------------------------
' Solver/Operation 2
' --------------------------
NewSolver2:
CLS
Print "Solver 2 description"
' <-- put your calculations here -->
Print "Result = "; result
Print : Input "Press Enter to return...", dummy$
Return
End If

