import 'package:flutter/material.dart';
import 'package:flutter_app/screens/data.dart';
import 'package:flutter_app/screens/list.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, String> data;
  const SummaryPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Add entered data to myJsonList and go back to the list page
                    myJsonList.add(data);
                    await saveList();
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => ListPage()), (Route route) => false);
                  },
                  child: Text('Confirm'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Go back to the previous page
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
