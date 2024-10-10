part of 'appointments_bloc.dart';

@immutable
class AppointmentsState {
  final List<Appointment> appointmentList;
  final Appointment? appointment;

  const AppointmentsState({
    required this.appointmentList,
    required this.appointment,
  });

  AppointmentsState copyWith({
    required List<Appointment> appointmentList,
    Appointment? appointment,
  }) {
    return AppointmentsState(
      appointmentList: appointmentList,
      appointment: appointment ?? appointment,
    );
  }
}

class AppointmentsInitial extends AppointmentsState {
  const AppointmentsInitial({
    required super.appointmentList,
    super.appointment,
  });
}
