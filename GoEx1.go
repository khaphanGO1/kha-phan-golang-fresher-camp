package main

import (
	"fmt"
	"time"
)

func crawl(i int, c chan int, j int) {
	c <- i
	fmt.Println(<-c, j)

}

func main() {
	c := make(chan int, 5)
	s := make([]int, 1000)
	for i := 0; i < 1000; i++ {
		s[i] = i + 1
	}
	j := 1
	for i := 0; i < 1000; i++ {
		if j > 5 {
			j = 1
		}
		time.Sleep(100 * time.Millisecond)
		go crawl(i, c, j)
		j++
	}

}
