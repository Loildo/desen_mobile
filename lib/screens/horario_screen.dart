import 'package:flutter/material.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  // Listas para dias e meses
  final List<int> dias = List.generate(31, (index) => index + 1);
  final List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  // Valores selecionados
  int? diaSelecionado;
  String? mesSelecionado;

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
                SizedBox(height: 20),
                // Campos de seleção de dia e mês
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dropdown para selecionar o dia
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xfff4f6ff),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<int>(
                          value: diaSelecionado,
                          hint: Text(
                            'Dia',
                            style: TextStyle(color: Color(0xff5271ff)),
                          ),
                          dropdownColor: Color(0xfff4f6ff),
                          underline: SizedBox(),
                          items: dias.map((int dia) {
                            return DropdownMenuItem<int>(
                              value: dia,
                              child: Text(
                                '$dia',
                                style: TextStyle(color: Color(0xff5271ff)),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? novoDia) {
                            setState(() {
                              diaSelecionado = novoDia;
                            });
                          },
                        ),
                      ),
                      // Dropdown para selecionar o mês
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xfff4f6ff),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          value: mesSelecionado,
                          hint: Text(
                            'Mês',
                            style: TextStyle(color: Color(0xff5271ff)),
                          ),
                          dropdownColor: Color(0xfff4f6ff),
                          underline: SizedBox(),
                          items: meses.map((String mes) {
                            return DropdownMenuItem<String>(
                              value: mes,
                              child: Text(
                                mes,
                                style: TextStyle(color: Color(0xff5271ff)),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? novoMes) {
                            setState(() {
                              mesSelecionado = novoMes;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                            if (diaSelecionado == null || mesSelecionado == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Selecione o dia e o mês!')),
                              );
                              return;
                            }
                            print('Horário selecionado: $horaFormatada');
                            Navigator.pushNamed(
                              context,
                              '/dados_agendamento',
                              arguments: {
                                'porte': selectedPorte,
                                'servico': servicoSelecionado,
                                'horario': horaFormatada,
                                'dia': diaSelecionado,
                                'mes': mesSelecionado,
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
