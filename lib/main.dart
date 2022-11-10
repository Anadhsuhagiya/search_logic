import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Search(),
    theme: ThemeData(fontFamily: 'SFPRO'),
  ));
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> Names = [
    'Anadh',
    'Ajay',
    'Aniket',
    'Abhishek',
    'Ayushi',
    'Arushi',
    'Arvind',
    'Bhadresh',
    'Bansi',
    'Bhagavati',
    'Bhakti',
    'Bhavdip',
    'Bharat',
    'Chandu',
    'Champa',
    'Chameli',
    'Pappa',
    'Mom',
    'Mama',
    'Piyush',
  ];

  List<String> temp = [];
  bool isSearch = false;
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    temp.addAll(Names);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: isSearch
            ? AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearch = false;
                      });
                    },
                    icon: Icon(Icons.close)),
                title: TextField(
                  onChanged: (value) {
                    temp.clear(); // when any changes temp list clear every time

                    for (int i = 0; i < Names.length; i++) {
                      if (Names[i]
                          .toString()
                          .toLowerCase()
                          .contains(value.trim().toLowerCase())) {
                        temp.add(Names[i]);
                      }
                    }
                    setState(() {});
                  },
                  cursorColor: Colors.red,
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here...",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Search_Logic",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearch = true;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
        body: isSearch
            ? ListView.builder(
                itemCount: temp.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 80,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        color: Color(0xffffffff),
                        shadows: [
                          BoxShadow(
                              blurRadius: 7,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                              color: Colors.black.withOpacity(0.4))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "${temp[index]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: Names.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 80,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        color: Color(0xffffffff),
                        shadows: [
                          BoxShadow(
                              blurRadius: 7,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                              color: Colors.black.withOpacity(0.4))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "${Names[index]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
