import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_aplikasi/models/model_achievment.dart';

class ServiceAchievment {
  final CollectionReference _achievmentCollection =
      FirebaseFirestore.instance.collection('achievment');

  Future<void> addAchievment(ModelAchievment achievment) {
    return _achievmentCollection.add(achievment.toMap());
  }

  Future<void> updateAchievment(ModelAchievment achievment) {
    return _achievmentCollection.doc(achievment.id).update(achievment.toMap());
  }

  Future<void> deleteAchievment(String id) {
    return _achievmentCollection.doc(id).delete();
  }

  Stream<List<ModelAchievment>> getAchievment() {
    return _achievmentCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ModelAchievment.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
