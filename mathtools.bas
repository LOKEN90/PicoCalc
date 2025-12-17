'=====================================
' MATH TOOLBOX
' Jesse Miller (2025) - Version 2.0
' Equation solver for PicoCalc
'=====================================

Option base 1
Option Explicit

Dim M$(100)
Dim Integer IdX, choice, MainCount


MainMenu

'--- Main Menu ---
Sub MainMenu

  M$(1) = "Pythagorean Theorem"
  M$(2) = "Ohm's Law"
  M$(3) = "Quadratic Equation"
  M$(4) = "Shutdown"
  
  MainCount = 4

Do
CLS
  ' Syntax: choice = Fn_Menu(Title$, MenuArray$(), TotalItems)
  choice = Fn_Menu("--- EQUATION SOLVER ---", M$(), MainCount)

  Select Case choice
    Case 1
      Pythag
    Case 2
      OhmsLaw
    Case 3
      Quadratic
    Case 4
      cls
      End
  End Select
Loop
End Sub


'====================================
'Equation Subroutines
'====================================

'Pythagorean Theorem Solver

Sub Pythag

  M$(1) = "Side A or B"
  M$(2) = "Hypoteneuse (C)"
  M$(3) = "MAIN MENU"

  local float a, b, c
 
  do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("PYTHAGOREAN THEOREM", M$(), 3)
    CLS

    Select Case Choice
      Case 1
        ' a = sqr(c^2 - b^2)
        Input "Enter length of known side"; b
        Input "Enter length of hypoteneuse"; c
        a = Sqr(c^2 - b^2)
        Print
        Print "Unknown side: "; a
      Case 2
        ' c = sqr(a^2 + b^2)
        Input "Enter length side A"; a
        Input "Enter length side B"; b
        c = Sqr(a^2 + b^2)
        Print
        Print "Hypoteneuse length: "; c
      Case 3
        MainMenu
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then Exit do
    Loop
  loop
End Function


' Ohm's Law Solver

Sub OhmsLaw

  M$(1) = "Voltage (volts)"
  M$(2) = "Current (amperes)"
  M$(3) = "Resistance (Ohm's)"
  M$(4) = "MAIN MENU"
  
  local float v,i,r

  do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("OHM'S LAW", M$(), 4)
    CLS

    Select Case Choice
      Case 1
        ' V = I * R
        Input "Current in amperes"; I
        Input "Resistance in Ohm's"; R
        V = I * R
        Print
        Print "Voltage: "; V; " volts"
      Case 2
        ' I = V / R 
        Input "Voltage in volts"; V
        Input "Resistance in Ohm's"; R
        I = V / R
        Print
        Print "Current: "; I; " amperes"
      Case 3
        ' R = V / I
        Input "Voltage in volts"; V
        input "Current in amperes"; I
        R = V / I
        print
        print "Resistance: "; R; " Ohm's"
      case 4
        MainMenu
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then exit do
    Loop
  loop
End Function


' Quadratic Equation/Roots Solver

Sub Quadratic

  M$(1) = "A"
  M$(2) = "B"
  M$(3) = "C"
  M$(4) = "X (roots)"
  M$(5) = "MAIN MENU"
  
  local float a,b,c,x,x1,x2,disc

  do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("QUADRATIC EQUATION", M$(), 5)
  CLS

    Select Case Choice
      Case 1
        ' a = -(bx + c) / x^2)
        Input "Enter value of B"; b
        Input "Enter value of C"; c
        input "Enter value of x"; x
        a = -(b*x + c) / x^2
        Print
        Print "Value of A: "; a
      Case 2
        ' b = -(ax^2 + c) / x
        Input "Enter value for A"; a
        Input "Enter value for C"; c
        input "Enter value for X"; x
        b = -(a*x^2 + c) / x
        Print
        Print "Value of B: "; b
      Case 3
        ' c = -(ax^2 + bx)
        Input "Enter value for A"; a
          Input "Enter value for B"; b
        input "Enter value for an X"; x
        c = -(a*x^2 + b*x)
        Print
        Print "Value of C: "; c
      case 4
        ' x1 = (-b + Sqr(disc)) / (2*a)
        ' x2 = (-b - Sqr(disc)) / (2*a)
        input "Enter value of A"; a
        input "Enter value of B"; b
        input "Enter value of C"; c
        ' Check for complex or imaginary roots
        disc = b^2 - 4 * a * c
        if disc < 0 Then
          print
          print "No Real Roots"
        else
          x1 = (-b + Sqr(disc)) / (2*a)
          x2 = (-b - Sqr(disc)) / (2*a)
          print
          print "Value for x1: "; x1
          Print "Value for x2: "; x2
        end if
      case 5
        MainMenu
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then exit do
    Loop
  loop
End Function


'=====================================
' THE REUSABLE ENGINE
'=====================================

Function Fn_Menu(T$, M$(), Count)
  Local Selected = 1, Offset = 1, Key, I, Y
  Const Visible = 12 ' Number of displayed lines
  Const TX = 20, TY = 60, LH = 20 ' Text X, Text Y, Line Height

  Do
    Text 160, 15, T$, "CM", 1, 1, RGB(WHITE), RGB(BLUE)'Title placement

  ' Draw Menu Items
    For I = 1 To Visible
      Idx = Offset + I - 1
      Y = TY + (I - 1) * LH

      If Idx <= Count Then
        If Idx = Selected Then
        ' Draw a highlight bar

        Colour RGB(BLACK), RGB(GREEN)
        Else
        Colour RGB(WHITE), RGB(BLACK)
        End If
        Print @(TX, Y) M$(Idx)

      End If
    Next I

    ' Handle Input
    Do : Key = Asc(Inkey$) : Loop Until Key > 0

    Select Case Key
      Case 128 ' Up
        If Selected > 1 Then
          Selected = Selected - 1
          If Selected < Offset Then Offset = Offset - 1
        End If
      Case 129 ' Down
        If Selected < Count Then
          Selected = Selected + 1
          If Selected > Offset + Visible - 1 Then Offset = Offset + 1
        End If
      Case 13 ' Enter
        Fn_Menu = Selected
        Colour RGB(WHITE), RGB(BLACK) ' Reset colors
        Exit Function
    End Select
  Loop
End Function



'======================================
' Sub template for new equation
'======================================
/*
Sub 'sub name

  M$(1) = "menu item 1"
  M$(2) = "menu item 2"
  M$(3) = "menu item 3"
  M$(4) = "menu item 4"
  
  local float 'declare variables needed for the equation
  
  do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("Equation title", M$(), 4)' 4 = #of menu items
    CLS

    Select Case Choice
      Case 1
        'case 1 equation
        Input ""; I ' Ask for knowns and put approriate variables for I and R
        Input ""; R
        V = I * R ' Equation in the form that works for desired variable
        Print
        Print "Voltage: "; V; " volts" ' Print answer however you want
        'REPEAT AS NECESSARY FFOR EEACH VARIABLE AND EQUATION
      Case 2
        ' I = V / R 
        Input "Voltage in volts"; V
        Input "Resistance in Ohm's"; R
        I = V / R
        Print
        Print "Current: "; I; " amperes"
      Case 3
        ' R = V / I
        Input "Voltage in volts"; V
        input "Current in amperes"; I
        R = V / I
        print
        print "Resistance: "; R; " Ohm's"
      case 4
        MainMen ' return to main menu
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then exit do ' Returns to sub menu
    Loop
  loop
End Function
*/
