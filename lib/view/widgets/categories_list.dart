import 'package:admin_web_panel/global/global_instances.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: categoryViewModel.readCategoriesFromFirestore(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> datasnapshot) {
        if (datasnapshot.hasError) {
          return const Text(
            "Something went wrong",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          );
        }
        if (datasnapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading Please Wait ...",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          );
        }
        if (datasnapshot.data!.docs.isEmpty) {
          return const Text(
            "No Category Available",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 8,
            mainAxisSpacing: 6,
          ),
          itemCount: datasnapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var eachbanner = datasnapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      eachbanner["image"],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      eachbanner["name"],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
