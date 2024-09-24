import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../global/global_vars.dart';

class CategoryViewModel {
  uploadCategoryImageToStorage() async {
    imageDOCID = fileName! +
        DateTime.now().millisecondsSinceEpoch.toString() +
        fileName.toString();
    Reference bannerRef = FirebaseStorage.instance
        .ref()
        .child("CategorY Images")
        .child(imageDOCID.toString());

    UploadTask uploadTask = bannerRef.putData(imageFile!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveCategoryInfoToFirestore() async {
    String downloadUrl = await uploadCategoryImageToStorage();
    await FirebaseFirestore.instance
        .collection("categories")
        .doc(imageDOCID)
        .set({
      "image": downloadUrl,
      "name": categoryName,
    });
  }

  readCategoriesFromFirestore() {
    Stream<QuerySnapshot> bannerStreamQuerySnapshot =
        FirebaseFirestore.instance.collection("categories").snapshots();
    return bannerStreamQuerySnapshot;
  }
}
