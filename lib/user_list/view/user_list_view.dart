import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list_cubit/user_list/cubit/user_list_cubit.dart';
import 'package:flutter_user_list_cubit/user_list/view/user_detail_page.dart';
// import 'package:futter_user_list_cubit/user_list/cubit/user_list_cubit.dart';
// import 'package:futter_user_list_cubit/user_list/cubit/user_list_state.dart';
// import 'package:futter_user_list_cubit/user_list/model/user.dart';
// import 'package:futter_user_list_cubit/user_list/view/user_detail_page.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ari rahmat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          if (state is UserListSuccess) {
            return Scaffold(
              body: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  // Ambil teks body maksimal 55 karakter atau kurang
                  String bodyText = state.users[index].body.length > 55
                      ? state.users[index].body.substring(0, 55) + '...'
                      : state.users[index].body;

                  return ListTile(
                    title: Text(state.users[index].title),
                    subtitle: Text(bodyText),
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 0, 167, 250),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailPage(user: state.users[index]),
                        ),
                      );
                    },
                  );
                },
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<UserListCubit>().fetchUser();
                    },
                    child: const Icon(Icons.refresh),
                  ),
                  SizedBox(height: 16.0), // Menambahkan jarak antara tombol
                  FloatingActionButton(
                    onPressed: () {
                      // Tambahkan fungsi untuk menghapus semua data di sini
                      debugPrint("Delete all pressed");
                    },
                    child: const Icon(Icons.delete_forever),
                  ),
                ],
              ),
            );
          }

          if (state is UserListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserListError) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<UserListCubit>().fetchUser();
              },
              child: const Text("Refresh"),
            ),
          );
        },
      ),
    );
  }
}









// part of "user_list_page.dart";
// class UserListView extends StatelessWidget {
//   const UserListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<UserListCubit, UserListState>(
//         builder: (context, state) {
//           if (state is UserListSuccess) {
//             final filteredUsers = state.users
//                 .where(
//                     (user) => user.title.length >= 40 && user.title.length <= 55)
//                 .toList();

//             return Scaffold(
//               body: ListView.builder(
//                 itemCount: state.users.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       radius: 20,
//                       child: Text(
//                         state.users[index].title.substring(0, 1).toUpperCase(),
//                       ),
//                     ),
//                     title: Text(filteredUsers[index].title),
//                     subtitle: Text(filteredUsers[index].body),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) =>
//                               UserDetailPage(user: state.users[index]),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//               floatingActionButton: FloatingActionButton(
//                 child: const Icon(Icons.refresh),
//                 onPressed: () => context.read<UserListCubit>().fetchUser(),
//               ),
//             );
//           } else if (state is UserListError) {
//             // Error
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(state.errorMessage),
//                   ElevatedButton(
//                     child: const Text("Refresh"),
//                     onPressed: () => context.read<UserListCubit>().fetchUser(),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is UserListLoading) {
//             // Loading
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             // Initial / First time
//             return Center(
//               child: ElevatedButton(
//                 child: const Text("Refresh"),
//                 onPressed: () => context.read<UserListCubit>().fetchUser(),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
