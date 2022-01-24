import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = ScrollController();
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true, //appBar snapping is smoother
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarTextStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.transparent,
            floating: true,
            snap: true,
            actions: [
              SafeArea(
                  child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Colors.black38,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, offset: const Offset(0.5, 0.5))
                    ]),
                padding: EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 5),
                child: SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 65,
                      child: TextField(
                        cursorColor: Color(0xFF000000),
                        controller: _searchController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: Color(0x00000000).withOpacity(0.8),
                              size: 35,
                            ),
                            hintText: "Search",
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://randomuser.me/api/portraits/men/11.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )),
              ))
            ],
          )
        ],
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              SizedBox(
                width: 50,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.star_border_purple500_outlined),
                        Text(
                          'Favourites',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              _Favourites(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 50,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Recents',
                          style: const TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              _Recents(context)
            ],
          ),
        )),
      ),
    );
  }
}

List FavouriteList = [
  {
    "name": "Novac",
    "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
  },
  {
    "name": "Derick",
    "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
  },
  {
    "name": "Mevis",
    "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
  },
  {
    "name": "Emannual",
    "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
  },
  {
    "name": "Gracy",
    "imageUrl":
        "https://i.picsum.photos/id/21/300/300.jpg?hmac=I77nChTaKeYb0wkgaPpJz4_6h8YeuZxU-WaA4k28OGQ",
  },
  {
    "name": "Robert",
    "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
  }
];

_Favourites() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 0),
        ),
        Row(
            children: List.generate(FavouriteList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    FavouriteList[index]['imageUrl']),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    FavouriteList[index]['name'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
          );
        }))
      ],
    ),
  );
}

List RecentsList = [
  {
    "name": "Novac",
    "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
  },
  {
    "name": "Derick",
    "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
  },
  {
    "name": "Mevis",
    "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
  },
  {
    "name": "Emannual",
    "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
  },
  {
    "name": "Gracy",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
  },
  {
    "name": "Robert",
    "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
  },
  {
    "name": "Lucy",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
  },
  {
    "name": "Emma",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
  },
  {
    "name": "Luise",
    "imageUrl": "https://randomuser.me/api/portraits/women/59.jpg",
  },
  {
    "name": "Nicholas",
    "imageUrl": "https://randomuser.me/api/portraits/men/88.jpg",
  },
  {
    "name": "Nat",
    "imageUrl": "https://randomuser.me/api/portraits/women/76.jpg",
  },
  {
    "name": "Eileen",
    "imageUrl": "https://randomuser.me/api/portraits/women/36.jpg",
  },
  {
    "name": "Novac",
    "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
  },
  {
    "name": "Derick",
    "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
  },
  {
    "name": "Mevis",
    "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
  },
  {
    "name": "Emannual",
    "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
  },
  {
    "name": "Tracy",
    "imageUrl": "https://randomuser.me/api/portraits/women/26.jpg",
  },
  {
    "name": "Rob",
    "imageUrl": "https://randomuser.me/api/portraits/men/96.jpg",
  },
  {
    "name": "Lily",
    "imageUrl": "https://randomuser.me/api/portraits/women/5.jpg",
  },
  {
    "name": "Ava",
    "imageUrl": "https://randomuser.me/api/portraits/women/16.jpg",
  },
  {
    "name": "Lisen",
    "imageUrl": "https://randomuser.me/api/portraits/women/19.jpg",
  },
  {
    "name": "Peter",
    "imageUrl": "https://randomuser.me/api/portraits/men/8.jpg",
  },
  {
    "name": "Katty",
    "imageUrl": "https://randomuser.me/api/portraits/women/22.jpg",
  },
  {
    "name": "Rem",
    "imageUrl": "https://randomuser.me/api/portraits/women/16.jpg",
  }
];

_Recents(BuildContext context) {
  return Column(
    children: List.generate(RecentsList.length, (index) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  NetworkImage(RecentsList[index]['imageUrl']),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    RecentsList[index]['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }),
  );
}
