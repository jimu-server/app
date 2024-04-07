package main

import (
	"testing"
	"user/accountutil"
	"util/uuidutils/uuid"
)

type Node struct {
	Value string
	Next  *Node
}
type Test struct {
	Name string
	Age  int
	Arr  []Node
}

func TestLog(t *testing.T) {
	t.Log(uuid.String(1))
	t.Log(accountutil.Password("123456"))
}
