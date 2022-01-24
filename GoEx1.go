package main

import (
	"fmt"
	"time"
)

func crawl(worker int, c chan int) {
	for i := range c {
		fmt.Printf("Worker %v crawled url %v\n", worker, i)
	}

}

func main() {
	const nWorker = 6
	const nURL = 1000
	arrURL := make([]int, nURL)

	for i1 := 0; i1 < nURL; i1++ {
		arrURL[i1] = i1
	}

	c := make(chan int, nWorker)
	defer close(c)

	for i2 := 1; i2 < nWorker; i2++ {
		go crawl(i2, c)
	}

	for i3 := 0; i3 < nURL; i3++ {
		time.Sleep(1000 * time.Millisecond)
		c <- arrURL[i3]
	}

}
