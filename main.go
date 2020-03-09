package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

var help = `
Usage: docker-explorer COMMAND [ARGS]

Commands:
  echo <something> : prints <something>
  mypid            : prints the process's PID
  ls <dir>         : lists files in <dir>
  touch <path>     : create a new file at <path>
  exit <exit_code> : exit with <exit_code>

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
	case "touch":
		commandTouch()
	case "exit":
		commandExit()
	default:
		fmt.Println(help)
		os.Exit(1)
	}
}

func commandExit() {
	checkArgCountAtleast(2)
	exitCode, err := strconv.Atoi(os.Args[2])
	if err != nil {
		fmt.Printf("Unable to parse exit code %v\n", exitCode)
		os.Exit(1)
	}
	os.Exit(exitCode)
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

func commandTouch() {
	checkArgCountAtleast(2)
	file, err := os.Create(os.Args[2])
	if err != nil {
		fmt.Printf("Error: %v", err)
		os.Exit(1)
	}
	file.Close()
}

func checkArgCountAtleast(expectedCount int) {
	if len(os.Args) <= expectedCount {
		fmt.Printf("Expected at least %v argument(s).\n", expectedCount)
		fmt.Println(help)
		os.Exit(1)
	}
}
