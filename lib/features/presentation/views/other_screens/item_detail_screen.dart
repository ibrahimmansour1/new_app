import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({
    super.key,
    required this.imageUrl,
    required this.source,
    required this.title,
    required this.date,
    required this.content,
    required this.category,
  });
  final String imageUrl;
  final String source;
  final String title;
  final String date;
  final String category;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 32,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black26,
                child: IconButton(
                  icon: const Icon(
                    Icons.bookmark_border_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black26,
                child: IconButton(
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 450,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    source,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.check_rounded,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24.0)),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                              imageUrl: imageUrl,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        source,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ]),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}