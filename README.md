# 🌈 Bumou – Weekly Mood Sharing App (Flutter + Next.js + PostgreSQL)

**Bumou** is a modern social mobile app built with **Flutter** and powered by a **Next.js backend**. Users can log their **weekly moods**, share publicly, and interact socially through **likes, comments, followers, notifications**, and **real-time chat**. The app is fully localized in **Chinese** and designed for an engaging and smooth user experience.

---

## 🌟 Key Features

### 📅 Weekly Mood Logging
- Record moods weekly with emojis, text, or images
- Personal mood history saved privately

### 🌍 Public Mood Sharing
- Share moods with the community
- Like and comment on others' posts
- View posts in a feed with real-time updates

### 👥 Social Interactions
- Follow/unfollow users
- View followers and following lists
- Get notified on follows, likes, and comments

### 💬 Messaging & Chat
- Real-time one-on-one chat
- Seen, delivered, and typing indicators

### 🔔 Notifications
- In-app and push notifications for:
  - New followers
  - Likes and comments
  - Chat messages

### 🌐 Chinese Localization
- Full Chinese (中文) support via `intl` and `flutter_localizations`
- Locale auto-detect and manual switch

---

## 🛠 Tech Stack

### Frontend (Flutter)
- **Flutter 3.x** with Dart
- `flutter_localizations`, `intl`
- `dio` for REST API
- State management: Provider / get
- Custom theming and responsive UI

### Backend (Next.js)
- **Next.js (API routes)** for backend services
- **PostgreSQL** with Prisma ORM
- JWT-based auth
- RESTful APIs for moods, users, comments, likes, and chat
- WebSocket (Socket.IO or Next.js + WS) for messaging

---

## 🚀 Getting Started

### 🧩 Flutter Frontend

```bash
git clone https://github.com/iHamza7/bumou.git
cd bumou
flutter pub get
flutter run
