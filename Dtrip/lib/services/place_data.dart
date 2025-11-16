import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/database.dart';

class PlaceService {
  final CollectionReference placesRef = FirebaseFirestore.instance.collection(
    'places',
  );

  Future<List<Place>> fetchPopularPlaces() async {
    final query = await placesRef.where('popular', isEqualTo: true).get();

    return query.docs
        .map((doc) => Place.fromDocument(doc.data() as Map<String, dynamic>))
        .toList();
  }
}

