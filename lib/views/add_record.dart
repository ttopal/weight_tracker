import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();

  void pickDate(BuildContext context) async {
    var initialDate = DateTime.now();
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate.subtract(Duration(days: 365)),
      lastDate: initialDate.add(Duration(days: 30)),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(),
        child: child ?? Text(''),);
      },
    ) ??
        _selectedDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Record'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.weightScale, size: 40),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      NumberPicker(
                        itemCount: 3,
                        step: 1,
                        itemWidth: 80,
                        itemHeight: 50,
                        axis: Axis.horizontal,
                        minValue: 30,
                        maxValue: 130,
                        value: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      Icon(FontAwesomeIcons.chevronUp, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Icon(
                    FontAwesomeIcons.calendar,
                    size: 40,
                  ),
                  Expanded(
                    child: Text(
                      DateFormat('EEE, MMM d').format(_selectedDate),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Save Record'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
