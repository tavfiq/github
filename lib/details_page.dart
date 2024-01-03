import 'package:flutter/material.dart';
import 'package:real_estate/widget.dart';

class Details2 extends StatefulWidget {
  const Details2({super.key});

  @override
  State<Details2> createState() => _Details2State();
}

class _Details2State extends State<Details2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "House of Life",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 285",
        pageId: '1',
      ),
    );
  }
}

class Details3 extends StatelessWidget {
  const Details3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "Blackberry",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 81",
        pageId: '2',
      ),
    );
  }
}

class Details4 extends StatelessWidget {
  const Details4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "Willow Barn",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 239",
        pageId: '3',
      ),
    );
  }
}

class Details5 extends StatelessWidget {
  const Details5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "Hunters Wood",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 361",
        pageId: '4',
      ),
    );
  }
}

class Details6 extends StatelessWidget {
  const Details6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "House Slynt",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 519",
        pageId: '5',
      ),
    );
  }
}

class Details7 extends StatelessWidget {
  const Details7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Details(
        text: "Pine View",
        about:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at. It provides exceptional home features and amenities, from spacious interiors with high-end finishes to the latest technology. A high price tag property always comes with premium materials such as marble and hardwood, as well as custom-designed elements, bring individuality and opulence and define a luxury home.",
        price: "\$ 471",
        pageId: '6',
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
