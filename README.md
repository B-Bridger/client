# Bridger

A cross-platform Flutter application with responsive UI that supports Android, iOS, macOS, and Windows.

## Features

- **Cross-platform**: Supports Android, iOS, macOS, and Windows
- **Responsive UI**: Adapts to different screen sizes and orientations
- **State Management**: Uses Provider for efficient state management
- **Window Management**: Desktop window management with bitsdojo_window and window_manager
- **Modern UI**: Material Design 3 with light/dark theme support

## Architecture

```
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models
│   └── user.dart
├── services/                 # Business logic and API services
│   ├── user_service.dart
│   └── window_service.dart
├── providers/                # State management
│   └── user_provider.dart
├── ui/                      # User interface
│   ├── screens/
│   │   └── home_screen.dart
│   └── widgets/
│       ├── responsive_widgets.dart
│       └── user_card.dart
└── utils/                   # Utility functions
    └── responsive_utils.dart
```

## Dependencies

- `provider`: State management
- `window_manager`: Window management for desktop platforms
- `bitsdojo_window`: Advanced window management for Windows/Linux

## Getting Started

1. **Install Flutter**: Make sure you have Flutter installed on your system
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the app**:
   ```bash
   # For macOS
   flutter run -d macos
   
   # For Windows
   flutter run -d windows
   
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   ```

## Responsive Design

The app automatically adapts to different screen sizes:

- **Mobile** (< 600px): Single column layout
- **Tablet** (600px - 1200px): Grid layout with 2-3 columns
- **Desktop** (> 1200px): Grid layout with 4 columns

## Window Management

On desktop platforms, the app includes:
- Custom window sizing and positioning
- Minimum window size constraints
- Window title management
- Platform-specific window behaviors

## State Management

The app uses Provider for state management with:
- User management (CRUD operations)
- Loading states
- Error handling
- Data persistence simulation

## Development

The project follows clean architecture principles:
- Separation of concerns
- Testable code structure
- Responsive design patterns
- Cross-platform compatibility

## Build and Deployment

```bash
# Build for release
flutter build macos
flutter build windows
flutter build android
flutter build ios
```

## License

This project is licensed under the MIT License.
