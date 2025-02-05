// Copyright 2022 MatrixOrigin.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// See the License for the specific language governing permissions and
// limitations under the License.

package util

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestClusterStores(t *testing.T) {
	clusterStores := NewClusterStores()
	clusterStores.RegisterWorking(NewStore("a", 0, 0))
	assert.Equal(t, &Store{ID: "a"}, clusterStores.WorkingStores()[0])

	clusterStores.RegisterExpired(NewStore("b", 0, 0))
	assert.Equal(t, &Store{ID: "b"}, clusterStores.ExpiredStores()[0])
}
