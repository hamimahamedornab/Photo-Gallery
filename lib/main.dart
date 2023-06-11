import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',


      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                child: const Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for photos',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 12,
                children: [
                  photoButton(context, 'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest?cb=20150124180545', 'Naruto'),
                  photoButton(context, 'https://i.pinimg.com/736x/82/e4/69/82e469895400e96e1f8c5c0ea943fc37.jpg', 'Sasuke'),
                  photoButton(context, 'https://i.pinimg.com/originals/ed/31/d5/ed31d51ef22c81729adb6b8f15fdb864.jpg', 'Minato'),
                  photoButton(context, 'https://c4.wallpaperflare.com/wallpaper/526/752/981/naruto-shisui-uchiha-hd-wallpaper-preview.jpg', 'Shisui'),
                  photoButton(context, 'https://qph.cf2.quoracdn.net/main-qimg-cd31fafbb33c59de9aa9492cb66c89a2-lq', 'Kakashi'),
                  photoButton(context, 'https://qph.cf2.quoracdn.net/main-qimg-9e0b563f0aaffc82d2d9138141e99017-lq', 'Obito'),
                ],
              ),
              const SizedBox(height: 16.0),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://fictionhorizon.com/wp-content/uploads/2022/01/Naruto-Hokage.jpg'),
                    ),
                    title: Text('Hashirama'),
                    subtitle: Text('Hashirama Senju the First Hokage'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://staticg.sportskeeda.com/editor/2022/06/c0225-16563323160357.png?w=840'),
                    ),
                    title: Text('Tobirama'),
                    subtitle: Text('Tobirama Senju the Second Hokage'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://static.wikia.nocookie.net/naruto/images/a/af/Hiruzen_Sarutobi_Parte_I_Anime.png/revision/latest?cb=20160321031300&path-prefix=es'),
                    ),
                    title: Text('Hiruzen'),
                    subtitle: Text('Hiruzen Sarutobi the Third Hokage'),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content: Text('Photos Uploaded Successfully!'),duration: Duration(seconds: 5),),
            );
          },
          child: const Icon(Icons.cloud_upload),
        ),
      ),
    );
  }

  Widget photoButton(BuildContext context, String imageUrl, String caption) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Clicked on photo!')),
        );
      },
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(caption),
        ],
      ),
    );
  }
}
