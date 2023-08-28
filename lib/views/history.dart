import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_homescreen/view-models/controller.dart';
import 'package:getx_homescreen/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('History'),
        actions: [
          IconButton(
            onPressed: _controller.addRecord,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Obx(() => ListView(
              physics: BouncingScrollPhysics(),
              children: [
                // RecordListTile(),
                Text(_controller.records[0].note!),
                Text(_controller.records[1].note!),
                Text(_controller.records[2].note!),
                Text(_controller.records[3].note!),
                Text('Listede ${_controller.records.length} eleman var.'),
                Text('${_controller.records.last.note}'),
              ],
            )),
      ),
    );
  }
}
