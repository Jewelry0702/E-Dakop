import 'package:flutter/material.dart';

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
  // Definitions for the items and itemChecked
  final List<String> items = [
    "No helmet",
    "illegal parking",
    "no license",
    "24erwuegtfweugeetfefaeww"
  ];

  late Map<String, bool> itemChecked;

  bool valuefirst = false;
  bool valuesecond = false;

  // Controllers for each TextField
  final _dateController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _dlPermitNoController = TextEditingController();
  final _plateNoController = TextEditingController();
  final _crNoController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _placeOfViolationController = TextEditingController();
  final _ownerController = TextEditingController();
  final _ownerAddressController = TextEditingController();
  final _officerNameController = TextEditingController();
  final _designationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    itemChecked = Map.fromIterable(
      items,
      key: (item) => item,
      value: (item) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Citation Ticket'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // Date picker container
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
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Driver's Name:"),
          ),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(labelText: "Address:"),
          ),
          TextField(
            controller: _dlPermitNoController,
            decoration: InputDecoration(labelText: "DL/Permit #:"),
          ),
          TextField(
            controller: _plateNoController,
            decoration: InputDecoration(labelText: "Plate #:"),
          ),
          TextField(
            controller: _crNoController,
            decoration: InputDecoration(labelText: "CR #:"),
          ),
          TextField(
            controller: _makeController,
            decoration: InputDecoration(labelText: "Make:"),
          ),
          TextField(
            controller: _modelController,
            decoration: InputDecoration(labelText: "Model:"),
          ),
          TextField(
            controller: _placeOfViolationController,
            decoration: InputDecoration(labelText: "Place of Violation:"),
          ),
          TextField(
            controller: _ownerController,
            decoration: InputDecoration(labelText: "Owner:"),
          ),
          TextField(
            controller: _ownerAddressController,
            decoration: InputDecoration(labelText: "Owner Address:"),
          ),
          Center(
            child: PopupMenuButton<String>(
              onSelected: (selectedItem) {
                setState(() {
                  itemChecked[selectedItem] = !itemChecked[selectedItem]!;
                });
              },
              itemBuilder: (BuildContext context) {
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
          TextField(
            controller: _officerNameController,
            decoration: InputDecoration(labelText: "Officer Name:"),
          ),
          TextField(
            controller: _designationController,
            decoration: InputDecoration(labelText: "Designation:"),
          ),
          ElevatedButton(
            onPressed: _printFormData,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  // Function to retrieve and print the data
  void _printFormData() {
    print('Date: ${_dateController.text}');
    print('Driver\'s Name: ${_nameController.text}');
    print('Address: ${_addressController.text}');
    print('DL/Permit No: ${_dlPermitNoController.text}');
    print('Plate No: ${_plateNoController.text}');
    print('CR No: ${_crNoController.text}');
    print('Make: ${_makeController.text}');
    print('Model: ${_modelController.text}');
    print('Place of Violation: ${_placeOfViolationController.text}');
    print('Owner: ${_ownerController.text}');
    print('Owner Address: ${_ownerAddressController.text}');
    print(
        'Violations: ${itemChecked.keys.where((item) => itemChecked[item]!).join(", ")}');
    print('admitted: $valuefirst');
    print('Under protest: $valuesecond');
    print('Officer Name: ${_officerNameController.text}');
    print('Designation: ${_designationController.text}');
  }

  @override
  void dispose() {
    // Dispose the TextEditingControllers
    _dateController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _dlPermitNoController.dispose();
    _plateNoController.dispose();
    _crNoController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _placeOfViolationController.dispose();
    _ownerController.dispose();
    _ownerAddressController.dispose();
    _officerNameController.dispose();
    _designationController.dispose();
    super.dispose();
  }
  // ... (Your exis
}
