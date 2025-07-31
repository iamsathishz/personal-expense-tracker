# 💰 Personal Finance Tracker App

A modern Flutter application that helps users track income and expenses with clean UI, local storage, and real-time balance updates.

---

## 🚀 Features

- 📊 View real-time balance and transaction history
- ➕ Add new transactions (income or expense)
- 🔄 State management with BLoC + GetIt
- ✅ Clean Architecture (Domain, Data, Presentation)
- 🧪 Unit tested use cases and logic

---

## 📁 Folder Structure (Clean Architecture)


lib/
├── core/                  # Constants, utils
│   └── utils.dart
├── data/                  # Data layer: models & mock services
│   ├── models/
│   │   └── transaction_model.dart
│   └── services/
│       └── transaction_service.dart
├── domain/                # Business logic
│   ├── entities/
│   │   └── transaction_entity.dart
│   ├── repositories/
│   │   └── transaction_repository.dart
│   └── usecases/
│       ├── add_transaction_usecase.dart
│       └── get_balance_usecase.dart
├── presentation/          # UI + BLoC
│   ├── blocs/
│   │   └── transaction_bloc.dart
│   ├── screens/
│   │   ├── dashboard_screen.dart
│   │   └── add_transaction_screen.dart
│   └── widgets/
│       └── transaction_tile.dart
└── main.dart


---



## 🧰 Tech Stack

- **Flutter** 3.19+
- **Dart** 3.x
- **BLoC** for state management
- **GetIt** for dependency injection
- **UUID** for ID generation
- **Intl** for date formatting
- **Flutter Test** for unit testing

---

## 🛠️ Setup Instructions

```bash
# 1. Clone the repository
git clone https://github.com/yourname/personal_finance_tracker.git
cd personal_finance_tracker

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run

# 4. Run tests
flutter test
