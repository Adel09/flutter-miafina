import 'package:firebase_database/firebase_database.dart';
import 'postmodel.dart';

class PostDao {
  final DatabaseReference _postsRef =
  FirebaseDatabase.instance.reference().child('posts');

  void savePost(Post post) {
    _postsRef.push().set(post.toJson());
  }

  Query getPostQuery() {
    return _postsRef;
  }

}