import 'package:flutter/material.dart';
import '../../../../models/plant.dart';
import '../../../../widgets/sensor_data_row.dart';
import '../../../../widgets/tag_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import '../chat/chat_ai_screen.dart';

class HomeScreens extends StatefulWidget {
  static const String routeName = "/home";
  final Plant plant;
  const HomeScreens({super.key, required this.plant});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int hearts = 3; // Número de corazones disponibles

  void _showHeartsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const Text(
                  "CORAZONES",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 72, 175, 80),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.favorite,
                        color: index < hearts ? Colors.red : Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para ver más detalles
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "VER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para ver más detalles
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "VER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getProgressColor(String type, double value) {
    switch (type) {
      case 'temperature':
        if (value < 20) return Colors.blue;
        if (value < 35) return Colors.green;
        return Colors.red;
      case 'humidity':
      case 'soilMoisture':
        if (value < 30) return Colors.red;
        if (value < 70) return Colors.green;
        return Colors.blue;
      case 'lightLevel':
        if (value < 1000) return Colors.blue;
        if (value < 3000) return Colors.green;
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _buildProgressBar(
      String label, double value, double maxValue, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value / maxValue,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 10,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DatabaseReference _databaseRef =
        FirebaseDatabase.instance.ref("sensores/0001/real_time");

    return Scaffold(
      body: StreamBuilder<DatabaseEvent>(
        stream: _databaseRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData &&
              snapshot.data!.snapshot.value != null) {
            final data = Map<String, dynamic>.from(
              (snapshot.data!.snapshot.value as Map),
            );

            return Stack(
              children: [
                // Fondo con imagen de montañas
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/background/mountains.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Contenido principal
                SafeArea(
                  child: Column(
                    children: [
                      // Barra superior con iconos
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botón de chat
                            IconButton(
                              icon: const Icon(Icons.chat_bubble_outline),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ChatAIScreen(),
                                  ),
                                );
                              },
                              color: Colors.white,
                            ),
                            // Botón de corazones
                            IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: _showHeartsDialog,
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Planta en maceta
                      SizedBox(
                        height: size.height * 0.4,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Planta
                            Image.asset(
                              widget.plant.image,
                              height: size.height * 0.35,
                              fit: BoxFit.contain,
                            ),
                            // Maceta
                            Positioned(
                              bottom: 0,
                              child: Image.asset(
                                'lib/assets/images/plants/pot.png',
                                height: size.height * 0.15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Panel de información
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data['plantType'] ?? widget.plant.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildProgressBar(
                              "Luz",
                              data['lightLevel'] * 1.0,
                              4000.0,
                              Colors.yellow,
                            ),
                            _buildProgressBar(
                              "Temperatura",
                              data['temperature'] * 1.0,
                              50.0,
                              Colors.green,
                            ),
                            _buildProgressBar(
                              "Humedad",
                              data['humidity'] * 1.0,
                              100.0,
                              Colors.blue,
                            ),
                            _buildProgressBar(
                              "Humedad de la Tierra",
                              data['soilMoisture'] * 1.0,
                              100.0,
                              Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}
