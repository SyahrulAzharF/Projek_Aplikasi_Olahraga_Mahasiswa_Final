import 'package:flutter/material.dart';
import 'package:projek_aplikasi/service/catatan_olahraga_service.dart';
import '../models/catatan_olahraga.dart';

class EditCatatanPage extends StatelessWidget {
  final CatatanOlahraga catatan;
  final TextEditingController _durationController;
  final TextEditingController _activityController;
  final CatatanOlahragaService _catatanService = CatatanOlahragaService();

  EditCatatanPage({required this.catatan})
      : _durationController = TextEditingController(text: catatan.duration),
        _activityController = TextEditingController(text: catatan.activity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Catatan Olahraga'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration (minutes)'),
            ),
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Activity'),
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                final updatedCatatan = CatatanOlahraga(
                  id: catatan.id,
                  duration: _durationController.text,
                  activity: _activityController.text,
                  timestamp: catatan.timestamp,
                );
                await _catatanService.updateCatatan(updatedCatatan);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
