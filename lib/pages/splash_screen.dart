// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_doctor/bloc/appointments/appointments_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goHome();
    super.initState();
  }

  _goHome() async {
    await Future.delayed(const Duration(seconds: 3));

    // IMPORTANT: Here you can evaluate if user is loged in SecureStorage or something like this...
    // If the user is not logged you can redirect to Login or Register...
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    appointmentsBloc.add(OnGetAllAppointmentsEvent());

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('./assets/images/doctor_splash.png')),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
