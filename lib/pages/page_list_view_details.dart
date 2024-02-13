
import 'package:flutter/material.dart';

class PageListViewDetails extends StatefulWidget {
  const PageListViewDetails({super.key});

  @override
  State<PageListViewDetails> createState() => _PageListViewDetailsState();
}

class _PageListViewDetailsState extends State<PageListViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List Details",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("List Details "),
      ],)
    );
  }
}