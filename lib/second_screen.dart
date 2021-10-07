import 'package:flutter/material.dart';
class SecondScreen extends StatefulWidget {



  static const routeName ='/second';
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKeys = GlobalKey<FormState>();
  final _scaffoldKeys = GlobalKey<ScaffoldState>();
  final SnackBar _snackBar = SnackBar(
    content: const Text('Đã trang hai'),
    duration: const Duration(seconds: 5),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKeys,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(" lap trinh flutter"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Do Anh Vu"),
                accountEmail: Text("vudoanh0712@gmail.com"),

              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("Vu do"),
              ),
            ),

            Divider(height: 0.1,),
            ListTile(
              title: new Text("Inbox"),
              leading: new Icon(Icons.mail),
            ),
            Divider(height: 0.1,),
            ListTile(
              title: new Text("Sent"),
              leading: new Icon(Icons.inbox),
            ),
            Divider(height: 0.1,),
            ListTile(
              title: new Text("Logout"),
              leading: new Icon(Icons.logout),
            ),
            Divider(height: 0.1,),
            ListTile(
              title: new Text("About"),
              leading: new Icon(Icons.people_alt_outlined),
            ),
            Divider(height: 0.1,),

          ],
        ),
      ),
      body: Center(
       child: Text(
         "Xin chao anh Duc ",
         style: TextStyle(
             color: Colors.deepOrange
             ,fontSize: 30,
             fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        color: Colors.yellowAccent,
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKeys.currentState!.showSnackBar(new SnackBar(
            content: new Text("Trang hai đã hoàn thành"),
            duration: Duration(minutes: 1),


          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
