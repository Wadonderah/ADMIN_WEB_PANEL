import 'package:admin_web_panel/global/global_vars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BannerViewModel {
  pickImage() async {
    FilePickerResult? resultFilePicker = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (resultFilePicker != null) {
      imageFile = resultFilePicker.files.first.bytes;
      fileName = resultFilePicker.files.first.name;
    }
  }

  uploadImageToStorage() async {
    imageDOCID = fileName! +
        DateTime.now().millisecondsSinceEpoch.toString() +
        fileName.toString();
    Reference bannerRef = FirebaseStorage.instance
        .ref()
        .child("banners")
        .child(imageDOCID.toString());

    UploadTask uploadTask = bannerRef.putData(imageFile!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveBannerImageInfoToFirestore() async {
    String downloadUrl = await uploadImageToStorage();
    await FirebaseFirestore.instance.collection("banners").doc(imageDOCID).set({
      "image": downloadUrl,
    });
  }
}
