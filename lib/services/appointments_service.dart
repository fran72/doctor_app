import 'package:flutter/material.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import '../models/appointment.dart';

// IMPORTANT: Only to retrieve data from bbdd, etc...
// import 'package:http/http.dart' as http;

class AppointmentsService extends ChangeNotifier {
  // IMPORTANT: Only to retrieve data from bbdd, etc...
  // final String _baseUrl = 'example.com';

  final List<Appointment> appointments = [
    Appointment(
      id: 0,
      doctorId: 0,
      speciality: 'Surgery',
      comments: 'First task',
      date: BoardDateFormat('yyyy/MM/dd HH:mm').format(DateTime.now()),
    ),
    Appointment(
      id: 1,
      doctorId: 0,
      speciality: 'Homeopathy',
      comments: 'Second task',
      date: BoardDateFormat('yyyy/MM/dd HH:mm').format(DateTime.now()),
    )
  ];

  AppointmentsService();

  Future<List<Appointment>> loadAppointments() async {
    // IMPORTANT: Only to retrieve data from bbdd, etc...

    // final url = Uri.https(_baseUrl, '/appointments', {'idUser': idUser});
    // final response = await http.get(url);
    // final appointmentsMap = json.decode(response.body);
    // final List<Appointment> appointments = [];

    // for (var appointment in appointmentsMap) {
    //   final tempAppointment = Appointment.fromJson(appointment);
    //   appointments.add(tempAppointment);
    // }

    // IMPORTANT: Dummy data
    return appointments;
  }

  loadAppointmentById(int id) {
    final Appointment appointment =
        appointments.firstWhere((appointment) => appointment.id == id);
    return appointment;
  }
}
