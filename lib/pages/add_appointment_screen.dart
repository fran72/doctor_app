import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:app_doctor/bloc/appointments/appointments_bloc.dart';
import 'package:app_doctor/models/appointment.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  String selectedDate = '';
  bool isDateSelected = false;

  final commentsController = TextEditingController();
  final specialityController =
      TextEditingController(text: 'Select a speciality...');
  final formKey = GlobalKey<FormState>();

  void showDateTime() async {
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
    );

    selectedDate = BoardDateFormat('yyyy/MM/dd HH:mm').format(result!);
    isDateSelected = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<AppointmentsBloc, AppointmentsState>(
        builder: (context, state) {
      return Material(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          mainAxisSize: MainAxisSize.max,
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
                        const Text('CREATE A NEW APPOINTMENT'),
                        const SizedBox(height: 40),
                        DropdownMenu(
                            controller: specialityController,
                            width: double.infinity,
                            dropdownMenuEntries: const <DropdownMenuEntry<
                                String>>[
                              DropdownMenuEntry(
                                  value: 'Surgery', label: 'Surgery'),
                              DropdownMenuEntry(
                                  value: 'Pediatrics', label: 'Pediatrics'),
                              DropdownMenuEntry(
                                  value: 'Traumatology', label: 'Traumatology'),
                            ]),
                        const SizedBox(height: 20),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          minWidth: double.infinity,
                          height: 55,
                          onPressed: () => showDateTime(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.date_range),
                              const SizedBox(width: 10),
                              (selectedDate != '')
                                  ? Text(selectedDate)
                                  : const Text(
                                      'Select a date',
                                      style: TextStyle(fontSize: 16),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          minLines: 5,
                          maxLines: 55,
                          decoration: const InputDecoration(
                            hintText: 'Comments',
                            border: OutlineInputBorder(),
                          ),
                          controller: commentsController,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: double.infinity,
                      height: 50,
                      color: const Color.fromARGB(255, 54, 120, 244),
                      onPressed: () async {
                        final newAppointment = Appointment(
                          id: state.appointmentList.length,
                          date: selectedDate,
                          doctorId: 0,
                          speciality: specialityController.text,
                          comments: commentsController.text,
                        );

                        // IMPORTANT: Only if you want to sned data to BBDD.....
                        // final response = await http.post(
                        //   Uri.https('example.com', 'addAppointment'),
                        //   headers: {"content-type": "application/json"},
                        //   body: appointment.toRawJson(),
                        // );

                        // final body = json.decode(response.body);

                        // final appointmentToAdd = Appointment(
                        //   id: body["data"]["id"],
                        //   date: body["data"]["date"],
                        //   doctorId: body["data"]["doctorId"],
                        //   speciality: body["data"]["speciality"],
                        //   comments: body["data"]["comments"],
                        // );

                        appointmentsBloc.add(
                            OnAddAppointmentEvent(appointment: newAppointment));

                        Navigator.pop(context, 'home');
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
