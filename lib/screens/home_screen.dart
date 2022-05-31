import 'package:flutter/material.dart';
import 'package:incredible_india/data/photos_data.dart';
import 'package:incredible_india/model/photos_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

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
                    color: Colors.amber.shade900, fontWeight: FontWeight.bold),
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
        body: _loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.teal.shade700))
            : Container(
                padding: const EdgeInsets.all(10.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        photoList[index].webformatURL,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  staggeredTileBuilder: (int i) =>
                      StaggeredTile.count(2, i.isEven ? 2 : 3),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
              ));
  }
}
