// $ go run ls.go
package main

import (
	"fmt"
	"os"
)

func list_files(dir string) {
	d, err := os.Open(dir)
	if err != nil {
		fmt.Printf("%s\n", err.Error())
		return
	}

	defer d.Close()

	files, err := d.Readdir(0)
	if err != nil {
		fmt.Printf("%s\n", err.Error())
		return
	}

	for _, file := range files {
		fmt.Println(file.Name())
	}
}

func main() {
	args := os.Args[1:]
	argc := len(args)

	if argc > 0 {
		for i, dir := range args {
			fmt.Printf("[%s]\n", dir)
			list_files(dir)
			if i < argc-1 {
				fmt.Println()
			}
		}
	} else {
		list_files(".")
	}

}
