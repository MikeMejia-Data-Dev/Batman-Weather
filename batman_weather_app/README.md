# 🦇 Batman Weather App

A cinematic Flutter weather application inspired by Batman and Gotham City.  
This app uses the OpenWeatherMap API, Clean Architecture, Dio, environment variables, and dynamic animated GIF backgrounds based on the current temperature.

---

# ✨ Features

- 🌤 Current weather search by city
- 🎥 Dynamic Batman GIF backgrounds
- 🧱 Clean Architecture
- 📂 Feature-first folder structure
- 🌐 Dio HTTP client
- 🔐 Environment variables with flutter_dotenv
- ⏳ Loading states
- ❌ Error handling
- 📱 Responsive UI
- 🌑 Dark cinematic Batman theme

---

# 🛠 Tech Stack

- Flutter
- Dart
- Dio
- flutter_dotenv
- OpenWeatherMap API

---

# 📁 Project Architecture

```txt
lib/
├── core/
│   ├── config/
│   │   └── env_config.dart
│   │
│   └── network/
│       └── dio_client.dart
│
├── feature/
│   └── weather/
│       ├── domain/
│       │   ├── models/
│       │   │   └── weather.dart
│       │   │
│       │   ├── repositories/
│       │   │   └── weather_repository.dart
│       │   │
│       │   └── usecases/
│       │       └── get_weather_usecase.dart
│       │
│       ├── infraestructure/
│       │   ├── repositories/
│       │   │   └── weather_repository_impl.dart
│       │   │
│       │   └── services/
│       │       └── weather_api_service.dart
│       │
│       └── presentation/
│           ├── screens/
│           │   └── weather_screen.dart
│           │
│           └── widgets/
│               └── weather_card.dart
│
├── main.dart
│
assets/
└── gifs/
    ├── batman_belly.gif
    ├── dc_comics.gif
    └── storm.gif
```

---

# 🎥 Dynamic Batman Backgrounds

The app changes the background GIF dynamically according to temperature.

| Temperature | Background |
|---|---|
| ≤ 10°C | storm.gif |
| 11°C → 25°C | batman_belly.gif |
| > 25°C | dc_comics.gif |

---

# 🚀 Installation

## 1. Clone Repository

```bash
git clone https://github.com/your-username/batman_weather_app.git
```

---

## 2. Install Dependencies

```bash
flutter pub get
```

---

# 🔐 Environment Variables

Create a `.env` file in the root of the project:

```env
OPEN_WEATHER_API_KEY=your_api_key_here
```

---

# 🌤 OpenWeather API

Create a free API key here:

https://openweathermap.org/api

---

# 📦 pubspec.yaml Configuration

```yaml
flutter:
  uses-material-design: true

  assets:
    - .env
    - assets/gifs/
```

---

# ▶ Running the Project

## Web

```bash
flutter run -d chrome
```

## Android

```bash
flutter run
```

## Windows

```bash
flutter run -d windows
```

---

# 🌐 Dio Configuration

The project uses a centralized Dio client.

## Features

- Base URL configuration
- Timeouts
- Logging interceptor
- Scalable architecture

---

# 🧱 Clean Architecture Layers

## presentation/

Contains:

- UI
- Screens
- Widgets
- Loading states
- Inputs

---

## domain/

Contains:

- Models
- Repository contracts
- Use cases

This layer has no external dependencies.

---

## infraestructure/

Contains:

- Dio requests
- API services
- Repository implementations
- JSON handling

---

# 🦇 Batman Theme

The UI uses:

- dark overlays
- animated Gotham-style backgrounds
- yellow Batman accent colors
- cinematic visual atmosphere

---

# 🔮 Future Improvements

- Riverpod state management
- Forecast API
- Geolocation weather
- Glassmorphism UI
- Lottie animations
- Offline cache
- Unit testing
- Material 3
- Weather animations
- Gotham city effects
- Hero animations

---

# 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter

  dio: ^5.5.0+1
  flutter_dotenv: ^5.1.0
```

---

# 📸 Screenshots

Add screenshots here later:

```txt
screenshots/
├── home.png
├── cold_weather.png
└── hot_weather.png
```

---

# 👨‍💻 Author

Created with Flutter and Clean Architecture.
