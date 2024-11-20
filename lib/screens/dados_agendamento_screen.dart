import 'package:flutter/material.dart';

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

  bool _isFormValid() {
    // Verificar se todos os campos obrigatórios foram preenchidos
    return _nomePetController.text.isNotEmpty &&
        _idadeController.text.isNotEmpty &&
        (_isMacho || _isFemea) &&
        selectedPorte != null &&
        selectedHorario != null;
  }

  void _enviarFormulario() {
    // Função para enviar os dados do formulário
    if (_isFormValid()) {
      // Se o formulário for válido, colete os dados e envie (ou mostre uma mensagem)
      String nomePet = _nomePetController.text;
      String idade = _idadeController.text;
      String sexo = _isMacho ? 'Macho' : 'Fêmea';

      // Incluindo Porte e Horário
      String porte = selectedPorte!;
      String horario = selectedHorario!;

      // Simule o envio (ou apenas exiba no console)
      print('Enviando Formulário...');
      print('Nome do Pet: $nomePet');
      print('Idade: $idade');
      print('Sexo: $sexo');
      print('Porte: $porte');
      print('Horário: $horario');

      // Aqui você pode adicionar qualquer lógica adicional para enviar os dados, por exemplo, uma chamada API
    } else {
      // Caso contrário, exiba uma mensagem de erro (se necessário)
      print("Preencha todos os campos obrigatórios.");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verifique se a navegação forneceu os argumentos
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    // Verificar se 'arguments' não é null antes de acessar as chaves
    selectedPorte = arguments?['porte'] ?? 'Porte '; // Valor padrão
    selectedHorario = arguments?['horario'] ?? 'Horário '; // Valor padrão

    return Scaffold(
      backgroundColor: Color(0xff5271ff), // Cor de fundo azul #5271ff
      body: SafeArea(
        child: Stack(
          children: [
            // Conteúdo principal da tela
            SingleChildScrollView(  // Torna a tela rolável
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  // Título "Pet Feliz"
                  Text(
                    'Pet Feliz',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xfff4f6ff), // Cor do texto #f4f6ff
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Subtítulo "Dados de agendamento"
                  Text(
                    'Dados de agendamento',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xfff4f6ff), // Cor do texto #f4f6ff
                    ),
                  ),
                  SizedBox(height: 20),

                  // Formulário
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f6ff), // Cor do fundo #f4f6ff
                        borderRadius: BorderRadius.circular(16), // Bordas arredondadas
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Exibe o Porte e Horário selecionados dentro do formulário
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

                          // Campo Nome do Pet
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

                          // Campo Idade e Sexo na mesma linha
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
                                                _isFemea = false; // Desmarca Fêmea se Macho for selecionado
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
                                                _isMacho = false; // Desmarca Macho se Fêmea for selecionado
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

                          // Campo Obs
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

                  // Botões Confirmar e Cancelar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _isFormValid() ? _enviarFormulario : null, // Habilita/Desabilita conforme a validação
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Cor do botão Confirmar
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bordas arredondadas
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
                              '/agendamento'
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Cor do botão Cancelar
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bordas arredondadas
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

                  // Pegadas decorativas na parte inferior direita
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0, top: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 30),
                          SizedBox(width: 10),  // Espaço entre as pegadas
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 24),
                          SizedBox(width: 10),  // Espaço entre as pegadas
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Botão Voltar
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Voltar para a tela anterior
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
