package main

import (
	"fmt"
	"os"
	"strings"
)

// A lightweight 'echo'
func main() {
	fmt.Println(strings.Join(os.Args[1:], " "))
}
