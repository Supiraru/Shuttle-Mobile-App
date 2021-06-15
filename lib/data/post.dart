class ListPost {
  String name;
  String email;
  String post;
  int like;
  String comment;
  bool isLike = false;

  ListPost({
    required this.name,
    required this.email,
    required this.post,
    required this.like,
    required this.comment,
  });
}

var postList = [
  ListPost(
    name: 'Aan Dewanta',
    email: 'aan@gmail.com',
    post:
        'Hello Dicoding, this my first flutter project that i made seriously. i learned so much about flutter by doin this project. i tried to apply my React JS logic and it didnt work. kinda stress a bit but it was fun when the problem got solved. Well i must learn again. Thank you so much. Oh yeah Dont Forget to click the post to see the comment section!',
    like: 130,
    comment: '14',
  ),
  ListPost(
    name: 'Hanif Ramdahan',
    email: 'hanif@gmail.com',
    post:
        'Hello aan How are you?',
    like: 9,
    comment: '24',
  ),
  ListPost(
    name: 'Akbar Maulana',
    email: 'Akbar@gmail.com',
    post:
        'Im fine, thank you',
    like: 12,
    comment: '2',
  ),
  ListPost(
    name: 'Daffa Haryadi',
    email: 'Daffa@gmail.com',
    post:
        'Well He is not talking to you, daahh',
    like: 3,
    comment: '6',
  ),
  ListPost(
    name: 'Abdullah Azzam',
    email: 'abdullah@gmail.com',
    post:
        'Hey Whats going on here? Guys?',
    like: 8,
    comment: '9',
  ),
  ListPost(
    name: 'Adin Nugroho',
    email: 'Adin@gmail.com',
    post:
        'AJAAMM hehe',
    like: 18,
    comment: '29',
  ),
  ListPost(
    name: 'Rudi Pratama',
    email: 'Rudi@gmail.com',
    post:
        'adin Shut up',
    like: 25,
    comment: '19',
  ),
];
