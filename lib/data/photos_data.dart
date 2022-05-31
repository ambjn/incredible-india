import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incredible_india/model/photos_model.dart';
import 'package:incredible_india/info.dart';

class Photo {
  List<PhotoModel> photos = [];

  Future<void> getPhotos() async {
    var url = Uri.parse(
        'https://pixabay.com/api/?key=${API_KEY}&q=india&image_type=photo&pretty=true&per_page=100');

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // specifies everything is OK
      jsonData['hits'].forEach((element) {
        if (element['webformatURL'] != null) {
          PhotoModel photoModel =
              PhotoModel(webformatURL: element['webformatURL']);

          photos.add(photoModel);
        }
      });
    }
  }
}
