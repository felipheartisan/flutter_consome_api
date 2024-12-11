import 'package:revisao_api/aluno.dart';
import 'package:revisao_api/controller_base.dart';
import 'package:revisao_api/result_application.dart';

class ControllerAluno extends ControllerBase {
  Future<ResultApplication> inserir(Aluno aluno) async {
    return await post("Inserir", aluno.toJson());
  }

  Future<ResultApplication> atualizar(Aluno aluno) async {
    return await put("Atualizar", aluno.toJson());
  }

  Future<ResultApplication> excluir(int codigo) async {
    return await delete("Excluir", codigo);
  }

  Future<ResultApplication> buscar(int codigo) async {
    Map<String, String> parametros = {"codigo": codigo.toString()};
    return await get("Buscar", parametros);
  }

  Future<ResultApplication> buscarTodos() async {
    Map<String, String> parametros = {};
    return await get("BuscarTodos", parametros);
  }
}
