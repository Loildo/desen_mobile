import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class DadosAgendamentoScreen extends StatefulWidget {
  @override
  _DadosAgendamentoScreenState createState() => _DadosAgendamentoScreenState();
}

class _DadosAgendamentoScreenState extends State<DadosAgendamentoScreen> {
  final TextEditingController _nomePetController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  bool _isMacho = false;
  bool _isFemea = false;

  String? selectedPorte;
  String? selectedHorario;
  int? dia;
  String? mes;
  int? userID;

  bool _isFormValid() {
    
    return _nomePetController.text.isNotEmpty &&
        _idadeController.text.isNotEmpty &&
        (_isMacho || _isFemea) &&
        selectedPorte != null &&
        selectedHorario != null;
  }

  void _salvarAgendamento() async {
    if (_isFormValid()) {
      String nomePet = _nomePetController.text;
      String idade = _idadeController.text;
      String sexo = _isMacho ? 'Macho' : 'Fêmea';
      String porte = selectedPorte!;
      String horario = selectedHorario!;
      
      try {
        
        DatabaseHelper dbHelper = DatabaseHelper();
        int agendamentoID = await dbHelper.inserirAgendamento(
          nomePet,
          idade,
          sexo,
          porte,
          horario,
          dia!,
          mes!,
          userID!
        );

        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sucesso'),
              content: Text('Agendamento realizado com sucesso! ID: $agendamentoID'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    Navigator.pushReplacementNamed(
                      context,
                      '/lista_agendamentos',
                      arguments: {'userID': userID},  
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Erro ao salvar agendamento: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Atenção'),
            content: Text('Preencha todos os campos obrigatórios.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    
    selectedPorte = arguments?['porte'] ?? 'Porte '; 
    selectedHorario = arguments?['horario'] ?? 'Horário '; 
    userID = arguments?['userID'] ?? 'Usuário'; 
    dia = arguments?['dia'] ?? 'dia'; 
    mes = arguments?['mes'] ?? 'mes'; 

    return Scaffold(
      backgroundColor: Color(0xff5271ff), 
      body: SafeArea(
        child: Stack(
          children: [
            
            SingleChildScrollView(  
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  
                  Text(
                    'Pet Feliz',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xfff4f6ff), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  
                  Text(
                    'Dados de agendamento',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xfff4f6ff), 
                    ),
                  ),
                  SizedBox(height: 20),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f6ff), 
                        borderRadius: BorderRadius.circular(16), 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Porte: $selectedPorte',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5271ff),
                                ),
                              ),
                              Text(
                                'Horário: $selectedHorario',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5271ff),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          
                          Text(
                            'Nome do Pet',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff5271ff),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _nomePetController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),

                          
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Idade',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5271ff),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: _idadeController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sexo',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff5271ff),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _isMacho,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                _isMacho = newValue ?? false;
                                                _isFemea = false; 
                                              });
                                            },
                                          ),
                                          Text(
                                            'Macho',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5271ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _isFemea,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                _isFemea = newValue ?? false;
                                                _isMacho = false; 
                                              });
                                            },
                                          ),
                                          Text(
                                            'Fêmea',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5271ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          
                          Text(
                            'Obs:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff5271ff),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _isFormValid() ? _salvarAgendamento : null, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), 
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                             Navigator.pushNamed(
                              context,
                              '/agendamento',
                              arguments: userID
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), 
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0, top: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 30),
                          SizedBox(width: 10),  
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 24),
                          SizedBox(width: 10),  
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
