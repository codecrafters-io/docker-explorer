package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

// A lightweight 'ls'
func main() {
	files, err := ioutil.ReadDir(os.Args[1])
	if err != nil {
		fmt.Printf("Error: %v", err)
		switch err.(type) {
		case *os.PathError:
			os.Exit(2) // Matches what 'ls' does
		default:
			os.Exit(1)
		}
	}

	for _, file := range files {
		fmt.Println(file.Name())
	}
}
