// This file is part of www.nand2tetris.org

// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//  P R O G R A M   S T A R T
(INIT)
	@SCREEN
	D = A
	@R1
	M = D
	@KBD
	D = A - 1
	@R2
	M = D

(KBDIN)
	@R1
	D = M
	@R2
	D = D - M
	@INIT
	D;JEQ

	@KBD
	D = M
	@BLACK
	D;JNE
	@WHITE
	0;JMP

(BLACK)
	@R0
	M = -1
	@ITER
	0;JMP

(WHITE)
	@R0
	M = 0
	@ITER
	0;JMP

(ITER)
	@R0
	D = M

	@R1
	A = M
	M = D

	@R1
	M = M + 1

	@KBDIN
	0;JMP
