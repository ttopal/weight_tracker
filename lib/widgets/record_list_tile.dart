import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordListTile extends StatelessWidget {
  const RecordListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: ListTile(
          //leading: Text(DateTime.now().toIso8601String()),
          leading: Text(
            DateFormat('EEE, MMM d').format(DateTime.now()),
          ),
          title: Center(
            child: Text(
              '75',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.edit, color: Colors.grey)),
              IconButton(onPressed: null, icon: Icon(Icons.delete, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
