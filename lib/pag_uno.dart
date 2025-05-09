import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BookDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1B26),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Imagen de portada
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/v.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Contenido
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Harry Potter and The\nPhilosopher\'s Stone',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'J.K. ROWLING',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text('4.9 (307K)',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(width: 12),
                          Icon(Icons.access_time,
                              color: Colors.white70, size: 18),
                          SizedBox(width: 4),
                          Text('6.7h Read',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          GenreChip(label: 'Action'),
                          GenreChip(label: 'Fantasy'),
                          GenreChip(label: 'Supernatural'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Harry Potter has been living a difficult life, regularly abused by his cold aunt and uncle, Vernon and...',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              child: Text('Add to Library'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6741FF),
                              ),
                              onPressed: () {},
                              child: Text('Read Now'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Botón de retroceso encima de la imagen
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BackButton(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String label;

  const GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white10,
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
