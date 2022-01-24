package main

import (
	"fmt"
	"time"
)

func crawl(name string, v int) {
	time.Sleep(time.Second / 100)
	fmt.Printf("Worker %s is crawling url %d\n", name, v)
}

func main() {
	numberOfRequest := 100
	queueChan := make(chan int, numberOfRequest)

	for i := 1; i <= 5; i++ {
		go func(name string) {
			for v := range queueChan {
				crawl(name, v)
			}
		}(fmt.Sprintf("%d", i))
	}

	for i := 1; i <= numberOfRequest; i++ {
		queueChan <- i
	}

	close(queueChan)
	time.Sleep(time.Second / 100)
}
