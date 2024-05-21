
# To-Do Application

## Overview

This is a simple yet powerful To-Do application built with Swift. It uses the MVVM (Model-View-ViewModel) architecture pattern to ensure a clean separation of concerns and CoreData for persistent storage. The app allows users to add, list, search, and delete tasks efficiently.

## Features

- **Add Tasks:** Easily add new tasks with a descriptive title.
- **List Tasks:** View all your tasks in a neatly organized list.
- **Search Tasks:** Quickly find tasks by searching for keywords.
- **Delete Tasks:** Remove tasks that are no longer needed.

## Technologies Used

- **Swift:** The main programming language used for development.
- **MVVM Architecture:** Ensures a clean separation between business logic and UI.
- **CoreData:** Used for persistent storage to save tasks.

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+


## Usage

1. **Add a Task:**
   - Tap the "+" button on the main screen.
   - Enter the task title and details.
   - Tap "Save" to add the task to your list.

2. **List Tasks:**
   - All added tasks are displayed on the main screen.
   - Scroll through the list to view all tasks.

3. **Search Tasks:**
   - Use the search bar at the top of the main screen.
   - Enter keywords to filter tasks.

4. **Delete Tasks:**
   - Swipe left on a task to reveal the delete option.
   - Tap "Delete" to remove the task.

## MVVM Architecture

### Model
- **Task:** Represents the task entity with properties like title and details, and is managed by CoreData.

### View
- **TaskListViewController:** Displays the list of tasks and includes the search functionality.
- **TaskDetailViewController:** Allows the user to add or edit tasks.

### ViewModel
- **TaskViewModel:** Handles the business logic for task operations such as adding, searching, and deleting tasks. It interacts with the CoreDataManager to perform these operations.

### CoreData
- **CoreDataManager:** Manages the CoreData stack and performs CRUD operations on tasks.

