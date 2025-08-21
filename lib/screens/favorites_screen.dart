import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteSongs = [];
  List<String> favoriteArtists = [];

  final List<Map<String, String>> allSongs = [
    {"title": "KETU TeCRE", "image": "assets/img/debi-tirar-mas-fotos.jpg"},
    {"title": "Museo", "image": "assets/img/trap-cake-vol.2-a8e91cd2.jpg"},
    {"title": "Amar de Nuevo", "image": "assets/img/cosa-nuestra-342f0e18.jpg"},
    {"title": "Mil Vidas", "image": "assets/img/Lo-mismo-de-siempre.jpg"},
    {"title": "La Inocente", "image": "assets/img/Microdosis.jpg"},
    {"title": "FERXOO 100", "image": "assets/img/FERXO100.jpg"},
    {"title": "Dejame Entrar", "image": "assets/img/cosa-nuestra-342f0e18.jpg"},
    {"title": "Aquel Nap ZzZz", "image": "assets/img/Vicerversa.jpg"},
    {"title": "RLNDT", "image": "assets/img/X100pre.jpg"},
    {"title": "Otra Noche En Miami", "image": "assets/img/X100pre.jpg"},
  ];

  final List<Map<String, String>> allArtists = [
    {"name": "Bad Bunny", "image": "assets/img/Bad Bunny.jpg"},
    {"name": "Rauw Alejandro", "image": "assets/img/Rauw Alejandro.png"},
    {"name": "Mora", "image": "assets/img/Mora.png"},
    {"name": "Feid", "image": "assets/img/Feid.png"},
    {"name": "Wisin y Yandel", "image": "assets/img/Wisin Y Yandel.png"},
    {"name": "The Weeknd", "image": "assets/img/The Weeknd.png"},
    {"name": "Eminem", "image": "assets/img/Eminem.jpg"},
  ];

  void toggleFavoriteSong(String song) {
    setState(() {
      favoriteSongs.contains(song)
          ? favoriteSongs.remove(song)
          : favoriteSongs.add(song);
    });
  }

  void toggleFavoriteArtist(String artist) {
    setState(() {
      favoriteArtists.contains(artist)
          ? favoriteArtists.remove(artist)
          : favoriteArtists.add(artist);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("⭐ Favoritos"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "🎵 Canciones",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85, // tarjetas más altas
                ),
                itemCount: allSongs.length,
                itemBuilder: (context, index) {
                  final song = allSongs[index];
                  final isFav = favoriteSongs.contains(song["title"]);
                  return GestureDetector(
                    onTap: () => toggleFavoriteSong(song["title"]!),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple.shade400,
                            Colors.blue.shade400
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.asset(
                              song["image"]!,
                              width: double.infinity,
                              height: 140, // imagen grande
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            song["title"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isFav ? Colors.red : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "👩‍🎤 Artistas",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // más grande que antes
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: allArtists.length,
                itemBuilder: (context, index) {
                  final artist = allArtists[index];
                  final isFav = favoriteArtists.contains(artist["name"]);
                  return GestureDetector(
                    onTap: () => toggleFavoriteArtist(artist["name"]!),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isFav ? Colors.amber.shade700 : Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.asset(
                              artist["image"]!,
                              width: double.infinity,
                              height: 140, // imagen grande
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            artist["name"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
