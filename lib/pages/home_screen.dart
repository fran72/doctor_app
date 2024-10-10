import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_doctor/bloc/appointments/appointments_bloc.dart';
import 'package:app_doctor/models/nav_params.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsBloc, AppointmentsState>(
      builder: (context, state) {
        final appointments = state.appointmentList;

        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            centerTitle: true,
            forceMaterialTransparency: true,
            title: const Text(
              'My doctor schedule',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lily',
                color: Colors.blueAccent,
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 12),
            child: (appointments.isNotEmpty)
                ? ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                'details',
                                arguments: NavParams(appointments[index].id),
                              );
                            },
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointments[index].speciality,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              appointments[index].date,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No appointments yet',
                      ),
                    ],
                  )),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.blue,
                  onPressed: () async {
                    Navigator.pushNamed(context, 'add');
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          ),
        );
      },
    );
  }
}
