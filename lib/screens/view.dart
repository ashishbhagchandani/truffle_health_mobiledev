import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final Map<String, String> data;
  const ViewPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical bill record for ${data['patient_name']}')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient name: ${data['patient_name']}'),
            SizedBox(height: 20),
            Text('Address: ${data['address']}'),
            SizedBox(height: 20),
            Text('Hospital: ${data['hospital']}'),
            SizedBox(height: 20),
            Text('Date of service: ${data['dos']}'),
            SizedBox(height: 20),
            Text('Bill amount: ${data['bill']}'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
