// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  int id;
  int doctorId;
  String speciality;
  String comments;
  String date;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.speciality,
    required this.comments,
    required this.date,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        doctorId: json["doctorId"],
        speciality: json["speciality"],
        comments: json["comments"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorId": doctorId,
        "speciality": speciality,
        "comments": comments,
        "date": date,
      };
}
