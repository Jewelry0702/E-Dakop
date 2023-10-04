import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';

void main() {
  runApp(TrafficTicketApp());
}

class TrafficTicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrafficTicketForm(),
    );
  }
}

class TrafficTicketForm extends StatefulWidget {
  @override
  _TrafficTicketFormState createState() => _TrafficTicketFormState();
}

class _TrafficTicketFormState extends State<TrafficTicketForm> {
  // Define variables to store user input
  String driverName = '';
  String address = '';
  String dlPermitNo = '';
  String plateNo = '';
  String crNo = '';
  String make = '';
  String model = '';
  String timeOfViolation = '';
  String placeOfViolation = '';
  String otherViolations = '';
  bool admitted = false;
  bool underProtest = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Traffic Citation Ticket'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Traffic Citation Ticket",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Date:",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: TextField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'MM/dd/yyyy',
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          var d = pickedDate;
                          String format = "${d!.month}/${d.day}/${d.year}";
                          _dateController.text = format;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      "Driver's Name: ",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Juan Dela Cruz',
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
                        onEditingComplete: () {
                          print(_nameController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
