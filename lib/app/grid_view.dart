import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<Map> list = [
  {"img": "https://img.golang.space/shot-1617474467143.webp"},
  {
    "img": "https://img.golang.space/shot-1617474196403.png",
  },
  {
    "img": "https://img.golang.space/shot-1617474381018.jpg",
  },
  {
    "img": "https://img.golang.space/shot-1617474391279.png",
  },
  {"img": "https://img.golang.space/shot-1617474416796.png"},
  {"img": "https://img.golang.space/shot-1617474429389.jpg"},
  {"img": "https://img.golang.space/shot-1617474450090.png"},
  {"img": "https://img.golang.space/shot-1617474459735.png"},
  {"img": "https://img.golang.space/shot-1617474479143.webp"},
  {"img": "https://img.golang.space/shot-1617474562452.jpg"},
];

class StaggeredView extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    debugPrint("build StaggeredView");
    return Container(
      height: 1300,
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: new StaggeredGridView.countBuilder(
        //滑动控制器
        controller: _scrollController,
        primary: false,
        //滑动方向
        scrollDirection: Axis.vertical,
        //纵轴方向被划分的个数
        crossAxisCount: 2,
        //item的数量
        itemCount: list.length,
        /**
           * mainAxisSpacing:主轴item之间的距离（px）
           * crossAxisSpacing:纵轴item之间的距离（px）
           * */
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: SizedBox(
              //随机生成高度
              height: 180 + Random().nextInt(10) * 6.0,
              width: 20,
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(list[index]["img"]),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Title",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color:
                                              Theme.of(context).accentColor)),
                              Text(
                                "2021-04-02 18:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                        color: Theme.of(context).accentColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
