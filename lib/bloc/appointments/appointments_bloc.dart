import 'package:app_doctor/models/appointment.dart';
import 'package:app_doctor/services/appointments_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc() : super(const AppointmentsInitial(appointmentList: [])) {
    on<OnGetAllAppointmentsEvent>((event, emit) async {
      AppointmentsService appointmentService = AppointmentsService();
      List<Appointment> initialList =
          await appointmentService.loadAppointments()
            ..sort((a, b) => a.date.compareTo(b.date));
      return emit(state.copyWith(appointmentList: initialList));
    });

    on<OnAddAppointmentEvent>((event, emit) {
      try {
        var tempList = [...state.appointmentList, event.appointment]
          ..sort((a, b) => a.date.compareTo(b.date));
        return emit(state.copyWith(appointmentList: tempList));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
