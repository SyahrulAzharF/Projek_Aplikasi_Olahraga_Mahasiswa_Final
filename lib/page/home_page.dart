import 'package:flutter/material.dart';
import 'package:projek_aplikasi/service/auth_service.dart';
import 'package:projek_aplikasi/service/catatan_olahraga_service.dart';
import 'package:projek_aplikasi/widget/catatan_list.dart';
import '../models/catatan_olahraga.dart';
import 'login_page.dart';
import 'add_catatan_page.dart';
import 'edit_catatan_page.dart';


class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final CatatanOlahragaService _catatanService = CatatanOlahragaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Olahraga'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: StreamBuilder<List<CatatanOlahraga>>(
        stream: _catatanService.getCatatan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final catatanList = snapshot.data!;
            return CatatanList(catatanList: catatanList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCatatanPage()));
        },
      ),
    );
  }
}
