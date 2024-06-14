import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';
// import 'package:flutter_user_list_cubit/user_list/view/user_detail_page.dart';
import 'package:flutter_user_list_cubit/user_list/view/user_list_view.dart';

// part "user_list_view.dart";

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          backgroundColor:
              Color.fromARGB(255, 0, 167, 250), // Warna latar belakang AppBar
        ),
        body: const UserListView(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => context.read<UserListCubit>().fetchUser(),
        //   child: Icon(Icons.refresh),
        //   backgroundColor:
        //       Color.fromARGB(255, 0, 167, 250), // Warna latar belakang FAB
        // ),
      ),
    );
  }
}
