user_bloc

A Flutter app demonstrating user management with clean architecture, BLoC state management, and API integration.

Getting Started

This project connects to the DummyJSON API to display a list of users with infinite scrolling and search features. Tapping a user shows their details, posts, and todos. You can also add a new post locally.

Features

List users with avatar, name, and email

Infinite scroll with pagination (limit/skip)

Real-time search by name

View user details with posts and todos

Create a new post locally (title and body)

Handles loading, success, and error states using flutter_bloc


API Endpoints

Users: https://dummyjson.com/users

Posts: https://dummyjson.com/posts/user/{userId}

Todos: https://dummyjson.com/todos/user/{userId}


Learn More

A few resources to get you started with Flutter:

Lab: Write your first Flutter app

Cookbook: Useful Flutter samples

Flutter documentation – tutorials, samples, mobile development guidance, and API reference.


