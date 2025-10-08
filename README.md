# SamLogistics

[![Flutter](https://img.shields.io/badge/Built%20with-Flutter-blue)](https://flutter.dev) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

---

**SamLogistics** is a modern, responsive logistics app UI built with Flutter. This repository contains the full UI for a logistics product with 14 screens designed from scratch — optimized for mobile, tablet, and web.

> 🚀 **Status:** UI-first implementation — Screens, navigation, theming, and responsive layouts are complete. Backend & integrations are intentionally out of scope for this repo.

---

## 🔗 Live Demo

> **Live Demo:** *Replace the URL below with your deployed demo URL*

[Live Demo (Web)](https://your-live-demo-url.example.com)

---


---

## 🎯 Key Features (UI Focus)

* Clean, modern Material 3 design
* 14 fully-designed screens (mobile-first, responsive)
* Reusable widgets and components (cards, lists, modals)
* Theming (light / dark mode ready)
* Responsive layout helpers for tablet & web
* Placeholder animations for real UX feel (`AnimatedContainer`, `Hero`, `FadeIn` patterns)
* Accessibility considerations (semantic labels & tappable sizes)

---


---

## 🧰 Tech Stack

* Flutter (stable)
* Dart
* Material 3 components
* Recommended packages (UI helpers only): `google_fonts`, `flutter_svg`, `provider` (for simple state), `intl`.

---

## 🚀 Getting Started (Run locally)

### Prerequisites

* Flutter SDK installed — [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
* A device/emulator or Chrome (for web)

### Run

```bash
# Clone the repo
git clone https://github.com/<your-username>/samlogistics.git
cd samlogistics

# Fetch dependencies
flutter pub get

# Run on a connected device or emulator
flutter run

# Or run as web demo
flutter run -d chrome
```

---

## 🗂 Project Structure (recommended)

```
/lib
  /screens
    splash.dart
    onboarding.dart
    auth
      login.dart
      register.dart
    dashboard.dart
    shipments
      shipments_list.dart
      shipment_details.dart
      create_shipment.dart
    track.dart
    drivers
      drivers_list.dart
      driver_details.dart
    vehicles
      vehicles.dart
    notifications.dart
    profile.dart
  /widgets
    shipment_card.dart
    primary_button.dart
    info_tile.dart
  /themes
    app_theme.dart
  main.dart
/assets
  /screenshots
  /icons
```

---

## 🎨 Design & UI Guidelines

* **Colors**: Define a neutral palette + primary accent in `themes/app_theme.dart`.
* **Typography**: Use `google_fonts` for consistent typography across platforms.
* **Spacing**: Use a spacing scale (4, 8, 12, 16, 24, 32) and `EdgeInsets.symmetric` helpers.
* **Icons**: Use `flutter_svg` for crisp icons and support vector assets.

---

```

---

## 🤝 Contributing

Contributions are welcome — UI improvements, new widgets, or responsive fixes.

1. Fork the repo
2. Create a branch: `git checkout -b feat/my-ui-change`
3. Commit your changes: `git commit -m "feat: improve shipment card"`
4. Push to the branch and open a PR

---

## 📄 License

This project is released under the **MIT License**. See [LICENSE](./LICENSE) for details.

---


<!-- End of README -->
