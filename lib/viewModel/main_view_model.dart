import 'package:admin_web_panel/global/global_vars.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainViewModel {
  pickImage() async {
    FilePickerResult? resultFilePicker = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (resultFilePicker != null) {
      imageFile = resultFilePicker.files.first.bytes;
      fileName = resultFilePicker.files.first.name;
    }
  }

  uploadBannerImageToStorage() async {
    String fileNmaeID =
        fileName! + DateTime.now().millisecondsSinceEpoch.toString();
    Reference bannerRef = FirebaseStorage.instance
        .ref()
        .child("banners")
        .child(fileName.toString() + fileNmaeID.toString());

    UploadTask uploadTask = bannerRef.putData(imageFile!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveBannerImageInfoToFirestore() {}
}
