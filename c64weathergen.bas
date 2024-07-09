10  PRINT TAB(3);"WELCOME TO WEATHER DATA GENERATOR"
20  PRINT TAB(3);"****     BY PADDY NEESON     ****"
30  PRINT:PRINT:PRINT
40  REM N1 = MINIMUM NUMBER OF DATA SETS PER DATE
50 REM N2 = MAXIMUM NUMBER OF DATA SETS PER DATE
60 REM L1 = MINIMUM LONGTITUDE
70 REM L2 = MAXIMUM LONGTITUDE
80 REM L3 = MINIMUM LATITUDE
90 REM L4 = MAXIMUM LATITUDE
100 REM T1 = MINIMUM TEMP
110 REM T2 = MAXIMUM TEMP
120 REM TU = TEMPUNIT ARRAY
130 REM W1 = MINIMUM WIND
140 REM W2 = MAXIMUM WIND
150 REM WD = WIND DIRECTION ARRAY
160 REM P1 = MINIMUM PRECIPITATION
170 REM P2 = MAXIMUM PRECIPITATION
180 REM ********************************************************
190 REM INITIALIZE VARIABLES
200 REM ********************************************************
210 N1=5
220 N2=10
230 L1=-180.000000
240 L2=180.999999
250 L3=-90.000000
260 L4=90.999999
270 T1=-90.0
280 T2=60.0
290 DIM TU$(1):TU$(0)="C":TU$(1)="F"
300 W1=0.0
310 W2=200.0
320 DIM WD$(7):WD$(0)="N":WD$(1)="NE":WD$(2)="E":WD$(3)="SE"
330 WD$(4)="S":WD$(5)="SW":WD$(6)="W":WD$(7)="NW"
340 P1=0
350 P2=100
360 REM *********************************************************
370 REM ASK THE USER TO INPUT HOW MANY DATES DATA IS REQUIRED FOR
380 REM *********************************************************
390 PRINT "GENERATE DATA FOR HOW MANY DATES >";
400 INPUT N$
410 REM N=INT(RND(0)*10)+1
420 PRINT"GENERATING DATA FOR "N$" DATES":PRINT
430 A = RND(-L1)
440 OPEN 8,8,2,"@O:FILENAME.WIS,W,S"
450 FOR X=1 TO VAL(N$)
460 REM *********************
470 REM GENERATE RANDOM DATES
480 REM *********************
490 D1$=MID$(STR$(INT(RND(0)*2)+2023),2)
500 D2$=MID$(STR$(INT(RND(0)*12)+1),2)
510 D3$=MID$(STR$(INT(RND(0)*31)+1),2)
520 D4$=MID$(STR$(INT(RND(0)*24)+1),2)
530 D5$=MID$(STR$(INT(RND(0)*59)+1),2)
540 IF LEN(D2$)<2 THEN D2$ = "0"+D2$
550 IF LEN(D3$)<2 THEN D3$ = "0"+D3$
560 IF LEN(D4$)<2 THEN D4$ = "0"+D4$
570 IF LEN(D5$)<2 THEN D5$ = "0"+D5$
580 PRINT#8,D1$"-"D2$"-"D3$" "D4$":"D5$"UTC"
590 L=INT(RND(N1)*N2)+1
600 PRINT"WRITING "STR$(L)" ROWS TO FILE"
610 FOR Y=1 TO L
620 LO=(RND(-L1)*L2)-10
630 LA=(RND(-L3)*L4)-10
640 TV=(RND(-T1)*T2)-10
650 IV$=STR$(TV)
660 LT$="":LR$=""
670 FOR S=1 TO LEN(IV$)
680 IF MID$(IV$,0+S,1)="." THEN LT$=LEFT$(IV$,0+(S-1))
690 IF MID$(IV$,0+S,1)="." THEN LR$=MID$(IV$,0+(S+1),1)
700 IF LT$<>"" AND LR$<>"" THEN TV$=LT$+"."+LR$:GOTO720
710 NEXT S
720 TT$=TU$(INT(RND(0)*1)+1)
730 WV=(RND(W1)*W2)+1
740 WV$=STR$(WV)
750 WT$="":WR$=""
760 FOR W=1 TO LEN(WV$)
770 IF MID$(WV$,0+W,1)="." THEN WT$=LEFT$(WV$,0+(W-1))
780 IF MID$(WV$,0+W,1)="." THEN WR$=MID$(WV$,0+(W+1),1)
790 IF WT$<>"" AND WR$<>"" THEN WV$=WT$+"."+WR$:GOTO810
800 NEXT W
810 WU$="KM/H"
820 WA$=WD$(INT(RND(1)*7)+1)
830 PC=INT(RND(P1)*P2)+1
840 PRINT#8,LO,LA,TV$,TT$,WV$," ",WU$,WA$,PC
850 NEXT Y
860 NEXT X
870 CLOSE 8
