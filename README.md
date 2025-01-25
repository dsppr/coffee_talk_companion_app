# Coffee Talk Companion App

## Overview

The **Coffee Talk Companion App** is a mobile application designed for fans of the popular game **Coffee Talk**. It offers interactive features such as character exploration, drink recipes, and a brewing simulation. The app aims to enhance the fan experience with an intuitive design and engaging functionality.

---

## Features

### 1. Splash Screen

- Displays the app logo with an animated effect using **Lottie**.
- Automatically navigates to the character list after a few seconds.

### 2. Character List

- A list of characters with their image, name, and brief description.
- Clicking on a character opens the detailed view of that character.

### 3. Drink Details

- Provides detailed information about drinks, including:
  - Name
  - Image
  - Description
  - Ingredients
- Option to start a brewing simulation.

### 4. Brewing Simulation

- Allows users to mix three ingredients to create a drink.
- Validates the ingredients based on predefined recipes.
- Displays success or failure notifications.

---

## Technologies Used

### Framework and Tools

- **Flutter** for app development.
- **Dart** as the programming language.
- **Provider** for state management.
- **Lottie** for animations.
- **VS Code** for development.
- **Android Studio** as the emulator.

### File Structure

```
lib/
├── assets
│   ├── data
│   │   └── mock_data.json
│   ├── fonts
│   │   └── [Poppins font files]
│   └── images
│       └── [Character and drink images]
├── data
│   ├── models
│   │   ├── character_model.dart
│   │   └── drink_model.dart
│   ├── repositories
│   │   ├── character_repository.dart
│   │   └── drink_repository.dart
├── ui
│   ├── themes
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   ├── views
│   │   ├── brewing_simulation.dart
│   │   ├── character_detail.dart
│   │   ├── character_list.dart
│   │   ├── drink_detail.dart
│   │   ├── drink_list.dart
│   │   ├── home_screen.dart
│   │   └── splash_screen.dart
│   ├── widgets
│   │   ├── brewing_widget.dart
│   │   ├── character_card_carousel.dart
│   │   ├── character_card.dart
│   │   ├── drink_card_grid.dart
│   │   └── drink_card.dart
│   └── viewmodels
│       ├── brewing_viewmodel.dart
│       ├── character_viewmodel.dart
│       └── drink_viewmodel.dart
└── main.dart
```

---

## Installation Guide

### Prerequisites

- Flutter SDK installed on your system.
- An IDE like **VS Code** or **Android Studio**.

### Steps

1. Clone the repository:
   ```bash
   git clone [REPOSITORY_URL]
   ```
2. Navigate to the project directory:
   ```bash
   cd coffee_talk_companion_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Screenshots

Add screenshots of the app here to showcase its features (e.g., Splash Screen, Character List, Drink Details, Brewing Simulation).

---

## Contribution

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your message here"
   ```
4. Push the changes:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Create a pull request.
