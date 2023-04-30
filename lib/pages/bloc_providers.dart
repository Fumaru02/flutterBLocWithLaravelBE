import 'package:bloc_flutter/pages/register/bloc/register_blocs.dart';
import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(
          //lazt: false <- membuat loading lebih cepat atau bersamaan dengan bloc pertama
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBlocs())
      ];
}
