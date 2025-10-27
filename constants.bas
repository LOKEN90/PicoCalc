' === PicoCalc Searchable Constants (universal version) ===
' Reads constants.txt (format: NAME,VALUE)

OPTION EXPLICIT

DIM term$, line$, name$, value$, tmp$, ch$
DIM found AS INTEGER
DIM i%, j%

PRINT "=== Constants Search ==="
PRINT "Type part of a name, * for all, or Q to quit"
PRINT

DO
  INPUT "Search: ", term$
  IF term$ = "" THEN PRINT : CONTINUE DO

  ' --- Trim leading/trailing spaces ---
  DO WHILE LEFT$(term$,1) = " " AND LEN(term$) > 0
    term$ = MID$(term$,2)
  LOOP
  DO WHILE RIGHT$(term$,1) = " " AND LEN(term$) > 0
    term$ = LEFT$(term$,LEN(term$)-1)
  LOOP

  ' --- Convert to uppercase manually ---
  FOR i% = 1 TO LEN(term$)
    ch$ = MID$(term$, i%, 1)
    IF ch$ >= "a" AND ch$ <= "z" THEN
      MID$(term$, i%, 1) = CHR$(ASC(ch$) - 32)
    ENDIF
  NEXT i%

  ' --- Quit option ---
  IF term$ = "Q" THEN
    PRINT "Exiting..."
    END
  ENDIF

  OPEN "constants.txt" FOR INPUT AS #1
  found = 0

  DO WHILE NOT EOF(#1)
    LINE INPUT #1, line$
    name$ = FIELD$(line$, 1, ",")
    value$ = FIELD$(line$, 2, ",")

    ' --- Uppercase name$ manually ---
    tmp$ = name$
    FOR j% = 1 TO LEN(tmp$)
      ch$ = MID$(tmp$, j%, 1)
      IF ch$ >= "a" AND ch$ <= "z" THEN
        MID$(tmp$, j%, 1) = CHR$(ASC(ch$) - 32)
      ENDIF
    NEXT j%

    ' --- Fuzzy match or list all ---
    IF term$ = "*" OR INSTR(tmp$, term$) THEN
      PRINT LEFT$(name$ + SPACE$(20), 20); " "; value$
      found = 1
    ENDIF
  LOOP

  CLOSE #1

  IF found = 0 THEN PRINT "No matches found."
  PRINT
LOOP
