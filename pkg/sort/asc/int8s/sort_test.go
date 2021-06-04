package int8s

import (
	"fmt"
	"math/rand"
	"testing"
)

const (
	Num   = 10
	Limit = 100
)

func generate() ([]int8, []int64) {
	os := make([]int64, Num)
	xs := make([]int8, Num)
	{
		for i := 0; i < Num; i++ {
			os[i] = int64(i)
			xs[i] = int8(rand.Int63() % Limit)
		}
	}
	return xs, os
}

func TestSort(t *testing.T) {
	vs, os := generate()
	for i, o := range os {
		fmt.Printf("[%v] = %v\n", i, vs[o])
	}
	Sort(vs, os[2:])
	fmt.Printf("\n")
	for i, o := range os {
		fmt.Printf("[%v] = %v\n", i, vs[o])
	}
}