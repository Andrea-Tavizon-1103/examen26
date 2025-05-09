import 'package:flutter/material.dart';
import 'pag_uno.dart'; // Asegúrate de que este archivo contenga BookDetailPage

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Harry Potter and...',
      'author': 'J.K. Rowling',
      'image': 'https://covers.openlibrary.org/b/id/8225631-L.jpg'
    },
    {
      'title': 'Harry Potter and...',
      'author': 'J.K. Rowling',
      'image': 'https://covers.openlibrary.org/b/id/8231852-L.jpg'
    },
    {
      'title': 'Harry Potter and...',
      'author': 'J.K. Rowling',
      'image': 'https://covers.openlibrary.org/b/id/8231990-L.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search book here...',
                        hintStyle: TextStyle(color: Colors.white60),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.wb_sunny, color: Colors.white, size: 30),
                ],
              ),
              SizedBox(height: 20),

              // Banner
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookDetailPage()),
                  );
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1512820790803-83ca734da794',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Book\n30+ new books coming with thrill\ngames are waiting for you',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Recommended Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended for you',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('See more',
                      style: TextStyle(color: Colors.orangeAccent)),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              book['image']!,
                              height: 140,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              Text(' 4.9',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Text(book['title']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(book['author']!,
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Trending Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending Book',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('See more',
                      style: TextStyle(color: Colors.orangeAccent)),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: books.map((book) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(book['image']!,
                          width: 50, height: 70, fit: BoxFit.cover),
                    ),
                    title: Text(book['title']!,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book['author']!,
                            style: TextStyle(color: Colors.white70)),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            Text(' (107.3k)',
                                style: TextStyle(color: Colors.white70)),
                            SizedBox(width: 10),
                            Icon(Icons.visibility,
                                size: 14, color: Colors.white70),
                            Text(' 2.7M Read',
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.bookmark_border, color: Colors.white),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
