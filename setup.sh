#!/bin/bash



###########################
## setup environment
###########################
go mod init github.com/lbaldwin123/go-lib
ls -lah
cat go.mod 
touch README.md LICENSE init.go go-lib.go go-lib_test.go
rm -f init.go go-lib.go go-lib_test.go





###########################
## setup init.go
###########################

cat <<EOF >> init.go
/**
 * Author: Lonnie Baldwin
 * File: init.go
 */

package lib

import (
	"fmt"
)

func init() {
	fmt.Println("[go-lib] initializing ...")
}
EOF

###########################
## setup go-lib.go
###########################

cat <<EOF >> go-lib.go
/**
 * Author: Lonnie Baldwin
 * File: go-lib.go
 */

package lib

// Returns the sum of two numbers
func Add(a int, b int) int {
	return a + b
}

// Returns the difference between two numbers
func Subtract(a int, b int) int {
	return a - b
}
EOF

###########################
## setup go-lib_test.go
###########################

cat <<EOF >> go-lib_test.go
/**
 * Author: Lonnie Baldwin
 * File: go-lib_test.go
 */

package lib

import (
	"testing"
)

func TestAdd(t *testing.T) {
	a := 1
	b := 2
	expected := a + b

	if got := Add(a, b); got != expected {
		t.Errorf("Add(%d, %d) = %d, didn't return %d", a, b, got, expected)
	}
}

func TestSubtract(t *testing.T) {
	a := 1
	b := 2
	expected := a - b

	if got := Subtract(a, b); got != expected {
		t.Errorf("Subtract(%d, %d) = %d, didn't return %d", a, b, got, expected)
	}
}
EOF

###########################
## run tests
###########################

go test
go mod tidy
go test
go test -v 
go test -count 1
go test -v -count 1
#go help testflag