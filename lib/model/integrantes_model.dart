// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IntegrantesModel {
  
  final String tipo;
  final int quantidade;

  IntegrantesModel({
    required this.tipo,
    required this.quantidade,
  });


  IntegrantesModel copyWith({
    String? tipo,
    int? quantidade,
  }) {
    return IntegrantesModel(
      tipo: tipo ?? this.tipo,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipo': tipo,
      'quantidade': quantidade,
    };
  }

  factory IntegrantesModel.fromMap(Map<String, dynamic> map) {
    return IntegrantesModel(
      tipo: map['tipo'] as String,
      quantidade: map['quantidade'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory IntegrantesModel.fromJson(String source) => IntegrantesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IntegrantesModel(tipo: $tipo, quantidade: $quantidade)';

  @override
  bool operator ==(covariant IntegrantesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.tipo == tipo &&
      other.quantidade == quantidade;
  }

  @override
  int get hashCode => tipo.hashCode ^ quantidade.hashCode;
}
