# 💰 Personal Finance Tracker App

A modern Flutter application that helps users track income and expenses with clean UI, local storage, and real-time balance updates.

## 🚀 Features

- 📊 View real-time balance and transaction history
- ➕ Add new transactions (income or expense)
- 🔄 State management with BLoC + GetIt
- ✅ Clean Architecture (Domain, Data, Presentation)
- 🧪 Unit tested use cases and logic


## 📱 Screenshots

<div align="center">
<table>
  <tr>
    <th>Dashboard</th>
    <th>Add Transaction</th>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/e721fa7e-3987-4798-adf0-e9fc185722fa" width="250" />
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/06d3aa2d-7cb7-462d-9015-bf6c754db4a2" width="250" />
    </td>
  </tr>
</table>
</div>

---

## 📁 Project Structure (Clean Architecture)

| Folder / File | Description |
|---------------|-------------|
| `lib/` | Root directory for all application code. |
| └── `core/` | Core utilities and common logic. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `utils.dart` | Contains utility functions (e.g., date formatting, helpers). |
| └── `data/` | Data layer: handles models, data sources, repositories. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `models/` | DTOs for mapping between API and domain entities. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_model.dart` | Transaction data model used for serialization. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `repositories/` | Repository implementations calling services. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_repository_impl.dart` | Implements domain repository using services. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `services/` | Handles data fetching/storage logic. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_service_impl.dart` | In-memory/mock service to simulate transactions. |
| └── `domain/` | Core business logic: entities, repositories, and use cases. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `entities/` | Pure business model definitions. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_entity.dart` | Transaction entity class. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `repositories/` | Abstract contracts for repositories. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_repository.dart` | Repository interface used in domain layer. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `usecases/` | Application-specific business logic. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── `add_transaction_usecase.dart` | Adds a transaction. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── `get_balance_usecase.dart` | Calculates current balance. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── `get_transactions_usecase.dart` | Fetches transaction list. |
| └── `presentation/` | UI and state management layer. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `blocs/` | Contains BLoC, Events, and State. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;├── `transaction_bloc.dart` | Manages transaction-related events/state. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;├── `transaction_event.dart` | Events like create/load transaction. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_state.dart` | States like loading, loaded, error. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `screens/` | Application screens. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;├── `add_transaction_screen.dart` | Form to add a new transaction. |
| &nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── `dashboard_screen.dart` | Displays current balance and recent transactions. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `widgets/` | Reusable UI components. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── `balance_card.dart` | Shows total balance card. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── `section_header.dart` | Styled section header. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_card.dart` | Displays a single transaction item. |
| ├── `locator.dart` | Service locator setup using `get_it`. |
| └── `main.dart` | Entry point of the app with `runApp()`. |
| `test/` | Unit and BLoC tests. |
| └── `bloc/` | Tests for BLoC logic. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `transaction_bloc_test.dart` | Validates BLoC event-to-state transitions. |
| └── `usecases/` | Tests for each use case. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `add_transaction_usecase_test.dart` | Unit test for adding a transaction. |
| &nbsp;&nbsp;&nbsp;&nbsp;├── `get_balance_usecase_test.dart` | Unit test for balance calculation. |
| &nbsp;&nbsp;&nbsp;&nbsp;└── `get_transactions_usecase_test.dart` | Unit test for transaction list fetching. |

---


## 🧠 State Management: `flutter_bloc`

We chose [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) as the state management solution for this project. Here's why:

- ✅ **Predictable State Flow**: The clear Event → BLoC → State pattern ensures predictable and manageable application state.
- ✅ **Separation of Concerns**: Keeps UI code separate from business logic, promoting clean architecture.
- ✅ **Well-Supported**: Backed by a strong community and robust documentation.
- ✅ **Testability**: Makes unit and widget testing straightforward.
- ✅ **Scalable**: Easily handles complex state transitions and is suitable for large-scale apps.
- ✅ **GetIt Integration**: Works well with dependency injection for cleaner constructor-based DI.

> While simpler solutions like `Provider` or `Riverpod` offer fast prototyping, `flutter_bloc` provides better structure and maintainability for apps that follow clean architecture.

---

## 📌 Assumptions Made

- Transactions are stored and retrieved locally or via mock services (no real database/API integration).
- Each transaction is either an `income` or an `expense`, with no further categorization.
- Date selection defaults to the current day and only allows past dates (no future transactions).
- UI assumes the device is a mobile screen size (not optimized for tablets or web).
- The `balance` is calculated dynamically by summing incomes and subtracting expenses from the transaction list.

---

## ⚖️ Trade-offs and Design Decisions

- **State Management with BLoC**: Chosen for its separation of concerns and scalability. It can be more verbose than alternatives like Riverpod or Provider, but it provides strong structure and testability.
- **Clean Architecture**: The project follows a domain-driven, layered architecture (Data → Domain → Presentation). This ensures separation of logic but introduces boilerplate.
- **No Persistent Storage**: For simplicity, this version uses in-memory or mock data rather than integrating with a local DB like Hive or SQLite.
- **UI Styling**: Inspired by modern design systems (like FlutterFlow), prioritizing clean UX over advanced animations or transitions to reduce complexity.
- **Validation**: Basic form validation is built-in. No advanced error handling (e.g., server errors) is present in this version.
---

## 🧰 Tech Stack

- **Flutter** 3.19+
- **Dart** 3.x
- **BLoC** for state management
- **GetIt** for dependency injection
- **UUID** for ID generation
- **Flutter Test** for unit testing

---

## 🧪 Run a Specific Test File
```bash
flutter test test/bloc/transaction_bloc_test.dart
flutter test test/usecases/get_balance_usecase_test.dart
flutter test test/usecases/add_transaction_usecase_test.dart
flutter test test/usecases/get_transactions_usecase_test.dart
```

## 🧪 Run all tests
```bash
flutter test
```

## 🛠️ Setup Instructions

```bash
# 1. Clone the repository
git clone https://github.com/yourname/personal_finance_tracker.git
cd personal_finance_tracker

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```


