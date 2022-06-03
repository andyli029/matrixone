// Copyright 2022 Matrix Origin
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

package unary

import (
	"github.com/matrixorigin/matrixone/pkg/container/nulls"
	"github.com/matrixorigin/matrixone/pkg/container/types"
	"github.com/matrixorigin/matrixone/pkg/container/vector"
	"github.com/matrixorigin/matrixone/pkg/encoding"
	"github.com/matrixorigin/matrixone/pkg/vectorize/sinh"
	"github.com/matrixorigin/matrixone/pkg/vm/process"
)

// sinh function's evaluation for arguments: [uint64]
func SinhUint64(vs []*vector.Vector, proc *process.Process) (*vector.Vector, error) {
	origVec := vs[0]
	origVecCol := origVec.Col.([]uint64)
	if origVec.IsScalar() {
		if origVec.IsScalarNull() {
			return proc.AllocScalarNullVector(types.Type{Oid: types.T_float64, Size: 8}), nil
		}
		resultVector := proc.AllocScalarVector(types.Type{Oid: types.T_float64, Size: 8})
		results := make([]float64, 1)
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhUint64(origVecCol, results))
		return resultVector, nil
	} else {
		resultVector, err := proc.AllocVector(types.Type{Oid: types.T_float64, Size: 8}, 8*int64(len(origVecCol)))
		if err != nil {
			return nil, err
		}
		results := encoding.DecodeFloat64Slice(resultVector.Data)
		results = results[:len(origVecCol)]
		resultVector.Col = results
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhUint64(origVecCol, results))
		return resultVector, nil
	}
}

// sinh function's evaluation for arguments: [int64]
func SinhInt64(vs []*vector.Vector, proc *process.Process) (*vector.Vector, error) {
	origVec := vs[0]
	origVecCol := origVec.Col.([]int64)
	if origVec.IsScalar() {
		if origVec.IsScalarNull() {
			return proc.AllocScalarNullVector(types.Type{Oid: types.T_float64, Size: 8}), nil
		}
		resultVector := proc.AllocScalarVector(types.Type{Oid: types.T_float64, Size: 8})
		results := make([]float64, 1)
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhInt64(origVecCol, results))
		return resultVector, nil
	} else {
		resultVector, err := proc.AllocVector(types.Type{Oid: types.T_float64, Size: 8}, 8*int64(len(origVecCol)))
		if err != nil {
			return nil, err
		}
		results := encoding.DecodeFloat64Slice(resultVector.Data)
		results = results[:len(origVecCol)]
		resultVector.Col = results
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhInt64(origVecCol, results))
		return resultVector, nil
	}
}

// sinh function's evaluation for arguments: [float64]
func SinhFloat64(vs []*vector.Vector, proc *process.Process) (*vector.Vector, error) {
	origVec := vs[0]
	origVecCol := origVec.Col.([]float64)
	if origVec.IsScalar() {
		if origVec.IsScalarNull() {
			return proc.AllocScalarNullVector(types.Type{Oid: types.T_float64, Size: 8}), nil
		}
		resultVector := proc.AllocScalarVector(types.Type{Oid: types.T_float64, Size: 8})
		results := make([]float64, 1)
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhFloat64(origVecCol, results))
		return resultVector, nil
	} else {
		resultVector, err := proc.AllocVector(types.Type{Oid: types.T_float64, Size: 8}, 8*int64(len(origVecCol)))
		if err != nil {
			return nil, err
		}
		results := encoding.DecodeFloat64Slice(resultVector.Data)
		results = results[:len(origVecCol)]
		resultVector.Col = results
		nulls.Set(resultVector.Nsp, origVec.Nsp)
		vector.SetCol(resultVector, sinh.SinhFloat64(origVecCol, results))
		return resultVector, nil
	}
}