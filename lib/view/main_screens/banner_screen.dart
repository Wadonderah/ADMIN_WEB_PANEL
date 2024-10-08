import 'package:admin_web_panel/global/global_vars.dart';
import 'package:admin_web_panel/view/widgets/banners_list.dart';
import 'package:admin_web_panel/view/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import '../../global/global_instances.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titleMsg: "Upload Banners",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Upload Form.
            Form(
              key: formKey,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.purple,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display image - Pick image Button.
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Display image.
                            Container(
                              height: 140,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: Border.all(
                                  color: Colors.grey.shade800,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: imageFile != null
                                    ? Image.memory(imageFile)
                                    : Container(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // pick image button.
                            ElevatedButton(
                              onPressed: () async {
                                await commonViewModel.pickImage();

                                setState(() {
                                  imageFile;
                                  fileName;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              child: const Text(
                                "Pick Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        width: 40,
                      ),

                      // Upload Save Image Button.
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (imageFile == null && categoryName == null) {
                              commonViewModel.showSnackBar(
                                  "Uploading banner...", context);
                              await bannerViewModel
                                  .saveBannerImageInfoToFirestore();
                              setState(() {
                                formKey.currentState!.reset();
                                imageFile = null;
                              });
                              commonViewModel.showSnackBar(
                                  // ignore: use_build_context_synchronously
                                  "Banner uploaded successfully",
                                  // ignore: use_build_context_synchronously
                                  context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            // Display Banners.

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Uploaded Banners List:",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            const BannersList(),
          ],
        ),
      ),
    );
  }
}
