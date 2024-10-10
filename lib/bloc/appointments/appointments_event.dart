part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsEvent {}

class OnGetAllAppointmentsEvent extends AppointmentsEvent {}

class OnAddAppointmentEvent extends AppointmentsEvent {
  final Appointment appointment;
  OnAddAppointmentEvent({required this.appointment});
}
