import 'package:flutter/material.dart';
import 'package:sos_app/model/user_model.dart';
import 'package:sos_app/src/feature/home/widgets/map/widgets/detail_user.dart';

class ListUsers extends StatelessWidget {
  final List<UserModel> users;

  const ListUsers({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Pessoas na proximidade'),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => DetailUser(user: user),
                  );
                },
                leading: CircleAvatar(child: Text(user.name[0])),
                title: Text(user.name),
                trailing:
                    Text('${(user.distance / 1000).toStringAsFixed(2)} km'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: users.length,
          ),
        ),
      ],
    );
  }
}
