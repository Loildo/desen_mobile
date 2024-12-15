import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class ListaAgendamentoScreen extends StatefulWidget {
  @override
  _ListaAgendamentoScreenState createState() => _ListaAgendamentoScreenState();
}

class _ListaAgendamentoScreenState extends State<ListaAgendamentoScreen> {
  List<Map<String, dynamic>> _agendamentos = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Obtém os argumentos passados para a tela, incluindo o usuarioID
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    int? usuarioID = args?['userID'];

    // Carrega os agendamentos do usuário
    if (usuarioID != null) {
      _carregarAgendamentos(usuarioID);
    }
  }

  Future<void> _carregarAgendamentos(int usuarioID) async {
    // Consulta os agendamentos no banco de dados
    List<Map<String, dynamic>> agendamentos = await DatabaseHelper().listarAgendamentosPorUsuario(usuarioID);

    setState(() {
      _agendamentos = agendamentos;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    int usuarioID = args?['userID'];
    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      appBar: AppBar(
        title: Text('Meus Agendamentos'),
        backgroundColor: Color(0xff5271ff),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/agendamento', arguments: usuarioID );
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _agendamentos.length,
          itemBuilder: (context, index) {
            final agendamento = _agendamentos[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Pet: ${agendamento['nomePet']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Idade: ${agendamento['idade']} anos'),
                    Text('Sexo: ${agendamento['sexo']}'),
                    Text('Porte: ${agendamento['porte']}'),
                    Text('Dia: ${agendamento['dia']}'),
                    Text('Mês: ${agendamento['mes']}'),
                    Text('Horário: ${agendamento['horario']}'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Ao clicar no item, você pode abrir detalhes ou editar o agendamento
                  // Navigator.pushNamed(context, '/detalhes_agendamento', arguments: agendamento);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
