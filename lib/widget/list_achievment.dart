import 'package:flutter/material.dart';
import 'package:projek_aplikasi/service/service_achievment.dart';
import '../models/model_achievment.dart';

class AchievementList extends StatelessWidget {
  final List<ModelAchievment> achievementList;
  final ServiceAchievment _achievementService = ServiceAchievment();

  AchievementList({required this.achievementList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: achievementList.length,
      itemBuilder: (context, index) {
        final achievment = achievementList[index];
        return ListTile(
          title: Text(achievment.activity),
          subtitle: Text(
              'Duration: ${achievment.duration} minutes\nCalories: ${achievment.calories}\nTimestamp: ${achievment.timestamp}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await _achievementService.deleteAchievment(achievment.id);
            },
          ),
        );
      },
    );
  }
}
