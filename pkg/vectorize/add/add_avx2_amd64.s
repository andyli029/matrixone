// Code generated by command: go run avx2.go -out avx2.s -stubs avx2_stubs.go. DO NOT EDIT.

#include "textflag.h"

// func int8AddAvx2Asm(x []int8, y []int8, r []int8)
// Requires: AVX, AVX2
TEXT ·int8AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

int8AddBlockLoop:
	CMPQ    BX, $0x00000200
	JL      int8AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDB  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDB  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDB  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDB  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDB  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDB  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDB  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDB  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDB  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDB  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDB  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDB  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDB  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDB  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDB  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDB  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000200, BX
	JMP     int8AddBlockLoop

int8AddTailLoop:
	CMPQ    BX, $0x00000020
	JL      int8AddDone
	VMOVDQU (AX), Y0
	VPADDB  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000020, BX
	JMP     int8AddTailLoop

int8AddDone:
	CMPQ    BX, $0x00000010
	JL      int8AddDone1
	VMOVDQU (AX), X0
	VPADDB  (CX), X0, X0
	VMOVDQU X0, (DX)

int8AddDone1:
	RET

// func int8AddScalarAvx2Asm(x int8, y []int8, r []int8)
// Requires: AVX, AVX2, SSE2
TEXT ·int8AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVBLSX      x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTB X0, Y0

int8AddScalarBlockLoop:
	CMPQ    BX, $0x000001e0
	JL      int8AddScalarTailLoop
	VPADDB  (CX), Y0, Y1
	VPADDB  32(CX), Y0, Y2
	VPADDB  64(CX), Y0, Y3
	VPADDB  96(CX), Y0, Y4
	VPADDB  128(CX), Y0, Y5
	VPADDB  160(CX), Y0, Y6
	VPADDB  192(CX), Y0, Y7
	VPADDB  224(CX), Y0, Y8
	VPADDB  256(CX), Y0, Y9
	VPADDB  288(CX), Y0, Y10
	VPADDB  320(CX), Y0, Y11
	VPADDB  352(CX), Y0, Y12
	VPADDB  384(CX), Y0, Y13
	VPADDB  416(CX), Y0, Y14
	VPADDB  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x000001e0, BX
	JMP     int8AddScalarBlockLoop

int8AddScalarTailLoop:
	CMPQ    BX, $0x00000020
	JL      int8AddScalarDone
	VPADDB  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000020, BX
	JMP     int8AddScalarTailLoop

int8AddScalarDone:
	CMPQ    BX, $0x00000010
	JL      int8AddScalarDone1
	VPADDB  (CX), X0, X1
	VMOVDQU X1, (DX)

int8AddScalarDone1:
	RET

// func int16AddAvx2Asm(x []int16, y []int16, r []int16)
// Requires: AVX, AVX2
TEXT ·int16AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

int16AddBlockLoop:
	CMPQ    BX, $0x00000100
	JL      int16AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDW  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDW  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDW  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDW  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDW  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDW  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDW  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDW  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDW  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDW  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDW  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDW  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDW  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDW  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDW  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDW  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000100, BX
	JMP     int16AddBlockLoop

int16AddTailLoop:
	CMPQ    BX, $0x00000010
	JL      int16AddDone
	VMOVDQU (AX), Y0
	VPADDW  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000010, BX
	JMP     int16AddTailLoop

int16AddDone:
	CMPQ    BX, $0x00000008
	JL      int16AddDone1
	VMOVDQU (AX), X0
	VPADDW  (CX), X0, X0
	VMOVDQU X0, (DX)

int16AddDone1:
	RET

// func int16AddScalarAvx2Asm(x int16, y []int16, r []int16)
// Requires: AVX, AVX2, SSE2
TEXT ·int16AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVWLSX      x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTW X0, Y0

int16AddScalarBlockLoop:
	CMPQ    BX, $0x000000f0
	JL      int16AddScalarTailLoop
	VPADDW  (CX), Y0, Y1
	VPADDW  32(CX), Y0, Y2
	VPADDW  64(CX), Y0, Y3
	VPADDW  96(CX), Y0, Y4
	VPADDW  128(CX), Y0, Y5
	VPADDW  160(CX), Y0, Y6
	VPADDW  192(CX), Y0, Y7
	VPADDW  224(CX), Y0, Y8
	VPADDW  256(CX), Y0, Y9
	VPADDW  288(CX), Y0, Y10
	VPADDW  320(CX), Y0, Y11
	VPADDW  352(CX), Y0, Y12
	VPADDW  384(CX), Y0, Y13
	VPADDW  416(CX), Y0, Y14
	VPADDW  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x000000f0, BX
	JMP     int16AddScalarBlockLoop

int16AddScalarTailLoop:
	CMPQ    BX, $0x00000010
	JL      int16AddScalarDone
	VPADDW  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000010, BX
	JMP     int16AddScalarTailLoop

int16AddScalarDone:
	CMPQ    BX, $0x00000008
	JL      int16AddScalarDone1
	VPADDW  (CX), X0, X1
	VMOVDQU X1, (DX)

int16AddScalarDone1:
	RET

// func int32AddAvx2Asm(x []int32, y []int32, r []int32)
// Requires: AVX, AVX2
TEXT ·int32AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

int32AddBlockLoop:
	CMPQ    BX, $0x00000080
	JL      int32AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDD  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDD  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDD  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDD  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDD  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDD  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDD  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDD  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDD  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDD  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDD  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDD  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDD  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDD  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDD  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDD  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000080, BX
	JMP     int32AddBlockLoop

int32AddTailLoop:
	CMPQ    BX, $0x00000008
	JL      int32AddDone
	VMOVDQU (AX), Y0
	VPADDD  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000008, BX
	JMP     int32AddTailLoop

int32AddDone:
	CMPQ    BX, $0x00000004
	JL      int32AddDone1
	VMOVDQU (AX), X0
	VPADDD  (CX), X0, X0
	VMOVDQU X0, (DX)

int32AddDone1:
	RET

// func int32AddScalarAvx2Asm(x int32, y []int32, r []int32)
// Requires: AVX, AVX2, SSE2
TEXT ·int32AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVL         x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTD X0, Y0

int32AddScalarBlockLoop:
	CMPQ    BX, $0x00000078
	JL      int32AddScalarTailLoop
	VPADDD  (CX), Y0, Y1
	VPADDD  32(CX), Y0, Y2
	VPADDD  64(CX), Y0, Y3
	VPADDD  96(CX), Y0, Y4
	VPADDD  128(CX), Y0, Y5
	VPADDD  160(CX), Y0, Y6
	VPADDD  192(CX), Y0, Y7
	VPADDD  224(CX), Y0, Y8
	VPADDD  256(CX), Y0, Y9
	VPADDD  288(CX), Y0, Y10
	VPADDD  320(CX), Y0, Y11
	VPADDD  352(CX), Y0, Y12
	VPADDD  384(CX), Y0, Y13
	VPADDD  416(CX), Y0, Y14
	VPADDD  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x00000078, BX
	JMP     int32AddScalarBlockLoop

int32AddScalarTailLoop:
	CMPQ    BX, $0x00000008
	JL      int32AddScalarDone
	VPADDD  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000008, BX
	JMP     int32AddScalarTailLoop

int32AddScalarDone:
	CMPQ    BX, $0x00000004
	JL      int32AddScalarDone1
	VPADDD  (CX), X0, X1
	VMOVDQU X1, (DX)

int32AddScalarDone1:
	RET

// func int64AddAvx2Asm(x []int64, y []int64, r []int64)
// Requires: AVX, AVX2
TEXT ·int64AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

int64AddBlockLoop:
	CMPQ    BX, $0x00000040
	JL      int64AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDQ  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDQ  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDQ  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDQ  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDQ  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDQ  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDQ  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDQ  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDQ  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDQ  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDQ  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDQ  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDQ  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDQ  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDQ  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDQ  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000040, BX
	JMP     int64AddBlockLoop

int64AddTailLoop:
	CMPQ    BX, $0x00000004
	JL      int64AddDone
	VMOVDQU (AX), Y0
	VPADDQ  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000004, BX
	JMP     int64AddTailLoop

int64AddDone:
	CMPQ    BX, $0x00000002
	JL      int64AddDone1
	VMOVDQU (AX), X0
	VPADDQ  (CX), X0, X0
	VMOVDQU X0, (DX)

int64AddDone1:
	RET

// func int64AddScalarAvx2Asm(x int64, y []int64, r []int64)
// Requires: AVX, AVX2, SSE2
TEXT ·int64AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVQ         x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVQ         AX, X0
	VPBROADCASTQ X0, Y0

int64AddScalarBlockLoop:
	CMPQ    BX, $0x0000003c
	JL      int64AddScalarTailLoop
	VPADDQ  (CX), Y0, Y1
	VPADDQ  32(CX), Y0, Y2
	VPADDQ  64(CX), Y0, Y3
	VPADDQ  96(CX), Y0, Y4
	VPADDQ  128(CX), Y0, Y5
	VPADDQ  160(CX), Y0, Y6
	VPADDQ  192(CX), Y0, Y7
	VPADDQ  224(CX), Y0, Y8
	VPADDQ  256(CX), Y0, Y9
	VPADDQ  288(CX), Y0, Y10
	VPADDQ  320(CX), Y0, Y11
	VPADDQ  352(CX), Y0, Y12
	VPADDQ  384(CX), Y0, Y13
	VPADDQ  416(CX), Y0, Y14
	VPADDQ  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x0000003c, BX
	JMP     int64AddScalarBlockLoop

int64AddScalarTailLoop:
	CMPQ    BX, $0x00000004
	JL      int64AddScalarDone
	VPADDQ  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000004, BX
	JMP     int64AddScalarTailLoop

int64AddScalarDone:
	CMPQ    BX, $0x00000002
	JL      int64AddScalarDone1
	VPADDQ  (CX), X0, X1
	VMOVDQU X1, (DX)

int64AddScalarDone1:
	RET

// func uint8AddAvx2Asm(x []uint8, y []uint8, r []uint8)
// Requires: AVX, AVX2
TEXT ·uint8AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

uint8AddBlockLoop:
	CMPQ    BX, $0x00000200
	JL      uint8AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDB  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDB  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDB  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDB  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDB  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDB  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDB  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDB  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDB  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDB  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDB  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDB  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDB  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDB  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDB  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDB  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000200, BX
	JMP     uint8AddBlockLoop

uint8AddTailLoop:
	CMPQ    BX, $0x00000020
	JL      uint8AddDone
	VMOVDQU (AX), Y0
	VPADDB  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000020, BX
	JMP     uint8AddTailLoop

uint8AddDone:
	CMPQ    BX, $0x00000010
	JL      uint8AddDone1
	VMOVDQU (AX), X0
	VPADDB  (CX), X0, X0
	VMOVDQU X0, (DX)

uint8AddDone1:
	RET

// func uint8AddScalarAvx2Asm(x uint8, y []uint8, r []uint8)
// Requires: AVX, AVX2, SSE2
TEXT ·uint8AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVBLZX      x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTB X0, Y0

uint8AddScalarBlockLoop:
	CMPQ    BX, $0x000001e0
	JL      uint8AddScalarTailLoop
	VPADDB  (CX), Y0, Y1
	VPADDB  32(CX), Y0, Y2
	VPADDB  64(CX), Y0, Y3
	VPADDB  96(CX), Y0, Y4
	VPADDB  128(CX), Y0, Y5
	VPADDB  160(CX), Y0, Y6
	VPADDB  192(CX), Y0, Y7
	VPADDB  224(CX), Y0, Y8
	VPADDB  256(CX), Y0, Y9
	VPADDB  288(CX), Y0, Y10
	VPADDB  320(CX), Y0, Y11
	VPADDB  352(CX), Y0, Y12
	VPADDB  384(CX), Y0, Y13
	VPADDB  416(CX), Y0, Y14
	VPADDB  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x000001e0, BX
	JMP     uint8AddScalarBlockLoop

uint8AddScalarTailLoop:
	CMPQ    BX, $0x00000020
	JL      uint8AddScalarDone
	VPADDB  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000020, BX
	JMP     uint8AddScalarTailLoop

uint8AddScalarDone:
	CMPQ    BX, $0x00000010
	JL      uint8AddScalarDone1
	VPADDB  (CX), X0, X1
	VMOVDQU X1, (DX)

uint8AddScalarDone1:
	RET

// func uint16AddAvx2Asm(x []uint16, y []uint16, r []uint16)
// Requires: AVX, AVX2
TEXT ·uint16AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

uint16AddBlockLoop:
	CMPQ    BX, $0x00000100
	JL      uint16AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDW  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDW  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDW  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDW  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDW  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDW  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDW  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDW  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDW  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDW  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDW  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDW  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDW  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDW  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDW  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDW  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000100, BX
	JMP     uint16AddBlockLoop

uint16AddTailLoop:
	CMPQ    BX, $0x00000010
	JL      uint16AddDone
	VMOVDQU (AX), Y0
	VPADDW  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000010, BX
	JMP     uint16AddTailLoop

uint16AddDone:
	CMPQ    BX, $0x00000008
	JL      uint16AddDone1
	VMOVDQU (AX), X0
	VPADDW  (CX), X0, X0
	VMOVDQU X0, (DX)

uint16AddDone1:
	RET

// func uint16AddScalarAvx2Asm(x uint16, y []uint16, r []uint16)
// Requires: AVX, AVX2, SSE2
TEXT ·uint16AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVWLZX      x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTW X0, Y0

uint16AddScalarBlockLoop:
	CMPQ    BX, $0x000000f0
	JL      uint16AddScalarTailLoop
	VPADDW  (CX), Y0, Y1
	VPADDW  32(CX), Y0, Y2
	VPADDW  64(CX), Y0, Y3
	VPADDW  96(CX), Y0, Y4
	VPADDW  128(CX), Y0, Y5
	VPADDW  160(CX), Y0, Y6
	VPADDW  192(CX), Y0, Y7
	VPADDW  224(CX), Y0, Y8
	VPADDW  256(CX), Y0, Y9
	VPADDW  288(CX), Y0, Y10
	VPADDW  320(CX), Y0, Y11
	VPADDW  352(CX), Y0, Y12
	VPADDW  384(CX), Y0, Y13
	VPADDW  416(CX), Y0, Y14
	VPADDW  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x000000f0, BX
	JMP     uint16AddScalarBlockLoop

uint16AddScalarTailLoop:
	CMPQ    BX, $0x00000010
	JL      uint16AddScalarDone
	VPADDW  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000010, BX
	JMP     uint16AddScalarTailLoop

uint16AddScalarDone:
	CMPQ    BX, $0x00000008
	JL      uint16AddScalarDone1
	VPADDW  (CX), X0, X1
	VMOVDQU X1, (DX)

uint16AddScalarDone1:
	RET

// func uint32AddAvx2Asm(x []uint32, y []uint32, r []uint32)
// Requires: AVX, AVX2
TEXT ·uint32AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

uint32AddBlockLoop:
	CMPQ    BX, $0x00000080
	JL      uint32AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDD  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDD  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDD  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDD  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDD  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDD  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDD  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDD  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDD  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDD  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDD  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDD  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDD  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDD  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDD  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDD  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000080, BX
	JMP     uint32AddBlockLoop

uint32AddTailLoop:
	CMPQ    BX, $0x00000008
	JL      uint32AddDone
	VMOVDQU (AX), Y0
	VPADDD  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000008, BX
	JMP     uint32AddTailLoop

uint32AddDone:
	CMPQ    BX, $0x00000004
	JL      uint32AddDone1
	VMOVDQU (AX), X0
	VPADDD  (CX), X0, X0
	VMOVDQU X0, (DX)

uint32AddDone1:
	RET

// func uint32AddScalarAvx2Asm(x uint32, y []uint32, r []uint32)
// Requires: AVX, AVX2, SSE2
TEXT ·uint32AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVL         x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVD         AX, X0
	VPBROADCASTD X0, Y0

uint32AddScalarBlockLoop:
	CMPQ    BX, $0x00000078
	JL      uint32AddScalarTailLoop
	VPADDD  (CX), Y0, Y1
	VPADDD  32(CX), Y0, Y2
	VPADDD  64(CX), Y0, Y3
	VPADDD  96(CX), Y0, Y4
	VPADDD  128(CX), Y0, Y5
	VPADDD  160(CX), Y0, Y6
	VPADDD  192(CX), Y0, Y7
	VPADDD  224(CX), Y0, Y8
	VPADDD  256(CX), Y0, Y9
	VPADDD  288(CX), Y0, Y10
	VPADDD  320(CX), Y0, Y11
	VPADDD  352(CX), Y0, Y12
	VPADDD  384(CX), Y0, Y13
	VPADDD  416(CX), Y0, Y14
	VPADDD  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x00000078, BX
	JMP     uint32AddScalarBlockLoop

uint32AddScalarTailLoop:
	CMPQ    BX, $0x00000008
	JL      uint32AddScalarDone
	VPADDD  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000008, BX
	JMP     uint32AddScalarTailLoop

uint32AddScalarDone:
	CMPQ    BX, $0x00000004
	JL      uint32AddScalarDone1
	VPADDD  (CX), X0, X1
	VMOVDQU X1, (DX)

uint32AddScalarDone1:
	RET

// func uint64AddAvx2Asm(x []uint64, y []uint64, r []uint64)
// Requires: AVX, AVX2
TEXT ·uint64AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

uint64AddBlockLoop:
	CMPQ    BX, $0x00000040
	JL      uint64AddTailLoop
	VMOVDQU (AX), Y0
	VMOVDQU 32(AX), Y1
	VMOVDQU 64(AX), Y2
	VMOVDQU 96(AX), Y3
	VMOVDQU 128(AX), Y4
	VMOVDQU 160(AX), Y5
	VMOVDQU 192(AX), Y6
	VMOVDQU 224(AX), Y7
	VMOVDQU 256(AX), Y8
	VMOVDQU 288(AX), Y9
	VMOVDQU 320(AX), Y10
	VMOVDQU 352(AX), Y11
	VMOVDQU 384(AX), Y12
	VMOVDQU 416(AX), Y13
	VMOVDQU 448(AX), Y14
	VMOVDQU 480(AX), Y15
	VPADDQ  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	VPADDQ  32(CX), Y1, Y1
	VMOVDQU Y1, 32(DX)
	VPADDQ  64(CX), Y2, Y2
	VMOVDQU Y2, 64(DX)
	VPADDQ  96(CX), Y3, Y3
	VMOVDQU Y3, 96(DX)
	VPADDQ  128(CX), Y4, Y4
	VMOVDQU Y4, 128(DX)
	VPADDQ  160(CX), Y5, Y5
	VMOVDQU Y5, 160(DX)
	VPADDQ  192(CX), Y6, Y6
	VMOVDQU Y6, 192(DX)
	VPADDQ  224(CX), Y7, Y7
	VMOVDQU Y7, 224(DX)
	VPADDQ  256(CX), Y8, Y8
	VMOVDQU Y8, 256(DX)
	VPADDQ  288(CX), Y9, Y9
	VMOVDQU Y9, 288(DX)
	VPADDQ  320(CX), Y10, Y10
	VMOVDQU Y10, 320(DX)
	VPADDQ  352(CX), Y11, Y11
	VMOVDQU Y11, 352(DX)
	VPADDQ  384(CX), Y12, Y12
	VMOVDQU Y12, 384(DX)
	VPADDQ  416(CX), Y13, Y13
	VMOVDQU Y13, 416(DX)
	VPADDQ  448(CX), Y14, Y14
	VMOVDQU Y14, 448(DX)
	VPADDQ  480(CX), Y15, Y15
	VMOVDQU Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000040, BX
	JMP     uint64AddBlockLoop

uint64AddTailLoop:
	CMPQ    BX, $0x00000004
	JL      uint64AddDone
	VMOVDQU (AX), Y0
	VPADDQ  (CX), Y0, Y0
	VMOVDQU Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000004, BX
	JMP     uint64AddTailLoop

uint64AddDone:
	CMPQ    BX, $0x00000002
	JL      uint64AddDone1
	VMOVDQU (AX), X0
	VPADDQ  (CX), X0, X0
	VMOVDQU X0, (DX)

uint64AddDone1:
	RET

// func uint64AddScalarAvx2Asm(x uint64, y []uint64, r []uint64)
// Requires: AVX, AVX2, SSE2
TEXT ·uint64AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVQ         x+0(FP), AX
	MOVQ         y_base+8(FP), CX
	MOVQ         r_base+32(FP), DX
	MOVQ         y_len+16(FP), BX
	MOVQ         AX, X0
	VPBROADCASTQ X0, Y0

uint64AddScalarBlockLoop:
	CMPQ    BX, $0x0000003c
	JL      uint64AddScalarTailLoop
	VPADDQ  (CX), Y0, Y1
	VPADDQ  32(CX), Y0, Y2
	VPADDQ  64(CX), Y0, Y3
	VPADDQ  96(CX), Y0, Y4
	VPADDQ  128(CX), Y0, Y5
	VPADDQ  160(CX), Y0, Y6
	VPADDQ  192(CX), Y0, Y7
	VPADDQ  224(CX), Y0, Y8
	VPADDQ  256(CX), Y0, Y9
	VPADDQ  288(CX), Y0, Y10
	VPADDQ  320(CX), Y0, Y11
	VPADDQ  352(CX), Y0, Y12
	VPADDQ  384(CX), Y0, Y13
	VPADDQ  416(CX), Y0, Y14
	VPADDQ  448(CX), Y0, Y15
	VMOVDQU Y1, (DX)
	VMOVDQU Y2, 32(DX)
	VMOVDQU Y3, 64(DX)
	VMOVDQU Y4, 96(DX)
	VMOVDQU Y5, 128(DX)
	VMOVDQU Y6, 160(DX)
	VMOVDQU Y7, 192(DX)
	VMOVDQU Y8, 224(DX)
	VMOVDQU Y9, 256(DX)
	VMOVDQU Y10, 288(DX)
	VMOVDQU Y11, 320(DX)
	VMOVDQU Y12, 352(DX)
	VMOVDQU Y13, 384(DX)
	VMOVDQU Y14, 416(DX)
	VMOVDQU Y15, 448(DX)
	ADDQ    $0x000001e0, CX
	ADDQ    $0x000001e0, DX
	SUBQ    $0x0000003c, BX
	JMP     uint64AddScalarBlockLoop

uint64AddScalarTailLoop:
	CMPQ    BX, $0x00000004
	JL      uint64AddScalarDone
	VPADDQ  (CX), Y0, Y1
	VMOVDQU Y1, (DX)
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000004, BX
	JMP     uint64AddScalarTailLoop

uint64AddScalarDone:
	CMPQ    BX, $0x00000002
	JL      uint64AddScalarDone1
	VPADDQ  (CX), X0, X1
	VMOVDQU X1, (DX)

uint64AddScalarDone1:
	RET

// func float32AddAvx2Asm(x []float32, y []float32, r []float32)
// Requires: AVX
TEXT ·float32AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

float32AddBlockLoop:
	CMPQ    BX, $0x00000080
	JL      float32AddTailLoop
	VMOVUPS (AX), Y0
	VMOVUPS 32(AX), Y1
	VMOVUPS 64(AX), Y2
	VMOVUPS 96(AX), Y3
	VMOVUPS 128(AX), Y4
	VMOVUPS 160(AX), Y5
	VMOVUPS 192(AX), Y6
	VMOVUPS 224(AX), Y7
	VMOVUPS 256(AX), Y8
	VMOVUPS 288(AX), Y9
	VMOVUPS 320(AX), Y10
	VMOVUPS 352(AX), Y11
	VMOVUPS 384(AX), Y12
	VMOVUPS 416(AX), Y13
	VMOVUPS 448(AX), Y14
	VMOVUPS 480(AX), Y15
	VADDPS  (CX), Y0, Y0
	VMOVUPS Y0, (DX)
	VADDPS  32(CX), Y1, Y1
	VMOVUPS Y1, 32(DX)
	VADDPS  64(CX), Y2, Y2
	VMOVUPS Y2, 64(DX)
	VADDPS  96(CX), Y3, Y3
	VMOVUPS Y3, 96(DX)
	VADDPS  128(CX), Y4, Y4
	VMOVUPS Y4, 128(DX)
	VADDPS  160(CX), Y5, Y5
	VMOVUPS Y5, 160(DX)
	VADDPS  192(CX), Y6, Y6
	VMOVUPS Y6, 192(DX)
	VADDPS  224(CX), Y7, Y7
	VMOVUPS Y7, 224(DX)
	VADDPS  256(CX), Y8, Y8
	VMOVUPS Y8, 256(DX)
	VADDPS  288(CX), Y9, Y9
	VMOVUPS Y9, 288(DX)
	VADDPS  320(CX), Y10, Y10
	VMOVUPS Y10, 320(DX)
	VADDPS  352(CX), Y11, Y11
	VMOVUPS Y11, 352(DX)
	VADDPS  384(CX), Y12, Y12
	VMOVUPS Y12, 384(DX)
	VADDPS  416(CX), Y13, Y13
	VMOVUPS Y13, 416(DX)
	VADDPS  448(CX), Y14, Y14
	VMOVUPS Y14, 448(DX)
	VADDPS  480(CX), Y15, Y15
	VMOVUPS Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000080, BX
	JMP     float32AddBlockLoop

float32AddTailLoop:
	CMPQ    BX, $0x00000008
	JL      float32AddDone
	VMOVUPS (AX), Y0
	VADDPS  (CX), Y0, Y0
	VMOVUPS Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000008, BX
	JMP     float32AddTailLoop

float32AddDone:
	CMPQ    BX, $0x00000004
	JL      float32AddDone1
	VMOVUPS (AX), X0
	VADDPS  (CX), X0, X0
	VMOVUPS X0, (DX)

float32AddDone1:
	RET

// func float32AddScalarAvx2Asm(x float32, y []float32, r []float32)
// Requires: AVX, AVX2, SSE
TEXT ·float32AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVSS        x+0(FP), X0
	MOVQ         y_base+8(FP), AX
	MOVQ         r_base+32(FP), CX
	MOVQ         y_len+16(FP), DX
	VBROADCASTSS X0, Y0

float32AddScalarBlockLoop:
	CMPQ    DX, $0x00000078
	JL      float32AddScalarTailLoop
	VADDPS  (AX), Y0, Y1
	VADDPS  32(AX), Y0, Y2
	VADDPS  64(AX), Y0, Y3
	VADDPS  96(AX), Y0, Y4
	VADDPS  128(AX), Y0, Y5
	VADDPS  160(AX), Y0, Y6
	VADDPS  192(AX), Y0, Y7
	VADDPS  224(AX), Y0, Y8
	VADDPS  256(AX), Y0, Y9
	VADDPS  288(AX), Y0, Y10
	VADDPS  320(AX), Y0, Y11
	VADDPS  352(AX), Y0, Y12
	VADDPS  384(AX), Y0, Y13
	VADDPS  416(AX), Y0, Y14
	VADDPS  448(AX), Y0, Y15
	VMOVUPS Y1, (CX)
	VMOVUPS Y2, 32(CX)
	VMOVUPS Y3, 64(CX)
	VMOVUPS Y4, 96(CX)
	VMOVUPS Y5, 128(CX)
	VMOVUPS Y6, 160(CX)
	VMOVUPS Y7, 192(CX)
	VMOVUPS Y8, 224(CX)
	VMOVUPS Y9, 256(CX)
	VMOVUPS Y10, 288(CX)
	VMOVUPS Y11, 320(CX)
	VMOVUPS Y12, 352(CX)
	VMOVUPS Y13, 384(CX)
	VMOVUPS Y14, 416(CX)
	VMOVUPS Y15, 448(CX)
	ADDQ    $0x000001e0, AX
	ADDQ    $0x000001e0, CX
	SUBQ    $0x00000078, DX
	JMP     float32AddScalarBlockLoop

float32AddScalarTailLoop:
	CMPQ    DX, $0x00000008
	JL      float32AddScalarDone
	VADDPS  (AX), Y0, Y1
	VMOVUPS Y1, (CX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	SUBQ    $0x00000008, DX
	JMP     float32AddScalarTailLoop

float32AddScalarDone:
	CMPQ    DX, $0x00000004
	JL      float32AddScalarDone1
	VADDPS  (AX), X0, X1
	VMOVUPS X1, (CX)

float32AddScalarDone1:
	RET

// func float64AddAvx2Asm(x []float64, y []float64, r []float64)
// Requires: AVX
TEXT ·float64AddAvx2Asm(SB), NOSPLIT, $0-72
	MOVQ x_base+0(FP), AX
	MOVQ y_base+24(FP), CX
	MOVQ r_base+48(FP), DX
	MOVQ x_len+8(FP), BX

float64AddBlockLoop:
	CMPQ    BX, $0x00000040
	JL      float64AddTailLoop
	VMOVUPD (AX), Y0
	VMOVUPD 32(AX), Y1
	VMOVUPD 64(AX), Y2
	VMOVUPD 96(AX), Y3
	VMOVUPD 128(AX), Y4
	VMOVUPD 160(AX), Y5
	VMOVUPD 192(AX), Y6
	VMOVUPD 224(AX), Y7
	VMOVUPD 256(AX), Y8
	VMOVUPD 288(AX), Y9
	VMOVUPD 320(AX), Y10
	VMOVUPD 352(AX), Y11
	VMOVUPD 384(AX), Y12
	VMOVUPD 416(AX), Y13
	VMOVUPD 448(AX), Y14
	VMOVUPD 480(AX), Y15
	VADDPD  (CX), Y0, Y0
	VMOVUPD Y0, (DX)
	VADDPD  32(CX), Y1, Y1
	VMOVUPD Y1, 32(DX)
	VADDPD  64(CX), Y2, Y2
	VMOVUPD Y2, 64(DX)
	VADDPD  96(CX), Y3, Y3
	VMOVUPD Y3, 96(DX)
	VADDPD  128(CX), Y4, Y4
	VMOVUPD Y4, 128(DX)
	VADDPD  160(CX), Y5, Y5
	VMOVUPD Y5, 160(DX)
	VADDPD  192(CX), Y6, Y6
	VMOVUPD Y6, 192(DX)
	VADDPD  224(CX), Y7, Y7
	VMOVUPD Y7, 224(DX)
	VADDPD  256(CX), Y8, Y8
	VMOVUPD Y8, 256(DX)
	VADDPD  288(CX), Y9, Y9
	VMOVUPD Y9, 288(DX)
	VADDPD  320(CX), Y10, Y10
	VMOVUPD Y10, 320(DX)
	VADDPD  352(CX), Y11, Y11
	VMOVUPD Y11, 352(DX)
	VADDPD  384(CX), Y12, Y12
	VMOVUPD Y12, 384(DX)
	VADDPD  416(CX), Y13, Y13
	VMOVUPD Y13, 416(DX)
	VADDPD  448(CX), Y14, Y14
	VMOVUPD Y14, 448(DX)
	VADDPD  480(CX), Y15, Y15
	VMOVUPD Y15, 480(DX)
	ADDQ    $0x00000200, AX
	ADDQ    $0x00000200, CX
	ADDQ    $0x00000200, DX
	SUBQ    $0x00000040, BX
	JMP     float64AddBlockLoop

float64AddTailLoop:
	CMPQ    BX, $0x00000004
	JL      float64AddDone
	VMOVUPD (AX), Y0
	VADDPD  (CX), Y0, Y0
	VMOVUPD Y0, (DX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	ADDQ    $0x00000020, DX
	SUBQ    $0x00000004, BX
	JMP     float64AddTailLoop

float64AddDone:
	CMPQ    BX, $0x00000002
	JL      float64AddDone1
	VMOVUPD (AX), X0
	VADDPD  (CX), X0, X0
	VMOVUPD X0, (DX)

float64AddDone1:
	RET

// func float64AddScalarAvx2Asm(x float64, y []float64, r []float64)
// Requires: AVX, AVX2, SSE2
TEXT ·float64AddScalarAvx2Asm(SB), NOSPLIT, $0-56
	MOVSD        x+0(FP), X0
	MOVQ         y_base+8(FP), AX
	MOVQ         r_base+32(FP), CX
	MOVQ         y_len+16(FP), DX
	VBROADCASTSD X0, Y0

float64AddScalarBlockLoop:
	CMPQ    DX, $0x0000003c
	JL      float64AddScalarTailLoop
	VADDPD  (AX), Y0, Y1
	VADDPD  32(AX), Y0, Y2
	VADDPD  64(AX), Y0, Y3
	VADDPD  96(AX), Y0, Y4
	VADDPD  128(AX), Y0, Y5
	VADDPD  160(AX), Y0, Y6
	VADDPD  192(AX), Y0, Y7
	VADDPD  224(AX), Y0, Y8
	VADDPD  256(AX), Y0, Y9
	VADDPD  288(AX), Y0, Y10
	VADDPD  320(AX), Y0, Y11
	VADDPD  352(AX), Y0, Y12
	VADDPD  384(AX), Y0, Y13
	VADDPD  416(AX), Y0, Y14
	VADDPD  448(AX), Y0, Y15
	VMOVUPD Y1, (CX)
	VMOVUPD Y2, 32(CX)
	VMOVUPD Y3, 64(CX)
	VMOVUPD Y4, 96(CX)
	VMOVUPD Y5, 128(CX)
	VMOVUPD Y6, 160(CX)
	VMOVUPD Y7, 192(CX)
	VMOVUPD Y8, 224(CX)
	VMOVUPD Y9, 256(CX)
	VMOVUPD Y10, 288(CX)
	VMOVUPD Y11, 320(CX)
	VMOVUPD Y12, 352(CX)
	VMOVUPD Y13, 384(CX)
	VMOVUPD Y14, 416(CX)
	VMOVUPD Y15, 448(CX)
	ADDQ    $0x000001e0, AX
	ADDQ    $0x000001e0, CX
	SUBQ    $0x0000003c, DX
	JMP     float64AddScalarBlockLoop

float64AddScalarTailLoop:
	CMPQ    DX, $0x00000004
	JL      float64AddScalarDone
	VADDPD  (AX), Y0, Y1
	VMOVUPD Y1, (CX)
	ADDQ    $0x00000020, AX
	ADDQ    $0x00000020, CX
	SUBQ    $0x00000004, DX
	JMP     float64AddScalarTailLoop

float64AddScalarDone:
	CMPQ    DX, $0x00000002
	JL      float64AddScalarDone1
	VADDPD  (AX), X0, X1
	VMOVUPD X1, (CX)

float64AddScalarDone1:
	RET