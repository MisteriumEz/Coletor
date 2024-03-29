import 'package:coletor_nativo/components/cadastro_codbarra.dart';
import 'package:coletor_nativo/components/coletor_add_page.dart';
import 'package:coletor_nativo/components/configuracao.dart';
import 'package:coletor_nativo/components/historico_page.dart';
import 'package:coletor_nativo/components/home_page.dart';
import 'package:coletor_nativo/components/login_screen.dart';
import 'package:coletor_nativo/controller/dark_mode.dart';
import 'package:flutter/material.dart';

//Classe responsável pelas rotas e pelo design do aplicativo
class ThemeData2 extends StatelessWidget {
  const ThemeData2({Key? key, required MyHomePage home}) : super(key: key);
  static final String title = 'Coletor';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Coletor',
        theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: DarkMode.instance
                    .isDarkTheme //Verificador para com o Switch da home_app.dart que faz com que ative o modo noturno
                ? Brightness.dark //Tema noturno
                : Brightness.light,
            // ignore: deprecated_member_use
            accentColor:
                DarkMode.instance.isDarkTheme ? Colors.white : Colors.green),
        routes: <String, WidgetBuilder>{
          '/t': (context) => LoginPage(),
          '/': (context) => MyHomePage(title: title),
          '/addcodbarra': (context) => Coletor_Add(),
          '/historico': (context) => Historico(),
          "/cad": (context) => CadastroCodigoBarra(),
          "/configuracao": (context) => Configuracao(modelador: 1),
        },
      );
}
