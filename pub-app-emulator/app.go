package main

import (
	"context"
	"fmt"
	"math/rand"
	"time"
	"os"

	"cloud.google.com/go/pubsub"
)


func main() {
	// Set up a client to interact with the Pub/Sub service
	project_name := os.Getenv("PROJECT")
	ctx := context.Background()
	client, err := pubsub.NewClient(ctx, project_name)
	if err != nil {
		fmt.Println(err)
		return
	}

	// Get a reference to the Pub/Sub topic
	pubsub_topic := os.Getenv("PUBSUB_TOPIC")
	topic := client.Topic(pubsub_topic)

	// Set up a random number generator
	rand.Seed(time.Now().UnixNano())

	// Loop indefinitely and publish messages
	for {
		// Generate a random ID, userID, date, and amount
		id := rand.Intn(1000000)
		userID := fmt.Sprintf("user%d", rand.Intn(1000))
		date := time.Now().Format("2006-01-02")
		amount := rand.Float64() * 100

		// Create a new message with the ID, UserID, Date, and Amount fields
		message := &pubsub.Message{
			Data: []byte(fmt.Sprintf("Test message %d", id)),
			Attributes: map[string]string{
				"id":     fmt.Sprintf("%d", id),
				"userID": userID,
				"date":   date,
				"amount": fmt.Sprintf("%.2f", amount),
			},
		}

		// Publish the message
		result := topic.Publish(ctx, message)

		// With a 10% probability, publish a duplicate message
		if rand.Intn(10) == 0 {
			result = topic.Publish(ctx, message)
			fmt.Printf("Published duplicate message with ID %d\n", id)
		}

		// Wait for the message to be published and get the message ID
        _, err := result.Get(ctx)
		if err != nil {
			fmt.Println(err)
			return
		}

		fmt.Printf("Published message with ID %s\n", id)

        // Wait for a random amount of time between 1 and 1 milliseconds before publishing the next message
        time.Sleep(time.Duration(rand.Float64()+0.1) * time.Millisecond)


		// Wait for a random amount of time between 1 and 5 seconds before publishing the next message
		// time.Sleep(time.Duration(rand.Intn(4)+1) * time.Second)
	}
}
