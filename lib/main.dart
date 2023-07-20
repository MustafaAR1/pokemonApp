import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/authentication_view.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/login_view.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/signup_view.dart';

import 'Screens/Authentication/authentication_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(FirebaseAuth.instance),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: AuthenticationView()),
    );

    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => AuthenticationCubit(_firebaseAuth),
    //       child: AuthenticationView(),
    //     ),
    //     BlocProvider(
    //       create: (context) => AuthenticationCubit(_firebaseAuth),
    //       child: LoginView(),
    //     ),
    //     BlocProvider(
    //       create: (context) => AuthenticationCubit(_firebaseAuth),
    //       child: SignupView(),
    //     ),
    //   ],
    //   child: Container(),
    // ));

    //  AuthenticationView());
  }
}
