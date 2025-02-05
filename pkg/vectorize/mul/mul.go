// Copyright 2021 Matrix Origin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package mul

import (
	"github.com/matrixorigin/matrixone/pkg/common/moerr"
	"github.com/matrixorigin/matrixone/pkg/container/types"
	"golang.org/x/exp/constraints"
)

var (
	Int8Mul              = NumericMulInts[int8]
	Int8MulSels          = NumericMulSelsInts[int8]
	Int8MulScalar        = NumericMulScalarInts[int8]
	Int8MulScalarSels    = NumericMulScalarSelsInts[int8]
	Int16Mul             = NumericMulInts[int16]
	Int16MulSels         = NumericMulSelsInts[int16]
	Int16MulScalar       = NumericMulScalarInts[int16]
	Int16MulScalarSels   = NumericMulScalarSelsInts[int16]
	Int32Mul             = NumericMulInts[int32]
	Int32MulSels         = NumericMulSelsInts[int32]
	Int32MulScalar       = NumericMulScalarInts[int32]
	Int32MulScalarSels   = NumericMulScalarSelsInts[int32]
	Int64Mul             = NumericMulInts[int64]
	Int64MulSels         = NumericMulSelsInts[int64]
	Int64MulScalar       = NumericMulScalarInts[int64]
	Int64MulScalarSels   = NumericMulScalarSelsInts[int64]
	Uint8Mul             = NumericMulInts[uint8]
	Uint8MulSels         = NumericMulSelsInts[uint8]
	Uint8MulScalar       = NumericMulScalarInts[uint8]
	Uint8MulScalarSels   = NumericMulScalarSelsInts[uint8]
	Uint16Mul            = NumericMulInts[uint16]
	Uint16MulSels        = NumericMulSelsInts[uint16]
	Uint16MulScalar      = NumericMulScalarInts[uint16]
	Uint16MulScalarSels  = NumericMulScalarSelsInts[uint16]
	Uint32Mul            = NumericMulInts[uint32]
	Uint32MulSels        = NumericMulSelsInts[uint32]
	Uint32MulScalar      = NumericMulScalarInts[uint32]
	Uint32MulScalarSels  = NumericMulScalarSelsInts[uint32]
	Uint64Mul            = NumericMulInts[uint64]
	Uint64MulSels        = NumericMulSelsInts[uint64]
	Uint64MulScalar      = NumericMulScalarInts[uint64]
	Uint64MulScalarSels  = NumericMulScalarSelsInts[uint64]
	Float32Mul           = NumericMul[float32]
	Float32MulSels       = NumericMulSels[float32]
	Float32MulScalar     = NumericMulScalar[float32]
	Float32MulScalarSels = NumericMulScalarSels[float32]
	Float64Mul           = NumericMul[float64]
	Float64MulSels       = NumericMulSels[float64]
	Float64MulScalar     = NumericMulScalar[float64]
	Float64MulScalarSels = NumericMulScalarSels[float64]

	Int32Int64Mul         = NumericMul2[int32, int64]
	Int32Int64MulSels     = NumericMulSels2[int32, int64]
	Int16Int64Mul         = NumericMul2[int16, int64]
	Int16Int64MulSels     = NumericMulSels2[int16, int64]
	Int8Int64Mul          = NumericMul2[int8, int64]
	Int8Int64MulSels      = NumericMulSels2[int8, int64]
	Int16Int32Mul         = NumericMul2[int16, int32]
	Int16Int32MulSels     = NumericMulSels2[int16, int32]
	Int8Int32Mul          = NumericMul2[int8, int32]
	Int8Int32MulSels      = NumericMulSels2[int8, int32]
	Int8Int16Mul          = NumericMul2[int8, int16]
	Int8Int16MulSels      = NumericMulSels2[int8, int16]
	Float32Float64Mul     = NumericMul2[float32, float64]
	Float32Float64MulSels = NumericMulSels2[float32, float64]
	Uint32Uint64Mul       = NumericMul2[uint32, uint64]
	Uint32Uint64MulSels   = NumericMulSels2[uint32, uint64]
	Uint16Uint64Mul       = NumericMul2[uint16, uint64]
	Uint16Uint64MulSels   = NumericMulSels2[uint16, uint64]
	Uint8Uint64Mul        = NumericMul2[uint8, uint64]
	Uint8Uint64MulSels    = NumericMulSels2[uint8, uint64]
	Uint16Uint32Mul       = NumericMul2[uint16, uint32]
	Uint16Uint32MulSels   = NumericMulSels2[uint16, uint32]
	Uint8Uint32Mul        = NumericMul2[uint8, uint32]
	Uint8Uint32MulSels    = NumericMulSels2[uint8, uint32]
	Uint8Uint16Mul        = NumericMul2[uint8, uint16]
	Uint8Uint16MulSels    = NumericMulSels2[uint8, uint16]

	Decimal64Mul            = decimal64Mul
	Decimal64MulSels        = decimal64MulSels
	Decimal64MulScalar      = decimal64MulScalar
	Decimal64MulScalarSels  = decimal64MulScalarSels
	Decimal128Mul           = decimal128Mul
	Decimal128MulSels       = decimal128MulSels
	Decimal128MulScalar     = decimal128MulScalar
	Decimal128MulScalarSels = decimal128MulScalarSels
)

// the slowest overflow check
func NumericMulInts[T constraints.Integer](xs, ys, rs []T) []T {
	for i, x := range xs {
		rs[i] = x * ys[i]
		if x != 0 && rs[i]/x != ys[i] {
			panic(moerr.NewError(moerr.OUT_OF_RANGE, "int multiply overflow"))
		}
	}
	return rs
}

func NumericMulSelsInts[T constraints.Integer](xs, ys, rs []T, sels []int64) []T {
	for i, sel := range sels {
		rs[i] = xs[sel] * ys[sel]
		if xs[sel] != 0 && rs[i]/xs[sel] != ys[sel] {
			panic(moerr.NewError(moerr.OUT_OF_RANGE, "int multiply overflow"))
		}
	}
	return rs
}

func NumericMulScalarInts[T constraints.Integer](x T, ys, rs []T) []T {
	for i, y := range ys {
		rs[i] = x * y
		if x != 0 && rs[i]/x != y {
			panic(moerr.NewError(moerr.OUT_OF_RANGE, "int multiply overflow"))
		}
	}
	return rs
}

func NumericMulScalarSelsInts[T constraints.Integer](x T, ys, rs []T, sels []int64) []T {
	for i, sel := range sels {
		rs[i] = x * ys[sel]
		if x != 0 && rs[i]/x != ys[sel] {
			panic(moerr.NewError(moerr.OUT_OF_RANGE, "int subtraction overflow"))
		}
	}
	return rs
}

func NumericMul[T constraints.Integer | constraints.Float](xs, ys, rs []T) []T {
	for i, x := range xs {
		rs[i] = x * ys[i]
	}
	return rs
}

func NumericMulSels[T constraints.Integer | constraints.Float](xs, ys, rs []T, sels []int64) []T {
	for i, sel := range sels {
		rs[i] = xs[sel] * ys[sel]
	}
	return rs
}

func NumericMulScalar[T constraints.Integer | constraints.Float](x T, ys, rs []T) []T {
	for i, y := range ys {
		rs[i] = x * y
	}
	return rs
}

func NumericMulScalarSels[T constraints.Integer | constraints.Float](x T, ys, rs []T, sels []int64) []T {
	for i, sel := range sels {
		rs[i] = x * ys[sel]
	}
	return rs
}

func NumericMul2[TSmall, TBig constraints.Integer | constraints.Float](xs []TSmall, ys, rs []TBig) []TBig {
	for i, x := range xs {
		rs[i] = TBig(x) * ys[i]
	}
	return rs
}

func NumericMulSels2[TSmall, TBig constraints.Integer | constraints.Float](xs []TSmall, ys, rs []TBig, sels []int64) []TBig {
	for i, sel := range sels {
		rs[i] = TBig(xs[sel]) * ys[sel]
	}
	return rs
}

/*
func NumericMulScalar2[TSmall, TBig constraints.Integer | constraints.Float](x TSmall, ys, rs []TBig) []TBig {
	for i, y := range ys {
		rs[i] = TBig(x) * y
	}
	return rs
}

func NumericMulScalarSels2[TSmall, TBig constraints.Integer | constraints.Float](x TSmall, ys, rs []TBig, sels []int64) []TBig {
	for i, sel := range sels {
		rs[i] = TBig(x) * ys[sel]
	}
	return rs
}
*/

func decimal64Mul(xs []types.Decimal64, ys []types.Decimal64, rs []types.Decimal128) []types.Decimal128 {
	for i, x := range xs {
		rs[i] = types.Decimal64Decimal64Mul(x, ys[i])
	}
	return rs
}

func decimal64MulSels(xs, ys []types.Decimal64, rs []types.Decimal128, sels []int64) []types.Decimal128 {
	for i, sel := range sels {
		rs[i] = types.Decimal64Decimal64Mul(xs[sel], ys[sel])
	}
	return rs
}

func decimal64MulScalar(x types.Decimal64, ys []types.Decimal64, rs []types.Decimal128) []types.Decimal128 {
	for i, y := range ys {
		rs[i] = types.Decimal64Decimal64Mul(x, y)
	}
	return rs
}

func decimal64MulScalarSels(x types.Decimal64, ys []types.Decimal64, rs []types.Decimal128, sels []int64) []types.Decimal128 {
	for i, sel := range sels {
		rs[i] = types.Decimal64Decimal64Mul(x, ys[sel])
	}
	return rs
}

func decimal128Mul(xs []types.Decimal128, ys []types.Decimal128, rs []types.Decimal128) []types.Decimal128 {
	for i, x := range xs {
		rs[i] = types.Decimal128Decimal128Mul(x, ys[i])
	}
	return rs
}

func decimal128MulSels(xs, ys []types.Decimal128, rs []types.Decimal128, sels []int64) []types.Decimal128 {
	for i, sel := range sels {
		rs[i] = types.Decimal128Decimal128Mul(xs[sel], ys[sel])
	}
	return rs
}

func decimal128MulScalar(x types.Decimal128, ys []types.Decimal128, rs []types.Decimal128) []types.Decimal128 {
	for i, y := range ys {
		rs[i] = types.Decimal128Decimal128Mul(x, y)
	}
	return rs
}

func decimal128MulScalarSels(x types.Decimal128, ys []types.Decimal128, rs []types.Decimal128, sels []int64) []types.Decimal128 {
	for i, sel := range sels {
		rs[i] = types.Decimal128Decimal128Mul(x, ys[sel])
	}
	return rs
}
