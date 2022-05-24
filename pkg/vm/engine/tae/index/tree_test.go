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

package index

import (
	"strconv"
	"testing"

	"github.com/matrixorigin/matrixone/pkg/container/types"
	"github.com/matrixorigin/matrixone/pkg/container/vector"
	"github.com/matrixorigin/matrixone/pkg/vm/engine/tae/container/compute"
	"github.com/stretchr/testify/require"
)

func TestARTIndexNumeric(t *testing.T) {
	typ := types.Type{Oid: types.T_int32}
	idx := NewSimpleARTMap(typ)

	var res bool
	var err error
	var row uint32
	res = idx.Contains(int32(0))
	require.False(t, res)

	var batches []*vector.Vector
	for i := 0; i < 10; i++ {
		batch := compute.MockVec(typ, 100, i*100)
		batches = append(batches, batch)
	}

	_, err = idx.Search(int32(55))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.Delete(int32(55))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.BatchInsert(batches[0], 0, 100, uint32(0), false, false)
	require.NoError(t, err)

	row, err = idx.Search(int32(55))
	require.NoError(t, err)
	require.Equal(t, uint32(55), row)

	_, err = idx.Search(int32(100))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.Delete(int32(55))
	require.NoError(t, err)

	_, err = idx.Search(int32(55))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.BatchInsert(batches[0], 0, 100, uint32(100), false, false)
	require.ErrorIs(t, err, ErrDuplicate)

	err = idx.BatchInsert(batches[1], 0, 100, uint32(100), false, false)
	require.NoError(t, err)

	row, err = idx.Search(int32(123))
	require.NoError(t, err)
	require.Equal(t, uint32(123), row)

	_, err = idx.Search(int32(233))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.Insert(int32(55), uint32(55))
	require.NoError(t, err)

	row, err = idx.Search(int32(55))
	require.NoError(t, err)
	require.Equal(t, uint32(55), row)

	err = idx.Update(int32(55), uint32(114514))
	require.NoError(t, err)

	row, err = idx.Search(int32(55))
	require.NoError(t, err)
	require.Equal(t, uint32(114514), row)

	updated := make([]uint32, 0)
	for i := 0; i < 100; i++ {
		updated = append(updated, uint32(i+10000))
	}
	err = idx.BatchUpdate(batches[0], updated, 0)
	require.NoError(t, err)

	row, err = idx.Search(int32(67))
	require.NoError(t, err)
	require.Equal(t, uint32(10067), row)
}

func TestArtIndexString(t *testing.T) {
	typ := types.Type{Oid: types.T_varchar}
	idx := NewSimpleARTMap(typ)

	var res bool
	var err error
	var row uint32
	res = idx.Contains([]byte(strconv.Itoa(0)))
	require.False(t, res)

	var batches []*vector.Vector
	for i := 0; i < 10; i++ {
		batch := compute.MockVec(typ, 100, i*100)
		batches = append(batches, batch)
	}

	_, err = idx.Search([]byte(strconv.Itoa(55)))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.Delete([]byte(strconv.Itoa(55)))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.BatchInsert(batches[0], 0, 100, uint32(0), false, false)
	require.NoError(t, err)

	row, err = idx.Search([]byte(strconv.Itoa(55)))
	require.NoError(t, err)
	require.Equal(t, uint32(55), row)

	_, err = idx.Search([]byte(strconv.Itoa(100)))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.Delete([]byte(strconv.Itoa(55)))
	require.NoError(t, err)

	_, err = idx.Search([]byte(strconv.Itoa(55)))
	require.ErrorIs(t, err, ErrNotFound)

	err = idx.BatchInsert(batches[0], 0, 100, uint32(100), false, false)
	require.ErrorIs(t, err, ErrDuplicate)

	err = idx.BatchInsert(batches[1], 0, 100, uint32(100), false, false)
	require.NoError(t, err)

	row, err = idx.Search([]byte(strconv.Itoa(123)))
	require.NoError(t, err)
	require.Equal(t, uint32(123), row)

	_, err = idx.Search([]byte(strconv.Itoa(233)))
	require.ErrorIs(t, err, ErrNotFound)
}