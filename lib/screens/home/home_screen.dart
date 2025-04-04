import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:
            const Text('Logros', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink[300],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAchievementCard(
                'Medallas', '3/50', Icons.emoji_events, Colors.pink[100]!),
            _buildAchievementCard(
                'Plantas', '5/10', Icons.local_florist, Colors.green[100]!),
            _buildAchievementCard(
                'Criaturas', '2/10', Icons.pets, Colors.orange[100]!),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(
      String title, String progress, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(progress, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54),
        onTap: () {},
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AchievementsScreen(),
  ));
}
