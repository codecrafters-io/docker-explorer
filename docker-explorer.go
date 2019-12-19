package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

var help = `
Usage: docker-explorer COMMAND [ARGS]

Commands:
  echo <something> : prints <something>
  mypid            : prints the process's PID
  ls <dir>         : lists files in <dir>

Examples:
  docker-explorer echo hey
  docker-explorer ls /
`

func main() {
	checkArgCountAtleast(1)

	command := os.Args[1]
	switch command {
	case "echo":
		commandEcho()
	case "mypid":
		commandMyPID()
	case "ls":
		commandLs()
	}
}

func commandEcho() {
	checkArgCountAtleast(2)
	fmt.Println(strings.Join(os.Args[2:], " "))
}

func commandMyPID() {
	pid := os.Getpid()
	fmt.Println(pid)
}

func commandLs() {
	checkArgCountAtleast(2)
	files, err := ioutil.ReadDir(os.Args[2])
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

func checkArgCountAtleast(expectedCount int) {
	if len(os.Args) <= expectedCount {
		fmt.Printf("Expected at least %v argument(s).\n", expectedCount)
		fmt.Println(help)
		os.Exit(1)
	}
}
