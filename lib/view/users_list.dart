import 'package:flutter/material.dart';
import 'package:zuri_intro_to_mobile/models/users_model.dart';
import 'package:zuri_intro_to_mobile/services/api_service.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final ApiServices _service = ApiServices();

  final TextStyle _textStyle = const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w800);

  // @override
  // void didChangeDependencies() {
  //   ApiServices.getUsers();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _service.getUsers(),
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<dynamic> usersList = snapshot.data as List<dynamic>;

          return ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (ctx, index){

              UsersModel user = UsersModel.fromJson(usersList[index]);

              return Card(
                elevation: 8,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(user.name!, style: _textStyle.copyWith(color: Colors.black),),
                  subtitle: Text(user.email!, style: _textStyle.copyWith(fontSize: 14, color: Colors.blue),),
                  trailing: Text(user.phone!, style: _textStyle,),
                ),
              );
            },
          );
        },

      ),
    );
  }
}
