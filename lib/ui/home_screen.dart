import 'package:flutter/material.dart';
import 'package:restaurantcity/model/restaurant.dart';
import 'package:restaurantcity/ui/detail_screen.dart';


class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: Colors.blue,
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final resto = parseRestaurants(snapshot.data);
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemCount: resto.restaurants.length,
            itemBuilder: (context, index) {
              return MainMobile(resto: resto.restaurants[index]);
            },
          );
        },
      ),
    );
  }
}

class MainMobile extends StatelessWidget {
  final Restaurant resto;
  const MainMobile({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: resto);
        },
        child: SizedBox(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Hero(
                    tag: resto.pictureId,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      child: Image.network(resto.pictureId, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 2.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resto.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              size: 14,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              resto.city,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Color(0xffFFC41F),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              resto.rating.toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
