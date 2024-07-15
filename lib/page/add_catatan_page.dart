import 'package:flutter/material.dart';
import 'package:projek_aplikasi/service/catatan_olahraga_service.dart';
import '../models/catatan_olahraga.dart';

class AddCatatanPage extends StatelessWidget {
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final CatatanOlahragaService _catatanService = CatatanOlahragaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan Olahraga'),
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
              child: Text('Simpan'),
              onPressed: () async {
                final catatan = CatatanOlahraga(
                  id: '',
                  duration: _durationController.text,
                  activity: _activityController.text,
                  timestamp: DateTime.now(),
                );
                await _catatanService.addCatatan(catatan);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
