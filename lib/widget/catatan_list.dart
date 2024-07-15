import 'package:flutter/material.dart';
import 'package:projek_aplikasi/page/edit_catatan_page.dart';
import 'package:projek_aplikasi/service/catatan_olahraga_service.dart';
import '../models/catatan_olahraga.dart';

class CatatanList extends StatelessWidget {
  final List<CatatanOlahraga> catatanList;
  final CatatanOlahragaService _catatanService = CatatanOlahragaService();

  CatatanList({required this.catatanList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catatanList.length,
      itemBuilder: (context, index) {
        final catatan = catatanList[index];
        return ListTile(
          title: Text(catatan.activity),
          subtitle: Text(
              'Duration: ${catatan.duration} minutes\nTimestamp: ${catatan.timestamp}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await _catatanService.deleteCatatan(catatan.id);
            },
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditCatatanPage(catatan: catatan)));
          },
        );
      },
    );
  }
}
