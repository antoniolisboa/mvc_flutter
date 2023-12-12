# Padrão MVC no Flutter
Um projeto para entender como funciona o padrão MVC no Dart/Flutter

## Padrão MVC
O padrão de arquitetura MVC (Model-View-Controller) é uma abordagem de design que visa organizar e estruturar o código de uma aplicação de forma modular e separada, facilitando a manutenção, escalabilidade e testabilidade do software.
Este projeto é dividido em 4 partes:

1. [Criando um Modelo](##criando-um-modelo)
2. [Criando uma Visualização](##criando-uma-visualização)
3. [Criando um Controlador](#criando-um-controlador)
4. [Definição da _main_](##definição-da-main)

Estrutura do projeto:
``` vbnet
my_project/
├── lib/
│   ├── controllers/
│   │   ├── my_controller.dart
│   ├── models/
│   │   ├── user.dart
│   ├── views/
│   │   ├── my_view.dart
│   ├── main.dart
```

## Criando um Modelo 
Model (Modelo): Representa os dados e a lógica de negócios da aplicação. É responsável por armazenar, processar e manipular os dados, garantindo a consistência e integridade das informações.

```dart
class User {
  String name;
  int age;
  
  User({required this.name, required this.age});
}
```

## Criando uma Visualização
View (Visualização): Refere-se à camada de apresentação ou interface do usuário. É responsável por exibir os dados ao usuário final de maneira compreensível e interativa. A View não contém lógica de negócios, apenas exibe o que é fornecido pelo Modelo.

```dart
import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProfileView extends StatelessWidget {
  final User user;

  const UserProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Age: ${user.age}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Criando um Controlador
Controller (Controlador): Atua como intermediário entre o Modelo e a View. Recebe as interações do usuário na View, processa essas interações, atualiza o Modelo conforme necessário e, em seguida, atualiza a View para refletir as mudanças. O Controller mantém a lógica de controle e coordenação.

```dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../views/user_profile_view.dart';

class UserProfileController extends StatefulWidget {
  final User user;

  const UserProfileController({super.key, required this.user});

  @override
  State<UserProfileController> createState() => _UserProfileControllerState();
}

class _UserProfileControllerState extends State<UserProfileController> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return UserProfileView(user: _user);
  }
}
```

## Definição da _main_

```dart
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'controllers/user_profile_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User(name: 'Antonio', age: 24);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC in Flutter',
      home: UserProfileController(user: user),
    );
  }
}
```

## Conclusão
Em resumo, o padrão MVC proporciona uma estrutura organizada para o desenvolvimento de software, tornando-o mais modular, expansível e fácil de entender, contribuindo para a construção de aplicativos mais robustos e eficientes.

## Referência

[https://santhosh-adiga-u.medium.com/using-the-model-view-controller-mvc-pattern-in-flutter-fdc7dbeafe27](https://santhosh-adiga-u.medium.com/using-the-model-view-controller-mvc-pattern-in-flutter-fdc7dbeafe27)
