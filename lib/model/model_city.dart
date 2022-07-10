import 'package:cloud_firestore/cloud_firestore.dart';

class ModelCity{
  final String name;
  final String title;
  final String lat;
  final String long;
  final String image;
  final String duration;
  final String ticket;
  String distance;
  ModelCity(this.name,this.title,this.lat,this.long,this.image,this.duration,this.ticket,this.distance);

  ModelCity.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      :name = doc.data()!["name"],
        title = doc.data()!["title"],
        lat = doc.data()!["lat"],
        long = doc.data()!["long"],
        duration = doc.data()!["duration"],
        image = doc.data()!["image"],
        ticket = doc.data()!["ticket"],
        distance = "";
}