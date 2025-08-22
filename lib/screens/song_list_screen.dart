import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../widgets/background_scaffold.dart'; // 👈 importa el fondo

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  final List<Song> songs = [
    Song(
      title: 'KETU TeCRE',
      artist: 'Bad Bunny',
      path: 'assets/songs/08 Bad Bunny - KETU TeCRE.mp3',
    ),
    Song(
      title: 'Museo',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/01-Rauw-Alejandro-Museo .mp3',
    ),
    Song(
      title: 'La Inocente',
      artist: 'Mora, Feid',
      path: 'assets/songs/Mora Ft. Feid - La Inocente.mp3',
    ),
    Song(
      title: 'Luna',
      artist: 'Feid, ATL Jacob',
      path: 'assets/songs/Feid ft ATL Jacob - Luna.mp3',
    ),
    Song(
      title: 'Memorias',
      artist: 'Mora, Jhay Cortez',
      path: 'assets/songs/Mora Ft. Jhay Cortez - Memorias.mp3',
    ),
    Song(
      title: 'Die for You',
      artist: 'The Weeknd',
      path: 'assets/songs/Die For You(MP3_160K).mp3',
    ),
    Song(
      title: 'Mil Vidas',
      artist: 'Mora, Ryan Castro',
      path: 'assets/songs/Mora ft Ryan Castro - Mil Vidas.mp3',
    ),
    Song(
      title: 'Amar De Nuevo',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/Rauw Alejandro - Amar De Nuevo.mp3',
    ),
    Song(
      title: 'Dejame Entrar',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/Rauw Alejandro - Déjame Entrar.mp3',
    ),
    Song(
      title: 'Ni Me Conozco',
      artist: 'Rauw Alejandro',
      path:
          'assets/songs/Rauw Alejandro - Ni Me Conozco (WWW.ELGENEROPLUS.COM).mp3',
    ),
    Song(
      title: 'Detras De Tu Alma',
      artist: 'Mora',
      path: 'assets/songs/Mora - Detrás De Tu Alma.mp3',
    ),
    Song(
      title: 'KHE',
      artist: 'Rauw Alejandro, Romeo Santos',
      path: 'assets/songs/raw_alejandro_romeo_santos_khe__mp3_14498.mp3',
    ),
    Song(
      title: 'Que Pasaria',
      artist: 'Rauw Alejandro, Bad Bunny',
      path: 'assets/songs/Rauw Alejandro y Bad Bunny - Que Pasaria.mp3',
    ),
    Song(
      title: 'Otra Noche En Miami',
      artist: 'Bad Bunny',
      path: 'assets/songs/06-Otra Noche En Miami.mp3',
    ),
    Song(
      title: 'Ni Bien Ni Mal',
      artist: 'Bad Bunny',
      path: 'assets/songs/01-NIBIENNIMAL.mp3',
    ),
    Song(
      title: 'DtMF',
      artist: 'Bad Bunny',
      path: 'assets/songs/Bad-Bunny-DtMF-(HipHopKit.com).mp3',
    ),
     Song(
      title: 'Aquel Nap ZzZz',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/06-Aquel Nap ZzZz.mp3',
    ),
    Song(
      title: 'Al Mismo Tiempo',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/1. Rauw Alejandro - Al Mismo Tiempo.mp3',
    ),
    Song(
      title: 'Andrea',
      artist: 'Bad Bunny',
      path: 'assets/songs/19-Andrea (Ft. Buscabulla).mp3',
    ),
    Song(
      title: 'Un Coco',
      artist: 'Bad Bunny',
      path: 'assets/songs/18-Un Coco.mp3',
    ),
    Song(
      title: 'Dos Mil 16',
      artist: 'Bad Bunny',
      path: 'assets/songs/Bad Bunny - Dos Mil 16 (1).mp3',
    ),
    Song(
      title: 'Moscow Mule',
      artist: 'Bad Bunny',
      path: 'assets/songs/Bad Bunny - Moscow Mule.mp3',
    ),
    Song(
      title: 'Todo De Ti',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/01-Todo De Ti.mp3',
    ),
    Song(
      title: 'FERXXO 100',
      artist: 'Feid',
      path: 'assets/songs/Feid - Ferxxo 100 (Official Video)(MP3_160K).mp3',
    ),
    Song(
      title: 'Normal',
      artist: 'Feid',
      path: 'assets/songs/Feid - Normal (Official Video)(MP3_160K).mp3',
    ),
    Song(
      title: 'Neverita',
      artist: 'Bad Bunny',
      path: 'assets/songs/08-Neverita.mp3',
    ),
     Song(
      title: 'BOKeTE',
      artist: 'Bad bunny',
      path: 'assets/songs/BAD BUNNY - BOKeTE (Video Oficial) _ DeBÍ TiRAR MáS FOToS(MP3_160K) (1).mp3',
    ),
    Song(
      title: 'Baile Inolvidable',
      artist: 'Bad Bunny',
      path: 'assets/songs/BAD BUNNY - BAILE INoLVIDABLE (Video Oficial) _ DeBÍ TiRAR MáS FOToS(MP3_160K).mp3',
    ),
    Song(
      title: 'DROGA',
      artist: 'Mora, C.Tangana',
      path: 'assets/songs/Mora_ C. Tangana - DROGA (Visualizer) _ LO MISMO DE SIEMPRE(MP3_160K).mp3',
    ),
    Song(
      title: 'De Paquete',
      artist: 'Mora, Jory Boy',
      path: 'assets/songs/Mora_ Jory Boy - DE PAQUETE (Visualizer) _ LO MISMO DE SIEMPRE(MP3_160K).mp3',
    ),
    Song(
      title: 'Ponte Pa Mi',
      artist: 'Rauw Alejandro, Myke towers, SKy Rompiendo',
      path: 'assets/songs/Rauw Alejandro X Myke Towers X Sky Rompiendo - Ponte Pa_ Mí (Video Oficial)(MP3_160K).mp3',
    ),
    Song(
      title: 'TEMA DE JORY',
      artist: 'Mora',
      path: 'assets/songs/Mora - TEMA DE JORY (Visualizer) _ LO MISMO DE SIEMPRE(MP3_160K).mp3',
    ),
     Song(
      title: 'El Utimo Beso',
      artist: 'Mora, Sech',
      path: 'assets/songs/Mora ft Sech - El Ultimo Beso.mp3',
    ),
    Song(
      title: 'NUNCA TE PUDE ALCANZAR',
      artist: 'Gera Mx',
      path: 'assets/songs/Nunca Te Pude Alcanzar __ Gera MX ----(MP3_160K).mp3',
    ),
    Song(
      title: 'Playa Privada',
      artist: 'Mora, Elena Rose',
      path: 'assets/songs/Mora_ ELENA ROSE - PLAYA PRIVADA (Visualizer) _ MICRODOSIS(MP3_160K).mp3',
    ),
    Song(
      title: 'Tus Lagrimas',
      artist: 'Mora, Sech',
      path: 'assets/songs/Mora_ Sech - TUS LÁGRIMAS (Visualizer) _ MICRODOSIS(MP3_160K).mp3',
    ),
    Song(
      title: 'Rapido',
      artist: 'Mora',
      path: 'assets/songs/Mora - RÁPIDO (Video Oficial)(MP3_160K).mp3',
    ),
     Song(
      title: 'Yo lo Se',
      artist: 'Wisin y Yandel',
      path: 'assets/songs/Yo Lo Se(MP3_160K).mp3',
    ),
    Song(
      title: 'Solo Mia',
      artist: 'Yandel, Maluma',
      path: 'assets/songs/Nunca Te Pude Alcanzar __ Gera MX ----(MP3_160K).mp3',
    ),
    Song(
      title: 'Sexto Sentido',
      artist: 'Bad Bunny, Gigolo y la Exce',
      path: 'assets/songs/Bad Bunny x Gigolo _ La Exce - Sexto Sentido (Video Oficial)(MP3_160K).mp3',
    ),
    Song(
      title: 'COMO SE SIENTE (REMIX)',
      artist: 'Bad Bunny. Jhay Cortez',
      path: 'assets/songs/BAD BUNNY x JHAY CORTEZ - CÓMO SE SIENTE REMIX _ LAS QUE NO IBAN A SALIR (Audio Oficial)(MP3_160K).mp3',
    ),
    Song(
      title: 'Efecto',
      artist: 'Bad Bunny',
      path: 'assets/songs/Bad Bunny - Efecto (360° Visualizer) _ Un Verano Sin Ti(MP3_160K).mp3',
    ),
     Song(
      title: 'Haciendo Que Me Amas',
      artist: 'Bad Bunny',
      path: 'assets/songs/BAD BUNNY - HACIENDO QUE ME AMAS _ EL ÚLTIMO TOUR DEL MUNDO [Visualizer](MP3_160K).mp3',
    ),
    Song(
      title: 'COMO SE SIENTE (REMIX)',
      artist: 'Bad Bunny. Jhay Cortez',
      path: 'assets/songs/BAD BUNNY x JHAY CORTEZ - CÓMO SE SIENTE REMIX _ LAS QUE NO IBAN A SALIR (Audio Oficial)(MP3_160K).mp3',
    ),
    Song(
      title: 'Efecto',
      artist: 'Bad Bunny',
      path: 'assets/songs/Bad Bunny - Efecto (360° Visualizer) _ Un Verano Sin Ti(MP3_160K).mp3',
    ),
     Song(
      title: 'Haciendo Que Me Amas',
      artist: 'Bad Bunny',
      path: 'assets/songs/BAD BUNNY - HACIENDO QUE ME AMAS _ EL ÚLTIMO TOUR DEL MUNDO [Visualizer](MP3_160K).mp3',
    ),
 Song(
      title: 'RLNDT',
      artist: 'Bad bunny',
      path: 'assets/songs/BAD BUNNY - RLNDT _ X100PRE [Visualizer](MP3_160K) (1).mp3',
    ),
    Song(
      title: '  ALAMBRE PuA',
      artist: 'Bad Bunny',
      path: 'assets/songs/BAD BUNNY - ALAMBRE PúA(MP3_160K).mp3',
    ),
    Song(
      title: 'Turista',
      artist: 'Bad Bunny',
      path: 'assets/songs/BAD BUNNY - TURiSTA (Video Oficial) _ DeBÍ TiRAR MáS FOToS(MP3_160K).mp3',
    ),
     Song(
      title: 'Igual Que Un Angel',
      artist: 'Kali Uchis, Peso Pluma',
      path: 'assets/songs/Kali Uchis - Igual Que Un Ángel (ft. Peso Pluma) [Official Audio](MP3_160K).mp3',
    ),
 Song(
      title: 'Adivino',
      artist: 'Myke Towers, Bad Bunny',
      path: 'assets/songs/Myke Towers_ Bad Bunny - ADIVINO (Official Lyric Video)(MP3_160K).mp3',
    ),
    Song(
      title: 'Tu Con El',
      artist: 'Rauw Alejandro',
      path: 'assets/songs/Rauw Alejandro - Tú Con Él (Lyric Video)(MP3_160K).mp3',
    ),
     Song(
      title: 'Pensandote',
      artist: 'Rauw Alejandro, Tainy',
      path: 'assets/songs/Rauw Alejandro ft. Tainy _ Pensándote (Official Audio)(MP3_160K).mp3',
    ),
 Song(
      title: 'BIEN LOCO',
      artist: 'Wisin, Mora',
      path: 'assets/songs/Wisin_ Mora - BIEN LOCO (Official Video)(MP3_160K) (1).mp3',
    ),
    Song(
      title: 'SI TU SUPIERAS',
      artist: 'Feid',
      path: 'assets/songs/Feid - SI TÚ SUPIERAS (Official Video)(MP3_160K).mp3',
    ),
     Song(
      title: 'PPCP',
      artist: 'Feid, Sky Rompiendo',
      path: 'assets/songs/Feid_ Sky Rompiendo - PPCP (Audio)(MP3_160K).mp3',
    ),
 Song(
      title: 'CHORRITO PA LAS ANIMAS',
      artist: 'Feid',
      path: 'assets/songs/Feid - CHORRITO PA LAS ANIMAS (Official Video)(MP3_160K).mp3',
    ),
    Song(
      title: 'DEJAME HABLAR',
      artist: 'Wisin Y Yandel',
      path: 'assets/songs/Dejame Hablar(MP3_160K).mp3',
    ),
     Song(
      title: 'YO LO SE',
      artist: 'Wisin Y Yandel',
      path: 'assets/songs/Yo Lo Se(MP3_160K).mp3',
    ),
  ];

   final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Song? _currentSong;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isShuffling = false;
  bool _isRepeating = false;

  @override
  void initState() {
    super.initState();

    // Reproducción completada
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (_isRepeating) {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.play();
        } else {
          _playNextSong();
        }
      }
    });

    // Actualiza duración
    _audioPlayer.durationStream.listen((d) {
      setState(() => _duration = d ?? Duration.zero);
    });

    // Actualiza posición
    _audioPlayer.positionStream.listen((p) {
      setState(() => _position = p);
    });
  }

  void _playSong(Song song) async {
    try {
      await _audioPlayer.setAsset(song.path);
      _audioPlayer.play();
      setState(() {
        _isPlaying = true;
        _currentSong = song;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error al reproducir: $e")),
      );
    }
  }

  void _pauseSong() {
    _audioPlayer.pause();
    setState(() => _isPlaying = false);
  }

  void _playNextSong() {
    if (_currentSong == null) return;

    int currentIndex = songs.indexOf(_currentSong!);
    int nextIndex;

    if (_isShuffling) {
      nextIndex = (songs..shuffle()).indexOf(_currentSong!);
    } else {
      nextIndex = (currentIndex + 1) % songs.length;
    }

    _playSong(songs[nextIndex]);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const Text("🎶 Mi Playlist"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Column(
        children: [
          // Lista de canciones
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Icon(Icons.music_note, color: Colors.deepPurple.shade700),
                    ),
                    title: Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis),
                    subtitle: Text(song.artist, style: TextStyle(color: Colors.grey.shade700)),
                    trailing: Icon(
                      (_currentSong == song && _isPlaying) ? Icons.pause_circle_filled : Icons.play_circle_fill,
                      color: Colors.deepPurple,
                      size: 34,
                    ),
                    onTap: () => (_isPlaying && _currentSong == song) ? _pauseSong() : _playSong(song),
                  ),
                );
              },
            ),
          ),

          // Mini player
          if (_currentSong != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent.shade100, Colors.deepPurple.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(0.25), offset: const Offset(0, -3))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Info canción
                  Row(
                    children: [
                      CircleAvatar(radius: 25, backgroundColor: Colors.white, child: const Icon(Icons.music_note, color: Colors.deepPurple)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_currentSong!.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white), overflow: TextOverflow.ellipsis),
                            Text(_currentSong!.artist, style: const TextStyle(color: Colors.white70), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill, color: Colors.white, size: 40),
                        onPressed: () => _isPlaying ? _pauseSong() : _playSong(_currentSong!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Barra de progreso
                  Row(
                    children: [
                      Text(_formatDuration(_position), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(trackHeight: 3, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7)),
                          child: Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white30,
                            min: 0,
                            max: _duration.inSeconds.toDouble(),
                            value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
                            onChanged: (value) => _audioPlayer.seek(Duration(seconds: value.toInt())),
                          ),
                        ),
                      ),
                      Text(_formatDuration(_duration), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),

                  // Controles shuffle / repeat / forward / back
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.shuffle, color: _isShuffling ? Colors.deepPurpleAccent : Colors.white70),
                        onPressed: () => setState(() => _isShuffling = !_isShuffling),
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay_10, color: Colors.white),
                        onPressed: () => _audioPlayer.seek(_position - const Duration(seconds: 10)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10, color: Colors.white),
                        onPressed: () => _audioPlayer.seek(_position + const Duration(seconds: 10)),
                      ),
                      IconButton(
                        icon: Icon(Icons.repeat, color: _isRepeating ? Colors.deepPurpleAccent : Colors.white70),
                        onPressed: () => setState(() => _isRepeating = !_isRepeating),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

class Song {
  final String title;
  final String artist;
  final String path;
  Song({required this.title, required this.artist, required this.path});
}