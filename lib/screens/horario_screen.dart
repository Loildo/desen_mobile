import 'package:flutter/material.dart';

class HorarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recuperando o valor de 'porte' passado pela tela anterior
    final String? selectedPorte = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: SafeArea(
        child: Stack(
          children: [
            // Conteúdo principal da tela
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
                            // Ação ao selecionar um horário
                            print('Horário selecionado: $horaFormatada');
                            // Redireciona para a tela "/dados_agendamento" e passa o porte e horário
                            Navigator.pushNamed(
                              context,
                              '/dados_agendamento',
                              arguments: {
                                'porte': selectedPorte,
                                'horario': horaFormatada,
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

            // Botão Voltar no canto superior esquerdo
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);  // Vai voltar para a tela anterior
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
