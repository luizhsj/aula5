import 'package:aula5/views/data/user_data.dart';
import 'package:aula5/views/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: CircleAvatar(radius: 45,),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: users.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push
                      (context,
                       MaterialPageRoute(
                        builder: (context) => DetailPage
                        (user: users[index],
                        ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          CircleAvatar(radius: 50),
                          Text(
                            users[index]['firstName'],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text(users[index]['company']['title']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
