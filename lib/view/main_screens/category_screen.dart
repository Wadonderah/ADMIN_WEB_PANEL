import 'package:admin_web_panel/global/global_instances.dart';
import 'package:flutter/material.dart';

import '../../global/global_vars.dart';
import '../widgets/categories_list.dart';
import '../widgets/my_appbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        titleMsg: "Upload Category",
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
                        width: 20,
                      ),

                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          onChanged: (valueText) {
                            categoryName = valueText;
                          },
                          validator: (valueText) {
                            if (valueText!.isEmpty) {
                              return "Please enter category name";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            label: Text(
                              "Write Category Name",
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 40,
                      ),

                      // Upload Save Image Button.
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (imageFile != null) {
                              commonViewModel.showSnackBar(
                                  "Uploading Category...", context);
                              await categoryViewModel
                                  .saveCategoryInfoToFirestore();
                              setState(() {
                                formKey.currentState!.reset();
                                imageFile = null;
                                categoryName = "";
                              });
                              commonViewModel.showSnackBar(
                                  // ignore: use_build_context_synchronously
                                  "Category uploaded successfully",
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
            const CategoryList(),
          ],
        ),
      ),
    );
  }
}
