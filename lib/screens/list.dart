import 'package:flutter/material.dart';
import 'package:flutter_app/screens/data.dart';
import 'package:flutter_app/screens/add_page.dart';
import 'package:flutter_app/screens/view.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    loadList().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical Bills')),
      body: myJsonList.isEmpty
          ? Center(
              child: Text('No items'),
            )
          : ListView.builder(
              itemCount: myJsonList.length,
              itemBuilder: (context, index) {
                final item = myJsonList[index];
                return ListTile(
                  title: Text('Patient name: ${item['patient_name']}'),
                  onTap:() {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewPage(
                    data: {'patient_name':item['patient_name'], 
                            'address':item['address'],
                            'hospital':item['hospital'],
                            'dos':item['dos'],
                            'bill':item['bill']})),
              );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add bill'),
      ),
    );
  }
  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddPage(),
    );
    Navigator.push(context, route);
  }
}