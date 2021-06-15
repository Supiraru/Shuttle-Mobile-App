import 'package:flutter/material.dart';
import 'package:shuttle/comment.dart';
import 'package:shuttle/data/post.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 900) {
          return HomeScreenMobile();
        }if (constraints.maxWidth <= 900) {
          return HomeScreenMobile();
        } else {
          return HomeScreenWeb();
        }
      },
    );
  }
}

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    Widget listPost({required ListPost post}) {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Comment(post: post);
              }));
            },
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Image.asset("assets/images/profile.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.name),
                              SizedBox(height: 3),
                              Text(post.email)
                            ])
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(post.post),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                      post.isLike
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: post.isLike
                                          ? Colors.red
                                          : Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      post.isLike = !post.isLike;
                                      post.like = post.like + 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(post.like.toString())
                              ],
                            ),
                            SizedBox(width: 15),
                            Row(
                              children: [
                                Icon(Icons.mode_comment_outlined),
                                SizedBox(width: 5),
                                Text(post.comment + " Comments")
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share_outlined),
                            SizedBox(width: 5),
                            Text("Share")
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ));
    }

    Widget hotTopicPart() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: Offset(0, 3))
            ]),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20),
        width: 250,
        child: Row(children: [
          Image.asset('assets/images/logo-hot-topics.png'),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ini Judul dari hot topics",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Ini deskripsi dari hot topics"),
              Text("dan lanjutannya")
            ],
          )
        ]),
      );
    }

    Widget hotTopic() {
      return Container(
          child: Card(
              child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
                child: Text(
              "Hot Topics Right Now",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                ].toList(),
              ),
            )
          ],
        ),
      )));
    }

    Widget postStatus() {
      return Container(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                    child: Row(
                  children: [
                    Image.asset('assets/images/profile.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Whats on your mind, aan?",
                        ),
                      ),
                    )
                  ],
                )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.photo,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Photo/video")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.people,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Tag Friends")
                            ],
                          ),
                        ),
                        Container(
                            child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 30)),
                          child: Text(
                            "Upload",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: null,
                        )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo-profile.png'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            postStatus(),
            Expanded(
              child: ListView(
                children: postList.map((post) => listPost(post: post)).toList(),
              ),
            ),
            hotTopic(),
          ],
        ),
      ),
    );
  }
}

class HomeScreenWeb extends StatefulWidget {
  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    Widget listPost({required ListPost post}) {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Comment(post: post);
              }));
            },
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Image.asset("assets/images/profile.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.name),
                              SizedBox(height: 3),
                              Text(post.email)
                            ])
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(post.post),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                      post.isLike
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: post.isLike
                                          ? Colors.red
                                          : Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      post.isLike = !post.isLike;
                                      post.like = post.like + 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(post.like.toString())
                              ],
                            ),
                            SizedBox(width: 15),
                            Row(
                              children: [
                                Icon(Icons.mode_comment_outlined),
                                SizedBox(width: 5),
                                Text(post.comment + " Comments")
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share_outlined),
                            SizedBox(width: 5),
                            Text("Share")
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ));
    }

    Widget hotTopicPart() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: Offset(0, 3))
            ]),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20),
        width: 250,
        child: Row(children: [
          Image.asset('assets/images/logo-hot-topics.png'),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ini Judul dari hot topics",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Ini deskripsi dari hot topics"),
              Text("dan lanjutannya")
            ],
          )
        ]),
      );
    }

    Widget hotTopic() {
      return Container(
          child: Card(
              child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
                child: Text(
              "Hot Topics Right Now",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                  hotTopicPart(),
                ].toList(),
              ),
            )
          ],
        ),
      )));
    }

    Widget postStatus() {
      return Container(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                    child: Row(
                  children: [
                    Image.asset('assets/images/profile.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Whats on your mind, aan?",
                        ),
                      ),
                    )
                  ],
                )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.photo,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Photo/video")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.people,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Tag Friends")
                            ],
                          ),
                        ),
                        Container(
                            child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 30)),
                          child: Text(
                            "Upload",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: null,
                        )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo-profile.png'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          color: Colors.grey[100],
          alignment: Alignment.center,
          width: 900,
          child: Column(
            children: [
              postStatus(),
              Expanded(
                child: ListView(
                  children: postList.map((post) => listPost(post: post)).toList(),
                ),
              ),
              hotTopic(),
            ],
          ),
        ),
      ),
    );
  }
}
