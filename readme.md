# 🪄 **Verbadicium – A Beautiful SwiftUI Dictionary App**

*A lightweight, fast, and modern English dictionary built using SwiftUI + MVVM.*

Verbadicium is a SwiftUI-based dictionary application that lets users quickly search for word definitions, phonetics, pronunciations, and usage examples. It uses a clean architecture, async networking, and modern iOS development patterns.

---

## ✨ Features

### 🔍 **Search Words**

* Fast, responsive search powered by async/await.
* Clean search UI with real-time loading indicators.
* Displays multiple definitions, meanings, and phonetics.

### 🔊 **Audio Pronunciation**

* Tap the play button to hear the word’s pronunciation.
* Built using `AVPlayer` and supports remote audio URLs.

### 📚 **Beautiful Word Detail View**

* Shows:

  * Definitions
  * Phonetics
  * Example sentences
  * Parts of speech
* Modern SwiftUI layout with smooth transitions.

### 🎯 **Offline-Friendly Design**

* Fast fetch & lightweight API usage.
* Can be extended with caching in the future.

### 🧱 **Modern Architecture**

* MVVM (Model-View-ViewModel)
* Repository + Service abstractions
* Dependency Injection
* Combine for event binding
* Async/Await for networking

---

## 🛠️ Tech Stack

| Layer         | Technology                                  |
| ------------- | ------------------------------------------- |
| UI            | SwiftUI                                     |
| Architecture  | MVVM                                        |
| Networking    | URLSession + async/await                    |
| Audio         | AVPlayer                                    |
| State Binding | SwiftUI + Combine                           |
| DI            | Injected repository/service                 |
| API           | dictionaryapi.dev (or your custom base URL) |

---

## 🚀 Getting Started

### **1. Clone the repository**

```bash
git clone https://github.com/yourusername/verbadicium.git
cd verbadicium
```

### **2. Open in Xcode**

```
open Verbadicium.xcodeproj
```

or for Swift Packages:

```
open Package.swift
```

### **3. Configure API Endpoint**

Update your base URL:

```swift
AppEnvironment.default.apiBaseURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en")!
```

### **4. Build & Run**

Select a simulator → press **Cmd + R**

---

## 📡 API Reference

This project uses the publicly available Dictionary API:

```
GET /api/v2/entries/en/<WORD>
```

Sample response includes:

* Word
* Phonetics (audio, text)
* Meanings (definitions, examples)
* Part of speech

---

## 🧪 Future Improvements

* Local caching for offline use
* Favorites / history tab
* Better audio player with UI feedback
* Search suggestions
* iCloud sync
* WidgetKit integration

---

## ❤️ Author

**Rehan Ankalgi**
Full-Stack Developer & iOS Enthusiast

GitHub: [https://github.com/rehan-ankalgi-7t2](https://github.com/rehan-ankalgi-7t2)

LinkedIn: [https://www.linkedin.com/in/rehan-ankalgi/](https://www.linkedin.com/in/rehan-ankalgi/)
