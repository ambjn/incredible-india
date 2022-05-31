import 'package:flutter/material.dart';
import 'package:incredible_india/data/photos_data.dart';
import 'package:incredible_india/model/photos_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> photoList = <PhotoModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    Photo photo = Photo();
    await photo.getPhotos();
    photoList = photo.photos;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "incredible",
              style: TextStyle(
                  color: Colors.orange.shade900, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "india",
              style: TextStyle(
                  color: Colors.green.shade900, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
