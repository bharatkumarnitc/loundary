import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import '../Widget/ourservices.dart';


class UserMainpage extends StatefulWidget {
  @override
  _UserMainpageState createState() => _UserMainpageState();
}

class _UserMainpageState extends State<UserMainpage> {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: <Widget>[
        GFCarousel(
          items: imageList.map(
                (url) {
              return Container(
                margin: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: 1000.0
                  ),
                ),
              );
            },
          ).toList(),
          onPageChanged: (index) {
            setState(() {
              index;
            });
          },
        ),
       Container(
         margin:EdgeInsets.only(top: 20),
         child:  Text('Our Services'),
       ),
        Container(
          margin: EdgeInsets.only(top: 50),

          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,children: <Widget>[
            OurServices('Wash'),
            OurServices('Wash & Iron'),
            OurServices('Iron'),
            OurServices('Emergency')



          ],),
        )

      ],

    ));
  }
}
