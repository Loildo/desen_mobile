import 'package:flutter/material.dart';
import 'screens/cadastro_screen.dart';
import 'screens/login_screen.dart';
import 'screens/agendamento_screen.dart';
import 'screens/servico_screen.dart';
import 'screens/porte_screen.dart';
import 'screens/horario_screen.dart';
import 'screens/dados_agendamento_screen.dart';
import 'screens/valores_screen.dart';
import 'screens/lista_agendamento_screen.dart';
void main() {
  runApp(PetFelizApp());
}

class PetFelizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CadastroScreen(),
        '/login': (context) => LoginScreen(),
        '/agendamento': (context) => AgendamentoScreen(),
        '/servico': (context) => ServicoScreen(),
        '/porte': (context) => PorteScreen(),
        '/horario': (context) => HorarioScreen(),
        '/dados_agendamento': (context) => DadosAgendamentoScreen(),
        '/valores': (context) => ValoresScreen(),
        '/lista_agendamentos': (context) => ListaAgendamentoScreen(),
      },
    );
  }
}
