import 'package:cubit_example/cubit/app_cubit.dart';
import 'package:cubit_example/pages/detail_page.dart';
import 'package:cubit_example/pages/main_page.dart';
import 'package:cubit_example/pages/welcome_page.dart';
import 'package:cubit_example/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocProvider<AppCubit>(
          create: (context) => AppCubit(dataServices: DataServices()),
          child: BlocBuilder<AppCubit, AppState>(builder: (context,state) {
            if(state is AppWelcome) {
              return const WelcomePage();
            }else if(state is AppLoading) {
              return const Center(child: CircularProgressIndicator(),);
            } else if(state is AppLoaded) {
              return const MainPage();
            } else if(state is AppDetail) {
              return const DetailPage();
            } else {
              return const SizedBox();
            }
          },),
        ),
      ),
    );
  }
}
