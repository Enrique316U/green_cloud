import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_cloud/screens/home/home_screen.dart';
import 'package:green_cloud/screens/favorites_screen.dart';
import 'package:green_cloud/screens/setting/profile_screen.dart';
import 'package:green_cloud/screens/search_screen.dart';
import 'package:green_cloud/data/plants_data.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "/bottom_nav_bar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(
      iconPath: 'lib/assets/icons/flag.svg',
      selectedColor: Colors.green,
    ),
    NavItem(
      iconPath: 'lib/assets/icons/tent.svg',
      selectedColor: Colors.green,
    ),
    NavItem(
      iconPath: 'lib/assets/icons/flower.svg',
      selectedColor: Colors.green,
    ),
    NavItem(
      iconPath: 'lib/assets/icons/plant_stack.svg',
      selectedColor: Colors.green,
    ),
    NavItem(
      iconPath: 'lib/assets/icons/user.svg',
      selectedColor: Colors.green,
    ),
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(plant: plants[0]),
    const SearchScreen(),
    const FavoritesScreen(),
    const Scaffold(
        body: Center(child: Text('Plant Stack Screen'))), // Nueva pantalla
    const ProfileScreen(), // Perfil ahora en índice 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        height: 85, // Aumenté ligeramente la altura para mejor visualización
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 246, 242, 229), // Color de fondo cambiado a verde
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ), // Esquinas superiores redondeadas
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          // Para evitar que los hijos sobresalgan del borde redondeado
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navItems.length,
              (index) => IconButton(
                icon: CustomSvgIcon(
                  iconPath: _navItems[index].iconPath,
                  isSelected: _selectedIndex == index,
                  color: _selectedIndex == index
                      ? Colors.green // Color cuando está seleccionado
                      : Colors.white.withOpacity(
                          0.6), // Color cuando no está seleccionado
                ),
                onPressed: () => _onItemTapped(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final String iconPath;
  final Color selectedColor;

  NavItem({
    required this.iconPath,
    this.selectedColor = Colors.grey,
  });
}

class CustomSvgIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final Color color;

  const CustomSvgIcon({
    super.key,
    required this.iconPath,
    this.isSelected = false,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: 60,
      height: 60,
      colorFilter: ColorFilter.mode(
        isSelected ? color : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
