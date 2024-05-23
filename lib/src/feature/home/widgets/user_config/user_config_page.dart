import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/model/integrantes_model.dart';
import 'package:sos_app/model/user_model.dart';
import 'package:sos_app/src/feature/home/widgets/user_config/cubit/user_cubit_cubit.dart';
import 'package:asyncstate/asyncstate.dart';

class UserConfig extends StatefulWidget {
  final UserModel user;

  const UserConfig({super.key, required this.user});

  @override
  State<UserConfig> createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  final nomeEC = TextEditingController();

  @override
  void dispose() {
    nomeEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nomeEC.text = widget.user.name;
  }

  void increment({required IntegrantesModel integrante}) {
    if (integrante.quantidade > 0) {
      setState(() {
        var index = widget.user.integrantes.indexWhere((element) => element.tipo == integrante.tipo);
        if (index != -1) {
          widget.user.integrantes[index] = integrante.copyWith(quantidade: integrante.quantidade + 1);
        } 
      });
    }  
  }

  void decrement({required IntegrantesModel integrante}) {
    if (integrante.quantidade > 0) {    
      setState(() {
        var index = widget.user.integrantes.indexWhere((element) => element.tipo == integrante.tipo);
        if (index != -1) {
          widget.user.integrantes[index] = integrante.copyWith(quantidade: integrante.quantidade - 1);
        }
      });
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('Conte sobre sua familia',
                style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: nomeEC,
              decoration: const InputDecoration(
                  labelText: 'Nome', border: OutlineInputBorder()),
            ),
            Column(
                children:
                    widget.user.integrantes.map((integrante) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(integrante.tipo),
                        Row(
                          children: [
                            IconButton(onPressed: () {
                              decrement(integrante: integrante);
                            }, icon: const Icon(Icons.remove)),
                            Text(integrante.quantidade.toString()),
                            IconButton(onPressed: () {
                              increment(integrante: integrante);
                            }, icon: const Icon(Icons.add)),
                          ],
                        ),
                      ],
                    )
              ).toList()
            ),
            ElevatedButton(
              onPressed: () {
                context.get<UserCubitCubit>().saveUser(widget.user.copyWith(name: nomeEC.text)).asyncLoader();
              }, 
              child: const Text('SALVAR')
            )
          ],
        ),
      ),
    );
  }
}
