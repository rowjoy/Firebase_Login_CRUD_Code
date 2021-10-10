import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Person extends StatefulWidget {
  const Person({Key key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('Data Add From', style: TextStyle(fontSize: 30)),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Age',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              CollectionReference users =
                                  FirebaseFirestore.instance.collection('user');
                              users.add({
                                'Name': namecontroller.text,
                                'Age': agecontroller.text,
                              }).then((value) {
                                setState(() {});
                                print('Data Add Sucessfully$value');
                                namecontroller.clear();
                                agecontroller.clear();
                              }).catchError((e) {
                                print('Not Add Data$e');
                              });
                            },
                            child: Text('Add')),
                        ElevatedButton(onPressed: () {}, child: Text('update')),
                      ],
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection('user').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Erro$snapshot');
                    }
                    if (snapshot.hasData) {
                      print('Data not show $snapshot');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<DocumentSnapshot> data = snapshot.data.docs;

                      return Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(data[index]['Name']),
                                  subtitle: Text(data[index]['Age']),
                                  trailing: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('user')
                                                  .doc(data[index].id)
                                                  .delete()
                                                  .then((value) {
                                                setState(() {});
                                                print('Ok Done');
                                              }).catchError((e) {
                                                print('erro');
                                              });
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ));
                            }),
                      );
                     
                    }
                    return CircularProgressIndicator(
                      color: Colors.red,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

