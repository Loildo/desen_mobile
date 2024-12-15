import 'package:flutter/material.dart';

class HorarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recupera os argumentos passados
    final Map? args = ModalRoute.of(context)?.settings.arguments as Map?;
    final String? selectedPorte = args?['porte'];
    final String? servicoSelecionado = args?['servico'];
    final int? userID = args?['userID'];

    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'Pet Feliz',
                  style: TextStyle(fontSize: 36, color: Color(0xfff4f6ff), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('Escolha seu horário', style: TextStyle(fontSize: 28, color: Color(0xfff4f6ff))),
                SizedBox(height: 40),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        int hora = 8 + index;
                        String horaFormatada = '${hora.toString().padLeft(2, '0')}:00';

                        return ElevatedButton(
                          onPressed: () {
                            print('Horário selecionado: $horaFormatada');
                            // Envia os dados para a próxima tela
                            Navigator.pushNamed(
                              context,
                              '/dados_agendamento',
                              arguments: {
                                'porte': selectedPorte,
                                'servico': servicoSelecionado,
                                'horario': horaFormatada,
                                'userID': userID,
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff4f6ff),
                            foregroundColor: Color(0xff5271ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            elevation: 5,
                          ),
                          child: Text(
                            horaFormatada,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
