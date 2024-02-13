import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';
import 'page_list_view_details.dart';


class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SizedBox(
        height: screensize.height,
        width: screensize.width,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
            child: SizedBox(
              height: 40.0,
              // width: 280.0,
              child: TextFormField(
                controller: fromdate,
                onTap: () async {
                  DateTime? frompicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (frompicked != null) {
                    setState(() {
                      fromdate.text = DateFormat('EEEE ,  MMM  d ,  yyyy')
                          .format(frompicked);
                    });
                  }
                },
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                    hintText: "Select From Date",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                textAlignVertical: TextAlignVertical.bottom,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: SizedBox(
              height: 40.0,
              // width: 280.0,
              child: TextFormField(
                controller: todate,
                onTap: () async {
                  DateTime? topicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (topicked != null) {
                    setState(() {
                      todate.text =
                          DateFormat('EEEE ,  MMM  d ,  yyyy').format(topicked);
                    });
                  }
                },
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                    hintText: "Select To Date",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                textAlignVertical: TextAlignVertical.bottom,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 5,
            width: screensize.width,
            margin: const EdgeInsets.only(left: 5.0,right: 5.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.yellow,
                Colors.red,
                Colors.green,
              ],
            )),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const PageListViewDetails();
                          })
                        );
                      },
                      leading: Icon(Icons.list_sharp,color: colorprimary,size: 35.0),
                      title: Text("Pass No. ${index + 1}"),
                      subtitle: const Text(
                        "Date: ",
                      ),
                      trailing: Icon(Icons.arrow_drop_down_sharp,color: colorprimary,size: 25),
                    ),
                  );
                }),
          ),
        ]));
  }
}
