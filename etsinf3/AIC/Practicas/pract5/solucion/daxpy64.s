        .data
        ; Vector x
x:	    .double 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0
        .double 10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0
        .double 20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0
        .double 30.0,31.0,32.0,33.0,34.0,35.0,36.0,37.0,38.0,39.0
        .double 40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0
        .double 50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0
        .double 60.0,61.0,62.0,63.0
        ; Vector y
y:      .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        .double 100, 100, 100, 100, 100, 100, 100, 100
        ; Vector z, 64*8 bytes/elem
z:      .space 512
fin_z:
a:      .double 2

	.text
main:
	dadd r1, $gp, x
	dadd r2, $gp, y
	dadd r3, $gp, z
	dadd r4, $gp, fin_z
	l.d f0, a($gp)
loop:
	l.d f1, 0(r1)		; Load X
	l.d f2, 0(r2)		; Load Y
	mul.d f3, f1, f0	; a*X
	add.d f4, f2, f3	; a*X +Y
	s.d f4, 0(r3)		; Store Z
	dadd r1, r1, 8
	dadd r2, r2, 8
	dadd r3, r3, 8
	dsub r5, r4, r3
	bnez r5, loop
exit:
	trap 0