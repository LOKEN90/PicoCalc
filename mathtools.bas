'=====================================
' MATH TOOLBOX
' Jesse Miller (2025) - Version 2.1.1
' Equation solver for PicoCalc
'=====================================

Option base 1
Option Explicit

Dim M$(100)
Dim Integer IdX, choice, MainCount

Play tone 1000,1000,100

MainMenu

'--- Main Menu ---
Sub MainMenu

  Do
    CLS
    M$(1) = "Pythagorean Theorem"
    M$(2) = "Ohm's Law"
    M$(3) = "Quadratic Equation"
    M$(4) = "Shutdown"

    MainCount = 4
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
        CLS
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

  Local float a, b, c

  Do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("PYTHAGOREAN THEOREM", M$(), 3)
    CLS

   ' RBox 0,6,320,40,8,&H00FF00,&H008800
    'RBox 20,0,50,16,8,&H00FF00,&H00FF00

    Select Case Choice
      Case 1
        ' a = sqr(c^2 - b^2)
        Print
        Print
        Input "  Enter length of known side"; b
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
        Exit Sub
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then Exit Do
    Loop
  Loop
End Function


' Ohm's Law Solver

Sub OhmsLaw

  M$(1) = "Voltage (volts)"
  M$(2) = "Current (amperes)"
  M$(3) = "Resistance (Ohm's)"
  M$(4) = "MAIN MENU"

  Local float v,i,r

  Do
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
        Input "Current in amperes"; I
        R = V / I
        Print
        Print "Resistance: "; R; " Ohm's"
      Case 4
        Exit Sub
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then Exit Do
    Loop
  Loop
End Function


' Quadratic Equation/Roots Solver

Sub Quadratic

  M$(1) = "A"
  M$(2) = "B"
  M$(3) = "C"
  M$(4) = "X (roots)"
  M$(5) = "MAIN MENU"

  Local float a,b,c,x,x1,x2,disc

  Do
    CLS
    Print @(10, 40) "Solve for:"
    Choice = Fn_Menu("QUADRATIC EQUATION", M$(), 5)
  CLS

    Select Case Choice
      Case 1
        ' a = -(bx + c) / x^2)
        Input "Enter value of B"; b
        Input "Enter value of C"; c
        Input "Enter value of x"; x
        a = -(b*x + c) / x^2
        Print
        Print "Value of A: "; a
      Case 2
        ' b = -(ax^2 + c) / x
        Input "Enter value for A"; a
        Input "Enter value for C"; c
        Input "Enter value for X"; x
        b = -(a*x^2 + c) / x
        Print
        Print "Value of B: "; b
      Case 3
        ' c = -(ax^2 + bx)
        Input "Enter value for A"; a
          Input "Enter value for B"; b
        Input "Enter value for an X"; x
        c = -(a*x^2 + b*x)
        Print
        Print "Value of C: "; c
      Case 4
        ' x1 = (-b + Sqr(disc)) / (2*a)
        ' x2 = (-b - Sqr(disc)) / (2*a)
        Input "Enter value of A"; a
        Input "Enter value of B"; b
        Input "Enter value of C"; c
        ' Check for complex or imaginary roots
        disc = b^2 - 4 * a * c
        If disc < 0 Then
          Print
          Print "No Real Roots"
        Else
          x1 = (-b + Sqr(disc)) / (2*a)
          x2 = (-b - Sqr(disc)) / (2*a)
          Print
          Print "Value for x1: "; x1
          Print "Value for x2: "; x2
        End If
      Case 5
        Exit Sub
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then Exit Do
    Loop
  Loop
End Function


'=====================================
' THE REUSABLE MENU
'=====================================

Function Fn_Menu(T$, M$(), Count)
  Local Selected = 1, Offset = 1, Key, I, Y
  Const Visible = 12 ' Number of displayed lines
  Const TX = 20, TY = 52, LH = 16 ' Text X, Text Y, Line Height

    ' Draw Menu Boxes
    RBox 0, 0, 320, 30, 8, &H00FF00 'Top Outline
    RBox 5, 5, 310, 20, 5, &H00FF00, &H00CC00 'Top main
    RBox 0, 32, 320, 266, 8, &H00FF00, &H003300 'Center Menu Display
    RBox 0, 300, 320, 20, 8,  &H00FF00, &H00CC00 'Footer

    Text 160, 16, T$, "CM", 4, 1, &H000000, &H00CC00 'Title placement
    'Footer Text
    Text 160, 310, "*** [UP/DN]=Navigate  [ENTER]=Select ***", "CM", 7, 1, &H000000, &H00CC00

  Do
  ' Draw Menu Items
    For I = 1 To Visible
      Idx = Offset + I - 1
      Y = TY + (I - 1) * LH

      If Idx <= Count Then
        If Idx = Selected Then
        ' Draw a highlight bar
        Colour &H000000, &H00FF00
        Else
        Colour &H00FF00, &H003300
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
        Else
          Play tone 400,400,150
        End If
      Case 129 ' Down
        If Selected < Count Then
          Selected = Selected + 1
          If Selected > Offset + Visible - 1 Then Offset = Offset + 1
        Else
          Play tone 400,400,150
        End If
      Case 13 ' Enter
        Play Tone 800,800,30
        Play Tone 1200,1200,30
        Fn_Menu = Selected
        Colour &H00FF00, &H000000 ' Reset colors
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
        Exit sub ' return to main menu
    End Select

    Pause 1000
    Print "Press ESC to go back"

    Do
      If Inkey$ = Chr$(27) Then exit do ' Returns to sub menu
    Loop
  loop
End Function
*/

