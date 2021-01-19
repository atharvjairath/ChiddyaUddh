import 'package:cloud_firestore/cloud_firestore.dart';
import './user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future<void> updateUserData(String name, int win, int losses) async {
    return await brewCollection.document(uid).setData({
      'name': name,
      'win': win,
      'losses': losses,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        win: snapshot.data['win'],
        losses: snapshot.data['losses']);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
