import 'package:flutter/material.dart';

class chatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            Text(
              '20',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            )
          ],
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage("assets/images/person.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'mhmd smbl',
                ),
                Text(
                  'typing...',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.videocam_outlined,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.call_outlined,
            color: Colors.blue,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.all(20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/person1.jpg'),
                    radius: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.all(15),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(60, 50),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    'This is first message',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(15),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(60, 50),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Text(
                    'This is second message',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.all(20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/me.jpg'),
                    radius: 30,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 35,
                  ),
                  Expanded(
                    child: Container(
                      height: 35,
                      padding: EdgeInsetsDirectional.all(1),
                      margin: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(50, 50)),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.all(10),
                          hintText: 'Type a message',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          suffixIcon: Icon(
                            Icons.sticky_note_2_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic_none_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
