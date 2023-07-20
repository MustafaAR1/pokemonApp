import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/authentication_cubit.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/login_view.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/signup_view.dart';

import 'authentication_state.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  // final AuthenticationCubit _authenticationCubit =
  //     AuthenticationCubit(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupView(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 16.0),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 16.0),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        )

        // BlocConsumer<AuthenticationCubit, AuthenticationState>(
        //   bloc: _authenticationCubit,
        // listener: (context, state) {

        //   // TODO: implement listener
        //   if (state is AuthenticationSuccess) {
        //   } else if (state is AuthenticationFailure) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text(state.errorMessage)),
        //     );
        //   }
        // },
        //   builder: (context, state) {
        //     return Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             ElevatedButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) => LoginView(),
        //                     ));
        //               },
        //               style: ElevatedButton.styleFrom(
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 40.0, vertical: 16.0),
        //               ),
        //               child: const Text(
        //                 'Sign Up',
        //                 style: TextStyle(fontSize: 18.0),
        //               ),
        //             ),
        //             const SizedBox(height: 16.0),
        //             ElevatedButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) => SignupView(),
        //                     ));
        //               },
        //               style: ElevatedButton.styleFrom(
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 40.0, vertical: 16.0),
        //               ),
        //               child: const Text(
        //                 'Login',
        //                 style: TextStyle(fontSize: 18.0),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
