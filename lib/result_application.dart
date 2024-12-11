// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:revisao_api/aluno.dart';

class ResultApplication {
  bool? sucesso;
  String? mensagem;
  String? erro;
  List? dados;
  Aluno? aluno;

  ResultApplication({
    this.sucesso,
    this.mensagem,
    this.erro,
    this.dados,
    this.aluno,
  });

  ResultApplication copyWith({
    bool? sucesso,
    String? mensagem,
    String? erro,
    List? dados,
    Aluno? aluno,
  }) {
    return ResultApplication(
      sucesso: sucesso ?? this.sucesso,
      mensagem: mensagem ?? this.mensagem,
      erro: erro ?? this.erro,
      dados: dados ?? this.dados,
      aluno: aluno ?? this.aluno,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sucesso': sucesso,
      'mensagem': mensagem,
      'erro': erro,
      'dados': dados,
      'aluno': aluno == null ? Aluno().toMap() : aluno?.toMap(),
    };
  }

  factory ResultApplication.fromMap(Map<String, dynamic> map) {
    return ResultApplication(
      sucesso: map['sucesso'] != null ? map['sucesso'] as bool : null,
      mensagem: map['mensagem'] != null ? map['mensagem'] as String : null,
      erro: map['erro'] != null ? map['erro'] as String : null,
      dados: map['dados'] != null ? map['dados'] as List : null,
      aluno: map['dados'] != null ? Aluno.fromJson(map['aluno']): null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultApplication.fromJson(String source) =>
      ResultApplication.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultApplication(sucesso: $sucesso, mensagem: $mensagem, erro: $erro, dados: $dados, aluno: $aluno)';
  }

  @override
  bool operator ==(covariant ResultApplication other) {
    if (identical(this, other)) return true;
  
    return 
      other.sucesso == sucesso &&
      other.mensagem == mensagem &&
      other.erro == erro &&
      other.dados == dados &&
      other.aluno == aluno;
  }

  @override
  int get hashCode {
    return sucesso.hashCode ^
      mensagem.hashCode ^
      erro.hashCode ^
      dados.hashCode ^
      aluno.hashCode;
  }
}
