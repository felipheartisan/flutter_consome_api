// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Aluno {
  int? codigo;
  String? nome;
  Aluno({
    this.codigo,
    this.nome,
  });

  Aluno copyWith({
    int? codigo,
    String? nome,
  }) {
    return Aluno(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      codigo: map['codigo'] != null ? map['codigo'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Aluno(codigo: $codigo, nome: $nome)';

  @override
  bool operator ==(covariant Aluno other) {
    if (identical(this, other)) return true;
  
    return 
      other.codigo == codigo &&
      other.nome == nome;
  }

  @override
  int get hashCode => codigo.hashCode ^ nome.hashCode;
}
