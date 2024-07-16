import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/catatan_olahraga.dart';

class AchievementService {
  final CollectionReference _catatanCollection =
      FirebaseFirestore.instance.collection('catatan_olahraga');

  Future<void> addCatatan(AchievementOlahraga catatan) {
    return _catatanCollection.add(catatan.toMap());
  }

  Future<void> updateCatatan(AchievementOlahraga catatan) {
    return _catatanCollection.doc(catatan.id).update(catatan.toMap());
  }

  Future<void> deleteCatatan(String id) {
    return _catatanCollection.doc(id).delete();
  }

  Stream<List<AchievementOlahraga>> getCatatan() {
    return _catatanCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AchievementOlahraga.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  deleteAchievment(String id) {}
}
