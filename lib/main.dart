import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modeling_app/post_page.dart';

import 'package:provider/provider.dart';

import 'Notify/Notify_page.dart';
import 'Person/Home_page.dart';
import 'Talk/Talk_page.dart';
import 'Timeline/Timeline_page.dart';
import 'main_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Widget> _pageList = [
    TimelinePage(),
    TalkPage(),
    NotifyPage(),
    HomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'practice',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('tweet'),
          ),
          bottomNavigationBar: Consumer<MainModel>(
            builder: (context, model, child) {
              return BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    title: Text('timeline'),
                    icon: Icon(Icons.school),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    title: Text('Talk'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text('notify'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Home'),
                  ),
                ],
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.blueAccent,
                currentIndex: model.selectedIndex,
                onTap: (int index) {
                  model.selectedIndex = index;
                },
              );
            },
          ),
          floatingActionButton:
              Consumer<MainModel>(builder: (context, model, child) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PostPage();
                    },
                  ),
                );
              },
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_circle,
                          size: 60.0,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'username',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text: "tweet.twitterHandle",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey)),
                                        TextSpan(
                                            text: "tweet.time",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey))
                                      ]),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    flex: 5,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.expand_more,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                'tweet',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.comment,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.red,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.shareAlt,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
