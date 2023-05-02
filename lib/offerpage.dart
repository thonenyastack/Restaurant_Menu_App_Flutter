import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
        Offer(
          title: "Upcoming Offer",
          description: "",
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  //Properties
  final String title;
  final String description;

  const Offer({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 7,
          color: Colors.amberAccent.shade200,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/background.png",
                  )),
            ),
            child: Column(
              children: [
                Center(
                    child: Container(
                  color: Colors.amberAccent.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                )),
                Center(
                    child: Text(
                  description,
                  style: Theme.of(context).textTheme.headline5,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
