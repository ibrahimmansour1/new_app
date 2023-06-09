import 'package:flutter/material.dart';
import 'package:news_app/features/presentation/views/home_view.dart';

import '../../../../core/repo/home_repo_implementation.dart';

List<String> categoryList = [
  'business',
  'entertainment',
  'general',
  'science',
  'sports',
  'technology',
  'health',
];

List<String> passedParameterList = [];

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              "Choose Categories to start read about",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            categoryParameterList
                                .add(categoryList[index]);
                            debugPrint(
                                '${categoryList[index]} added successfully');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.abc,
                                    size: 100,
                                  ),
                                  Text(
                                    categoryList[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeView(
                              passedParameterList: passedParameterList,
                            )));
              },
              child: const Text("Continue"),
            )
          ]),
        ),
      ),
    );
  }
}