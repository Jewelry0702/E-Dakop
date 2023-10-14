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
  List<String> items = [
    "No helmet",
    "illegal parking",
    "no license",
    "pangit",
    "dfufg",
    "hffweurfh",
    "uewffuef",
    "euwfhfie",
    "ejdffhkjef",
    "jreogiu",
    "iefoeif",
    "ikfjeowif",
    "fahefhef",
    "fjeahiofeg",
    "fheriheroighadshgar"
  ];
  final Map<String, bool> itemChecked = {};

  bool valuefirst = false;
  bool valuesecond = false;

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
  void initState() {
    super.initState();
    for (var item in items) {
      itemChecked[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Traffic Citation Ticket'),
        ),
        body: ListView(children: [
          Column(
            children: [
              const Center(
                child: Text(
                  "\nRepublic of the philipines Office of City Mayor City Traffic Administrator City of Surigao Traffic Citation Ticket\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
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
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      "Address: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "DL/Permit #: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "plate #: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "CR #: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Make: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Model: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Place of violation: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Address: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Owner: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Owner Address: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: PopupMenuButton<String>(
                  onSelected: (
                    selectedItem,
                  ) {
                    setState(() {
                      itemChecked[selectedItem] = !itemChecked[selectedItem]!;
                    });
                  },
                  itemBuilder: (
                    BuildContext context,
                  ) {
                    return items.map((item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            Checkbox(
                              value: itemChecked[item],
                              onChanged: (bool? value) {
                                setState(() {
                                  itemChecked[item] = value!;
                                });
                              },
                            ),
                            Text(item),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Violations"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              Center(child: Text("\n")),
              Center(
                  child: Text(
                "I hereby promise to appear of the City Traffic Administrator's Office before the expiration of the TCT/TOP to answer the above sated charges and to settle the corresponding fines. It is understood that if I fail to settle my case within 72 hours from the date of apprehension. I will be summoned and subsequently a corresponding case be filed against me.\n",
                textAlign: TextAlign.center,
              )),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Admitted'),
                value: this.valuefirst,
                onChanged: (value) {
                  setState(() {
                    this.valuefirst = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('Under protest'),
                value: this.valuesecond,
                onChanged: (value) {
                  setState(() {
                    this.valuesecond = value!;
                  });
                },
              ),
              Center(child: Text("Driver's Signature: \n")),
              Center(child: Text("\n")),
              Divider(color: Colors.black),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      "Officer name: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
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
                      "Designation: ",
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Center(child: Text("Officer's Signature: \n")),
              Center(child: Text("\n")),
              Divider(color: Colors.black),
              Center(child: Text("\n ThankYou")),
            ],
          ),
        ]));
  }
}
