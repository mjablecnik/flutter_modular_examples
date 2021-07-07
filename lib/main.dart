import 'package:boilerplate/app/modules/example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

   runApp(
     ModularApp(
       module: AppModule(),
       child: AppWidget(),
     ),
   );
 }

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
    ).modular();
  }
}

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: ExampleModule())
  ];

}
