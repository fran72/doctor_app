import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_doctor/pages/pages.dart';
import 'package:app_doctor/bloc/appointments/appointments_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppointmentsBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Doctor',
        theme: ThemeData(
          fontFamily: 'Open',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (BuildContext context) => const SplashScreen(),
          'home': (BuildContext context) => const HomeScreen(),
          'add': (BuildContext context) => const AddAppointmentScreen(),
          'details': (BuildContext context) => const DetailsScreen(),
        });
  }
}
