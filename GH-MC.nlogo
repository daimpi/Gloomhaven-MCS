globals [g-catsheets g-amc-deck g-freq-record g-reshuffle?]
turtles-own [category value rolling? special? shuffle?]


to reset
  ca
  set st_x0 1
  set st_-2 1
  set st_-1 5
  set st_0 6
  set st_+1 5
  set st_+2 1
  set st_x2 1
  set curses 0
  set blesses 0
  set sp1-freq 0
  set sp2-freq 0
  set sp3-freq 0
  set sp4-freq 0
  set sp5-freq 0
  set sp6-freq 0
  set sp7-freq 0
  set sp8-freq 0
  set sp9-freq 0
  set sp10-freq 0
end


to setup
  ca
  create-catsheets
  foreach g-catsheets [ cur-catsheet ->
    crt item 1 cur-catsheet [
      set category item 0 cur-catsheet
      set value item 2 cur-catsheet
      set rolling? item 3 cur-catsheet
      set special? item 4 cur-catsheet
      set shuffle? item 5 cur-catsheet
    ]
  ]
  set g-amc-deck shuffle sort turtles
  let #categories [category] of max-one-of turtles [category]
  set g-freq-record n-values #categories [0]
end





to create-catsheets
  set g-catsheets (list standard_x0 standard_-2 standard_-1 standard_0 standard_+1 standard_+2 standard_x2 curse bless special1 special2 special3 special4 special5 special6 special7 special8 special9 special10)
end




to draw
  let reshuffle? false
  ask first g-amc-deck [
    set g-amc-deck but-first g-amc-deck
    if shuffle? or empty? g-amc-deck [
     set reshuffle? true
    ]
    let mylistcat category - 1
    set g-freq-record replace-item mylistcat g-freq-record (item mylistcat g-freq-record + 1)
    if remove-bless-curse and (category = 8 or category = 9) [
     die
    ]
  ]
  if reshuffle? [
    set g-amc-deck shuffle sort turtles
  ]
end



to-report standard_x0
  ; category, #of cards, value, rolling?, special?, shuffle?
  report (list 1 st_x0 0 false false true)
end

to-report standard_-2
  report (list 2 st_-2 -2 false false false)
end

to-report standard_-1
  report (list 3 st_-1 -1 false false false)
end

to-report standard_0
  report (list 4 st_0 0 false false false)
end

to-report standard_+1
  report (list 5 st_+1 1 false false false)
end

to-report standard_+2
  report (list 6 st_+2 2 false false false)
end

to-report standard_x2
  report (list 7 st_x2 0 false false true)
end

to-report curse
  report (list 8 curses 0 false false false)
end

to-report bless
    report (list 9 blesses 0 false false false)
end



; special attack modifiers
to-report special1
  report (list 10 sp1-freq sp1-val sp1-roll sp1-special false)
end

to-report special2
  report (list 11 sp2-freq sp2-val sp2-roll sp2-special false)
end

to-report special3
  report (list 12 sp3-freq sp3-val sp3-roll sp3-special false)
end

to-report special4
  report (list 13 sp4-freq sp4-val sp4-roll sp4-special false)
end

to-report special5
  report (list 14 sp5-freq sp5-val sp5-roll sp5-special false)
end

to-report special6
  report (list 15 sp6-freq sp6-val sp6-roll sp7-special false)
end

to-report special7
  report (list 16 sp7-freq sp7-val sp7-roll sp7-special false)
end

to-report special8
  report (list 17 sp8-freq sp8-val sp8-roll sp8-special false)
end

to-report special9
  report (list 18 sp9-freq sp9-val sp9-roll sp9-special false)
end

to-report special10
  report (list 19 sp10-freq sp10-val sp10-roll sp10-special false)
end

; let draws sum g-freq-record print draws let dist map [x -> round ((x / draws) * 100)] g-freq-record print dist
@#$#@#$#@
GRAPHICS-WINDOW
210
10
257
58
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-1
1
-1
1
0
0
1
ticks
30.0

SLIDER
22
117
194
150
base-damage
base-damage
1
10
2.0
1
1
NIL
HORIZONTAL

SWITCH
23
158
187
191
remove-bless-curse
remove-bless-curse
1
1
-1000

TEXTBOX
28
224
103
266
Standard Attack Modifiers
11
0.0
1

INPUTBOX
25
273
75
333
st_x0
1.0
1
0
Number

INPUTBOX
24
335
74
395
st_-2
1.0
1
0
Number

INPUTBOX
25
398
75
458
st_-1
5.0
1
0
Number

INPUTBOX
24
461
74
521
st_0
6.0
1
0
Number

INPUTBOX
23
523
73
583
st_+1
5.0
1
0
Number

INPUTBOX
22
585
72
645
st_+2
1.0
1
0
Number

INPUTBOX
23
648
73
708
st_x2
1.0
1
0
Number

INPUTBOX
22
725
72
785
curses
0.0
1
0
Number

INPUTBOX
22
787
72
847
blesses
0.0
1
0
Number

BUTTON
117
13
180
46
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
22
11
85
44
NIL
reset
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
294
25
444
43
Special Attack Modifiers
11
0.0
1

INPUTBOX
291
57
341
117
sp1-freq
3.0
1
0
Number

INPUTBOX
290
122
350
182
sp1-val
0.0
1
0
Number

SWITCH
289
187
392
220
sp1-roll
sp1-roll
1
1
-1000

SWITCH
287
224
404
257
sp1-special
sp1-special
0
1
-1000

CHOOSER
35
64
173
109
attack-mode
attack-mode
"advantage" "normal" "disadvantage"
1

INPUTBOX
470
55
520
115
sp2-freq
0.0
1
0
Number

INPUTBOX
468
121
518
181
sp2-val
0.0
1
0
Number

SWITCH
468
187
558
220
sp2-roll
sp2-roll
1
1
-1000

SWITCH
467
226
570
259
sp2-special
sp2-special
1
1
-1000

INPUTBOX
652
50
702
110
sp3-freq
0.0
1
0
Number

INPUTBOX
833
45
883
105
sp4-freq
0.0
1
0
Number

INPUTBOX
997
49
1047
109
sp5-freq
0.0
1
0
Number

INPUTBOX
287
325
337
385
sp6-freq
0.0
1
0
Number

INPUTBOX
460
325
510
385
sp7-freq
0.0
1
0
Number

INPUTBOX
655
325
705
385
sp8-freq
0.0
1
0
Number

INPUTBOX
833
324
883
384
sp9-freq
0.0
1
0
Number

INPUTBOX
998
320
1055
380
sp10-freq
0.0
1
0
Number

INPUTBOX
652
113
702
173
sp3-val
0.0
1
0
Number

INPUTBOX
834
109
884
169
sp4-val
0.0
1
0
Number

INPUTBOX
998
111
1048
171
sp5-val
0.0
1
0
Number

INPUTBOX
287
388
337
448
sp6-val
0.0
1
0
Number

INPUTBOX
458
388
508
448
sp7-val
0.0
1
0
Number

INPUTBOX
655
388
705
448
sp8-val
0.0
1
0
Number

INPUTBOX
834
386
884
446
sp9-val
0.0
1
0
Number

INPUTBOX
998
383
1053
444
sp10-val
0.0
1
0
Number

SWITCH
651
178
741
211
sp3-roll
sp3-roll
1
1
-1000

SWITCH
833
172
923
205
sp4-roll
sp4-roll
1
1
-1000

SWITCH
998
175
1088
208
sp5-roll
sp5-roll
1
1
-1000

SWITCH
285
450
375
483
sp6-roll
sp6-roll
1
1
-1000

SWITCH
457
449
547
482
sp7-roll
sp7-roll
1
1
-1000

SWITCH
654
451
744
484
sp8-roll
sp8-roll
1
1
-1000

SWITCH
834
447
924
480
sp9-roll
sp9-roll
1
1
-1000

SWITCH
997
446
1087
479
sp10-roll
sp10-roll
1
1
-1000

SWITCH
650
213
750
246
sp3-special
sp3-special
1
1
-1000

SWITCH
832
206
949
239
sp4-special
sp4-special
1
1
-1000

SWITCH
652
486
769
519
sp8-special
sp8-special
1
1
-1000

SWITCH
456
485
573
518
sp7-special
sp7-special
1
1
-1000

SWITCH
997
209
1114
242
sp5-special
sp5-special
1
1
-1000

SWITCH
834
484
951
517
sp9-special
sp9-special
1
1
-1000

SWITCH
996
481
1120
514
sp10-special
sp10-special
1
1
-1000

SWITCH
282
486
399
519
sp6-special
sp6-special
1
1
-1000

@#$#@#$#@
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@