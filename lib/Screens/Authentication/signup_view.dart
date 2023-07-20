import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokemon_app_sastaticket/Screens/Authentication/authentication_cubit.dart';
import 'package:pokemon_app_sastaticket/Screens/Home/home_view.dart';

import 'authentication_state.dart';

class SignupView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthenticationCubit _authenticationCubit =
      AuthenticationCubit(FirebaseAuth.instance);

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Form'),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthenticationSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonGrid(),
              ),
            );
          } else if (state is AuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text('Signup'),
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          print(_formKey.currentState!.value['email']);
                          _authenticationCubit.signUp(
                              _formKey.currentState!.value['email'],
                              _formKey.currentState!.value['password']);
                        } else {
                          print('Validation failed');
                        }
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
