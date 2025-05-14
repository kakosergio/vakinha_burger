# 🍔 Vakinha Burger

---

## 📋 Topics

- [📖 About](#-about)
- [📱 Preview](#-preview)
- [🛠️ Functionalities](#-functionalities)
- [🤯 Challenges and Learnings along the way](#-challenges-and-learnings-along-the-way)
- [🤔 How to Use](#-how-to-use)
- [💪 How to Contribute](#-how-to-contribute)
- [📝 License](#-license)

---

## 📖 About

**Vakinha Burger** is a food delivery app focused on restaurant orders, built with **Flutter 💙**.

It was created as a real-world project to simulate a modern burger ordering experience, with cart features, user accounts, and order tracking — and served as a great opportunity to deepen my knowledge in Flutter and API integrations.

The idea is simple: offer a smooth and practical ordering flow, both for users and restaurants.  
You could easily adapt it as a base for an MVP or a production app for local businesses. 🍟🍔

---

## 📱 Preview

Here are some screenshots of the app in action:  

🧐 _Screenshots coming soon..._  

---

## 🛠️ Functionalities

The app includes several core features:

### 🛒 Product Catalog

- View a list of burgers and items available at the restaurant
- Check **name**, **description**, **price**, and **image**
- Add/remove items from the cart

### 🧾 Shopping Cart (CRUD)

- Add items to the cart
- Update item quantities
- Remove items from the cart
- View cart total

### 📦 Order Tracking

- Place an order and track its status:
  - **Pending**
  - **Preparing**
  - **Out for delivery**
  - **Delivered**

### 👤 Authentication

- User registration
- Login and logout
- Store user session with Firebase Auth

### 🗺️ Store Info

- View restaurant location via Google Maps
- Contact the restaurant by phone

### 💅 UI/UX

- Clean and responsive interface
- Organized navigation with bottom navigation bar and routing

---

## 🤯 Challenges and Learnings along the way

Developing Vakinha Burger was a great hands-on experience with:

- API Authentication with implementation of Auth Token and Refresh Token
- Advanced Flutter state management using **Cubit/Bloc**
- Clean architecture patterns
- Asynchronous programming and data flow control
- Building dynamic UIs based on state changes

Some of the lessons came from small bugs, others from big architectural decisions — but all of them helped me level up as a Flutter developer. 💪🚀

---

## 🤔 How to Use

### Before you start

Make sure your environment is set up for Flutter:  
👉 https://flutter.dev/docs/get-started/install

### Steps

```bash
# Clone the repository
git clone https://github.com/seu-usuario/vakinha_burger.git

# Enter the project directory
cd vakinha_burger

# Get the dependencies
flutter pub get

# Run the app
flutter run
```

> Obs.: configure um Firebase project e adicione os arquivos `google-services.json` e/ou `GoogleService-Info.plist` se necessário.

---

## 💪 How to Contribute

1. Fork this repository
2. Create a branch for your feature  
```bash
git checkout -b feature/my-feature
```
3. Commit your changes  
```bash
git commit -m "feat: add my new feature"
```
4. Push to your branch  
```bash
git push origin feature/my-feature
```
5. Open a Pull Request 🚀

---

## 📝 License

This project is under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Made with ❤️ by **Sérgio Teixeira**  
With the instructor **Rodrigo Rahman**, in the event _"Dart Week 9"_ on **Academia do Flutter**.  
If it helped you, give ⭐, contribute — it will help me too 😉
