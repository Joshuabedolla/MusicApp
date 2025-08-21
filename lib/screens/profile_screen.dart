import 'package:flutter/material.dart';
import 'package:musicapp/screens/song_list_screen.dart';
import 'package:musicapp/screens/weather_screen.dart';
import 'package:musicapp/screens/favorites_screen.dart';
import 'package:musicapp/screens/calendario.dart';
import 'package:musicapp/widgets/background_scaffold.dart';

// 🔹 Bio en varias líneas
const String profileBio = '''
🎶 Amante de la música y la programación 🎧  
💻 Desarrollador Flutter | Backend .NET | MongoDB  
🎨 Apasionado por el diseño moderno y minimalista  
🚀 Siempre aprendiendo y creando proyectos innovadores  
📍 Puebla, México
''';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1; // por defecto: Home

  final List<Widget> _screens = const [
    Center(
        child: Text("👤 Perfil",
            style: TextStyle(fontSize: 22, color: Colors.white))),
    ProfileCard(),
    SongListScreen(),
    FavoritesScreen(),
    CalendarioScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const ProfileAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        transitionBuilder: (child, animation) {
          final offsetAnim = Tween<Offset>(
            begin: const Offset(0.2, 0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: offsetAnim,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: ProfileBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class ProfileBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ProfileBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.account_box, 0, selectedIndex, onItemTapped),
            _buildNavItem(Icons.home, 1, selectedIndex, onItemTapped),
            _buildNavItem(Icons.music_note, 2, selectedIndex, onItemTapped),
            _buildNavItem(Icons.favorite, 3, selectedIndex, onItemTapped),
            _buildNavItem(Icons.calendar_today, 4, selectedIndex, onItemTapped),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, int index, int selectedIndex, Function(int) onTap) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: isSelected ? 1.3 : 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: isSelected ? 30 : 26,
            ),
          );
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  final String profileName = 'Joshua Zaquiel Morales Bedolla';
  final String cardProfilePhoto = 'assets/img/profile.jpg'; // 📌 ahora local

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        height: 520,
        width: 340,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.deepOrange.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // 🔥 Foto con glow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.6),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  cardProfilePhoto,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              profileName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            // 🔹 Aquí va la bio completa
            const Text(
              profileBio,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SongListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepOrange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 6,
              ),
              icon: const Icon(Icons.music_note),
              label: const Text(
                'Ver canciones',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      title: const Text(
        'Mi aplicación',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepOrange.withOpacity(0.9),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundImage: const AssetImage('assets/img/rem.jpg'),
          child: Align(
            alignment: const Alignment(1.2, 1),
            child: Icon(Icons.circle, color: Colors.green, size: 14),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cloud, size: 28),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WeatherScreen()),
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
