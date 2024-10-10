import 'package:app_doctor/bloc/appointments/appointments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_doctor/services/appointments_service.dart';
import 'package:app_doctor/models/appointment.dart';
import 'package:app_doctor/models/nav_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: Here we could pass the full appointment as well
    final navigationParams =
        ModalRoute.of(context)!.settings.arguments as NavParams;

    final appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    final appointments = appointmentsBloc.state.appointmentList;

    final AppointmentsService appointmentService = AppointmentsService();
    final Appointment appointment = appointmentService.loadAppointmentById(
        appointments, navigationParams.idAppointment);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    iconSize: 32,
                    alignment: Alignment.centerLeft,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(appointment.speciality.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.date_range),
                const SizedBox(width: 10),
                Text(appointment.date.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Comments'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(appointment.comments.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
