import 'package:flutter/material.dart';
import 'package:projek_aplikasi/models/model_achievment.dart';
import 'package:projek_aplikasi/service/service_achievment.dart';

class MelacakMencatatPage extends StatefulWidget {
  const MelacakMencatatPage({Key? key}) : super(key: key);

  @override
  _MelacakMencatatPageState createState() => _MelacakMencatatPageState();
}

class _MelacakMencatatPageState extends State<MelacakMencatatPage> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  String dropdownValueActivity = 'Running';
  final ServiceAchievment _achievmentService = ServiceAchievment();

  final List<String> sports = [
    'Running',
    'Swimming',
    'Cycling',
    'Basketball',
    'Football',
    'Tennis',
    'Yoga',
    'Pilates',
    'Boxing',
    'Dance',
    'Gymnastics',
    'Hiking',
    'Rock Climbing'
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track and Record Achievements',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 214, 138, 5),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  'aset_media/gambar/pencapaian.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: durationController,
                      decoration: InputDecoration(
                        labelText: 'Duration (minutes)',
                        prefixIcon: Icon(Icons.timer, color: Colors.blueAccent),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: caloriesController,
                      decoration: InputDecoration(
                        labelText: 'Calories Burned',
                        prefixIcon: Icon(Icons.local_fire_department,
                            color: Colors.redAccent),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: theme.canvasColor,
                      ),
                      value: dropdownValueActivity,
                      icon: const Icon(Icons.arrow_downward),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueActivity = newValue!;
                        });
                      },
                      items:
                          sports.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime now = DateTime.now();

                    final achievment = ModelAchievment(
                      id: '',
                      duration: durationController.text,
                      calories: caloriesController.text,
                      activity: dropdownValueActivity,
                      timestamp: now,
                    );
                    await _achievmentService.addAchievment(achievment);
                    // Navigator.of(context).pop(); // <-- Hapus ini jika ingin tetap di halaman ini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: 5,
                  ),
                  child: const Text('Save Achievement',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                StreamBuilder<List<ModelAchievment>>(
                  stream: _achievmentService.getAchievment(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final achievementList = snapshot.data!;
                      return AchievementList(achievementList: achievementList);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementList extends StatelessWidget {
  final List<ModelAchievment> achievementList;
  final ServiceAchievment _achievementService = ServiceAchievment();

  AchievementList({required this.achievementList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: achievementList.length,
      itemBuilder: (context, index) {
        final achievment = achievementList[index];
        return Card(
          elevation: 4.0,
          child: ListTile(
            title: Text(achievment.activity),
            subtitle: Text(
              'Duration: ${achievment.duration} minutes\nCalories: ${achievment.calories}\nTimestamp: ${achievment.timestamp}',
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _achievementService.deleteAchievment(achievment.id);
              },
            ),
          ),
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(home: MelacakMencatatPage()));
