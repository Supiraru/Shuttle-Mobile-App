import 'package:flutter/material.dart';
import 'package:shuttle/data/post.dart';

class Comment extends StatelessWidget {
  final ListPost post;

  Comment({required this.post});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 900) {
          return CommentScreenMobile(post: post);
        } else {
          return CommentScreenWeb(post: post);
        }
      },
    );
  }
}

class CommentScreenMobile extends StatefulWidget {
  final ListPost post;

  const CommentScreenMobile({required this.post});

  @override
  _CommentScreenMobileState createState() => _CommentScreenMobileState();
}

class _CommentScreenMobileState extends State<CommentScreenMobile> {
  @override
  Widget build(BuildContext context) {
    Widget listPost() {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          Text(widget.post.name),
                          SizedBox(height: 3),
                          Text(widget.post.email)
                        ])
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(widget.post.post),
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
                                  widget.post.isLike
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: widget.post.isLike
                                      ? Colors.red
                                      : Colors.black),
                              onPressed: () {
                                setState(() {
                                  widget.post.isLike = !widget.post.isLike;
                                  widget.post.like += 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.post.like.toString())
                          ],
                        ),
                        SizedBox(width: 15),
                        Row(
                          children: [
                            Icon(Icons.mode_comment_outlined),
                            SizedBox(width: 5),
                            Text(widget.post.comment + " Comments")
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
          ));
    }

    Widget commentPost() {
      return Column(
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/images/profile.png",
                    scale: 0.75,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Alvaro Hutapea"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                              "HALO GAIS SELAMAT PAGI, HALO GAIS SELAMAT PAGI,HALO GAIS SELAMAT PAGI"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "7 Minute Ago",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.comment,
                                size: 10,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "2 Comments",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          )),
          Divider(
            color: Colors.black,
          )
        ],
      );
    }

    Widget post() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset("assets/images/profile.png"),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Type here ....",
                      ),
                    )),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          "send",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.blue,
            )),
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
        color: Colors.blueGrey,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              listPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              commentPost(),
              post()
            ],
          ),
        ),
      ),
    );
  }
}

class CommentScreenWeb extends StatefulWidget {
  final ListPost post;

  const CommentScreenWeb({required this.post});

  @override
  _CommentScreenWebState createState() => _CommentScreenWebState();
}

class _CommentScreenWebState extends State<CommentScreenWeb> {
  @override
  Widget build(BuildContext context) {
    Widget listPost() {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          Text(widget.post.name),
                          SizedBox(height: 3),
                          Text(widget.post.email)
                        ])
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(widget.post.post),
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
                                  widget.post.isLike
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: widget.post.isLike
                                      ? Colors.red
                                      : Colors.black),
                              onPressed: () {
                                setState(() {
                                  widget.post.isLike = !widget.post.isLike;
                                  widget.post.like += 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.post.like.toString())
                          ],
                        ),
                        SizedBox(width: 15),
                        Row(
                          children: [
                            Icon(Icons.mode_comment_outlined),
                            SizedBox(width: 5),
                            Text(widget.post.comment + " Comments")
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
          ));
    }

    Widget commentPost() {
      return Column(
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/images/profile.png",
                    scale: 0.75,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Alvaro Andrew"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                              "HALO AAN TEST INI MERUPAKAN TEST KALIMAT PANJANGG"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "7 Minute Ago",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueGrey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.comment,
                                size: 10,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "2 Comments",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          )),
          Divider(
            color: Colors.black,
          )
        ],
      );
    }

    Widget post() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset("assets/images/profile.png"),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Type here ....",
                      ),
                    )),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          "send",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.blue,
            )),
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
          alignment: Alignment.center,
          child: Container(
            width: 900,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                listPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                commentPost(),
                post()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
