# Flutter Page Turn

A lightweight Flutter widget that provides **smooth page turning effects** with support for **multiple animations, autoplay, and navigation controls**.

This package allows developers to easily create **book-style page transitions or onboarding flows** with customizable animations.

---

## ✨ Features

* 📖 Multiple page turn effects
* 🔄 **Slide**, **Flip**, and **Curl** animations
* ▶️ **Auto page turn**
* 📱 **Horizontal and Vertical page turning**
* 🎨 Fully customizable UI
* ⚡ Lightweight and easy to use

---

## 📦 Installation

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_page_turn:
   path: ../
```

Then run:

```
flutter pub get
```

---

## 🚀 Usage

Import the package:

```dart
import 'package:flutter_page_turn/flutter_page_turn.dart';
```

### Basic Example

```dart
PageTurnView.builder(
  itemCount: 5,
  effect: PageTurnEffect.flip,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text(
          "Page ${index + 1}",
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  },
)
```

---

## 🎬 Effects

The package currently supports three page animations.

| Effect                 | Description             |
| ---------------------- | ----------------------- |
| `PageTurnEffect.slide` | Smooth slide transition |
| `PageTurnEffect.flip`  | 3D card flip animation  |
| `PageTurnEffect.curl`  | Book-style page curl    |

Example:

```dart
PageTurnView.builder(
  itemCount: 5,
  effect: PageTurnEffect.curl,
  itemBuilder: (context, index) {
    return Text("Page $index");
  },
)
```

---

## 🔄 Auto Page Turn

Automatically change pages after a delay.

```dart
PageTurnView.builder(
  itemCount: 5,
  autoPlay: true,
  autoPlayDelay: Duration(seconds: 3),
  itemBuilder: (context, index) {
    return Text("Page $index");
  },
)
```
---
## 🎛 Controller Support

You can control pages programmatically using `PageTurnController`.

```dart
final controller = PageTurnController();
```

```dart
PageTurnView.builder(
  controller: controller,
  itemCount: 5,
  itemBuilder: (context, index) {
    return Text("Page $index");
  },
)
```


---

## 📱 Vertical Page Turning

You can change page direction:

```dart
PageTurnView.builder(
  itemCount: 5,
  axis: Axis.vertical,
  itemBuilder: (context, index) {
    return Text("Page $index");
  },
)
```

---


## 📷 Example


https://github.com/user-attachments/assets/3b453423-bbc0-4e72-a9ef-a72b855d2cd7



---

## 📄 License

MIT License

Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction
