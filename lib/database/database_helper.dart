import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<void> deletarBanco() async {
    String path = join(await getDatabasesPath(), 'petFeliz.db');
    await deleteDatabase(path);
  }

Future<Database> _initDatabase() async {
  String path = join(await getDatabasesPath(), 'petFeliz.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      print("Criando tabelas...");
      await db.execute('''
        CREATE TABLE Usuario (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL,
          email TEXT NOT NULL,
          senha TEXT NOT NULL
        )
      ''');
      await db.execute('''
        CREATE TABLE Agendamento (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nomePet TEXT NOT NULL,
          idade TEXT NOT NULL,
          sexo TEXT NOT NULL,
          porte TEXT NOT NULL,
          horario TEXT NOT NULL,
          dia INTEGER NOT NULL,
          mes TEXT NOT NULL,
          usuarioID INTEGER NOT NULL,
          FOREIGN KEY (usuarioID) REFERENCES Usuario (id)
        )
      ''');
      print("Tabelas criadas com sucesso.");
    },
  );
}

  Future<int> inserirUsuario(String nome, String email, String senha) async {
    final db = await database;
    // Inserir o usuário e pegar o ID da linha inserida
    int id = await db.insert(
      'Usuario',
      {
        'nome': nome,
        'email': email,
        'senha': senha,
      },
      // conflictAlgorithm: ConflictAlgorithm.replace,  // Caso haja conflito de ID
    );
    return id;  // Retorna o ID do usuário inserido
  }

  Future<int> inserirAgendamento(String nomePet, String idade, String sexo, String porte, String horario, int dia, String mes, int userID) async {
    final db = await database;
    // Inserir o usuário e pegar o ID da linha inserida
    int id = await db.insert(
      'Agendamento',
      {
        'nomePet': nomePet,
        'idade': idade,
        'sexo': sexo,
        'porte': porte,
        'horario': horario,
        'dia': dia,
        'mes': mes,
        'usuarioID': userID
      }
    );
    return id;  // Retorna o ID do agendamento
  }


  Future<List<String>> listarUsuarios() async {
    final db = await database;
    // Query para pegar apenas a coluna 'nome' da tabela 'Usuario'
    List<Map<String, dynamic>> resultado = await db.query('Usuario', columns: ['nome']);
    
    // Mapeia o resultado para uma lista de nomes
    List<String> nomes = resultado.map((usuario) => usuario['nome'] as String).toList();
    print(nomes);
    return nomes;
  }

  Future<int?> buscarIdUsuarioPorEmailSenha(String email, String senha) async {
    final db = await database;
    List<Map<String, dynamic>> resultado = await db.query(
      'Usuario',
      columns: ['id'], // Seleciona apenas o ID
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    if (resultado.isNotEmpty) {
      return resultado.first['id'] as int; // Retorna o ID do primeiro resultado
    }
    return null; // Retorna null se não encontrar
  }

  Future<List<Map<String, dynamic>>> listarAgendamentosPorUsuario(int usuarioID) async {
    final db = await database;
    
    // Query para listar todos os agendamentos do usuário com o ID fornecido
    List<Map<String, dynamic>> resultado = await db.query(
      'Agendamento',
      where: 'usuarioID = ?',
      whereArgs: [usuarioID],
    );

    return resultado;  // Retorna a lista de agendamentos
  }


}
