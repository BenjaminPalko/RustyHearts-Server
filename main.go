package main

import (
	"fmt"
	"os"
	"os/exec"
	"sync"
)

func main() {
	bins := []string{
		"Agent_Release_x64",
		"AgentManager_Release_x64",
	}

	cwd, err := os.Getwd()
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	var wg sync.WaitGroup
	for _, bin := range bins {
		wg.Add(1)
		go func(executable string) {
			fmt.Printf("Starting %v...\n", bin)
			cmd := exec.Command(cwd + "/deploy/" + executable + ".exe") cmd.Stdout = os.Stdout
			if err := cmd.Run(); err != nil {
				fmt.Println(err.Error())
				os.Exit(1)
			}
			wg.Done()
		}(bin)
	}
	wg.Wait()
}
