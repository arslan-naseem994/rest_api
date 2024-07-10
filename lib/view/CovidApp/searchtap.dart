import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataScreen extends StatefulWidget {
  String image;
  String countryname;
  int totalcases, totaldeath;
  DataScreen(
      {super.key,
      required this.image,
      required this.totalcases,
      required this.totaldeath,
      required this.countryname});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryname),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
            ),
            title: Text(widget.countryname),
            subtitle: Text(widget.totalcases.toString()),
          ),
        ],
      ),
    );
  }
}
