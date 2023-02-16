import 'package:flutter/material.dart';
import 'package:flutter_app/screens/summary.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController patient_nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController dosController = TextEditingController();
  TextEditingController billController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add medical bill'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: patient_nameController,
              decoration: InputDecoration(
                hintText: 'Patient name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(hintText: 'Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: hospitalController,
              decoration: InputDecoration(hintText: 'Hospital name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dosController,
              decoration: InputDecoration(hintText: 'Date of service'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: billController,
              decoration: InputDecoration(hintText: 'Bill amount'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final patient_name = patient_nameController.text;
                  final address = addressController.text;
                  final hospital = hospitalController.text;
                  final dos = dosController.text;
                  final bill = billController.text;
                  final enteredData = {
                    'patient_name': patient_name,
                    'address': address,
                    'hospital': hospital,
                    'dos': dos,
                    'bill': bill
                  };
                  // Navigate to the summary page with entered data
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SummaryPage(data: enteredData),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
