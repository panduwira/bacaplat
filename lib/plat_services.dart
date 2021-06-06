import 'dart:io';
import 'package:bacaplat/modelPlat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PlatServices {
  String id, plat, date;

  static CollectionReference platCollection =
      FirebaseFirestore.instance.collection("plat");
  static DocumentReference platDoc;

  static Future<bool> addData(PlatNomor platnomor) async {
    await Firebase.initializeApp();

    platDoc = await platCollection.add(
      {
        'id': "",
        'plat': platnomor.plat,
        'date': platnomor.date,
      },
    );

    if (platDoc.id != null) {
      platCollection.doc(platDoc.id).update({
        'id': platDoc.id,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    DocumentSnapshot snapshot;
    snapshot = await PlatServices.platCollection.doc().get();
    return snapshot;
  }
}
