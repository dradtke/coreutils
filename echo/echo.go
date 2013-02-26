package main

import (
	"fmt"
	"os"
)

func main() {
	argv := os.Args[1:]
	argc := len(argv)
	for i, arg := range argv {
		fmt.Print(arg)
		if i < argc {
			fmt.Print(" ")
		}
	}
	fmt.Println()
}
