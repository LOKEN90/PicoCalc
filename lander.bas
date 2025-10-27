' ============================================
' CYBER-LUNAR DESCENT SIMULATOR v1.3
' For PicoCalc (MMBASIC)
' ============================================

Dim zone$(3)
zone$(0) = "Tycho Basin"
zone$(1) = "Crater Nexus"
zone$(2) = "Neo-Luna Port 3"
zone$(3) = "Darkside Outpost"

' limit thrustr readout to 2 digits
A% = Int(Rnd*100)
B% = Int(Rnd*100)
C% = Int(Rnd*100)

If A% < 10 Then thrA$ = " " + Str$(A%) Else thrA$ = Str$(A%)
If B% < 10 Then thrB$ = " " + Str$(B%) Else thrB$ = Str$(B%)
If C% < 10 Then thrC$ = " " + Str$(C%) Else thrC$ = Str$(C%)

landingzone$ = zone$(Int(Rnd*4))

gravity = 1 + Rnd * 2

Randomize Timer
CLS
Print ">> INITIATING DESCENT PROTOCOL <<"
Pause 500
Print landingzone$ ", Term. Link Est."
Pause 200
Print "Running Diagnostics"
For i = 1 To 5
  For dots = 1 To 3
    Print ".";
    Pause 200
  Next dots
  Print Chr$(8); Chr$(8); Chr$(8); "   "; Chr$(8); Chr$(8); Chr$(8);
Next i
Pause 750
Print "                             --------"
Print "                            | A: "; thrA$; "% |"
Print "Fuel Lines: OK | Thrusters:<| B: "; thrB$; "% |"
Print "                            | C: "; thrC$; "% |"
Print "                             --------"
Pause 200
Print "Calculating Gravitational Parameters"
For i = 1 To 7
  For dots = 1 To 3
    Print ".";
    Pause 200
  Next dots
  Print Chr$(8); Chr$(8); Chr$(8); "   "; Chr$(8); Chr$(8); Chr$(8);
Next i
Pause 500
Print "Gravimeter Sync: "; Int(Rnd*99+1); "% Stable"
Pause 200
Print "Gravity: ", gravity
Print "----------------------------------------"
Pause 400

' Initial conditions
altitude = 1000          ' meters
velocity = 0             ' m/s
fuel = 1200              ' units
' gravity = gravity        ' m/s per turn
maxThrust = 50           ' max thrust per turn

Print "Altitude:"; altitude; "m | Velocity:"; velocity; "m/s | Fuel:"; fuel
Print

Do While altitude > 0
  Print "Enter thrust (0-"; maxThrust; "): ";
  Input thrust
  If thrust < 0 Then thrust = 0
  If thrust > maxThrust Then thrust = maxThrust
  Color RGB(red)
  If velocity > 20 Then Print "          ** DESCENT UNSAFE **"
  Color RGB(green)

  ' fuel check
  If thrust > fuel Then
    thrust = fuel
  EndIf

  fuel = fuel - thrust
      ' fuel critical
  If fuel < 100 And fuel > 0 Then Print "         ** FUEL CRITICAL **"
      ' fuel empty
  Color RGB(red)
  If fuel = 0 Then Print "            ** FUEL EMPTY **"
  Color RGB(green)

  ' physics update
  velocity = velocity + gravity - thrust/10
  If velocity < -20 Then velocity = -20   ' cap upward motion
  altitude = altitude - velocity
  If altitude < 0 Then altitude = 0

  ' dynamic gravity / telemetry chatter
  If Rnd < 0.02 Then
    gravity = gravity + (Rnd * 2 - 1)
    Print "** GRAVITATIONAL ANOMALY DETECTED **"
  End If

  If Rnd < 0.05 Then Print ">> SYS ERR: CODE "; Int(Rnd*9999)
  If Rnd < 0.05 Then Print ">> COMM: Signal Degraded"

  ' telemetry readout
  Print "--------------------------------------------"
  Print "Altitude:"; Int(altitude); "m | Velocity:"; Int(velocity); "m/s | Fuel:"; fuel
  Print
Loop

' landing check
Print "      =============================  "
Print "      >> FINAL SEQUENCE COMPLETE <<"
Print "      ============================="
Print
If velocity <= 5 Then
  score = fuel * 10 + (5 - velocity) * 100
  If score < 0 Then score = 0
  Print "            TOUCHDOWN: SAFE"
  Pause 200
  Print "        Engaging docking clamps."
  Pause 400
  Print
  Print "        Docking clamps engaged."
  Print
  Pause 500
  Print "        Welcome to", landingzone$
  Print
  Print "      Mission Score: "; score
Else
  Print "             IMPACT DETECTED"
  Print
  Pause 400
  Print "        Salvage crews dispatched."
  Print
  Print "       Location: ", landingzone$
  Print
  Print "   Velocity at impact:"; velocity; "m/s"
EndIf

Pause 1000
Print
Print "        ========================"
Print "        >> SESSION TERMINATED <<"
Print "        ========================"
End
