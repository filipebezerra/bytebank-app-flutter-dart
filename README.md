# bytebank

Bytebank is a toy app applying fundamental concepts while learning Flutter for mobile development at Alura.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project structure

- main: Only contains the BytebankApp() class applying some Material Theming
- ui: Contains classes scoped to the User Interface/Interaction layer
    - cadastro: Secondary screen where transfers are made
    - lista: Primary screen where user sees the list of transfers
- domain: Contains classes scoped to the application Domain layer
    - models: Contains the single model for this application
- components: Reusable components for the application