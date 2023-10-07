import 'package:flutter/material.dart';
import 'package:hello_world/login.dart';
import 'package:hello_world/screen/about.dart';
import 'package:hello_world/screen/add_recipe.dart';
import 'package:hello_world/screen/basket.dart';
import 'package:hello_world/screen/history.dart';
import 'package:hello_world/screen/home.dart';
import 'package:hello_world/screen/my_courses.dart';
import 'package:hello_world/screen/quiz.dart';
import 'package:hello_world/screen/search.dart';
import 'package:hello_world/screen/studentList.dart';
import 'package:hello_world/screen/leaderboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

String active_user = "";

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {
    if (result == '') {
      runApp(const MyLogin());
    } else {
      active_user = result;
      runApp(const MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'about': (context) => About(),
        'basket': (context) => Basket(),
        'studentList': (context) => StudentList(),
        'myCourses': (context) => MyCourses(),
        'add_recipe': (context) => AddRecipe(),
        'quiz': (context) => Quiz(),
        'leaderboard': (context) => Leaderboard()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // String _text = '';
  // final Runes _smile = Runes('\u{1f607}');
  int _currentIndex = 0;
  final List<Widget> _screen = [Home(), Search(), History()];
  final List<String> _title = ['Home', 'Search', 'History'];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
      // if (_counter % 5 == 0) {
      //   _text += '\u{1f620}';
      // } else {
      //   _text += String.fromCharCodes(_smile);
      // }
    });
  }

  String _user_id = "";

  @override
  void initState() {
    super.initState();
    checkUser().then((value) => setState(
          () {
            _user_id = value;
          },
        ));
  }

  void doLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user_id");
    main();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(_title[_currentIndex]),
        ),
      ),
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     //
      //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
      //     // action in the IDE, or press "p" in the console), to see the
      //     // wireframe for each widget.
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //       Text(
      //         _text,
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      body: _screen[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.skip_previous),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.skip_next),
        ),
      ],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history),
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Drawer myDrawer() {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text(_user_id),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150"))),
          ListTile(
            title: new Text("Inbox"),
            leading: new Icon(Icons.inbox),
          ),
          ListTile(
            title: new Text("My Basket "),
            leading: new Icon(Icons.shopping_basket),
            onTap: () {
              Navigator.popAndPushNamed(context, "basket");
            },
          ),
          ListTile(
              title: Text("About"),
              leading: Icon(Icons.help),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "about");
              }),
          ListTile(
              title: Text("Student List"),
              leading: Icon(Icons.group),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "studentList");
              }),
          ListTile(
              title: Text("My Courses"),
              leading: Icon(Icons.book),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "myCourses");
              }),
          ListTile(
              title: Text("Add Recipe"),
              leading: Icon(Icons.add),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "add_recipe");
              }),
          ListTile(
              title: Text("Quiz"),
              leading: Icon(Icons.quiz),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "quiz");
              }),
              ListTile(
              title: Text("Leaderboard"),
              leading: Icon(Icons.quiz),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                Navigator.popAndPushNamed(context, "leaderboard");
              }),
          ListTile(
              title: Text("LogOut"),
              leading: Icon(Icons.logout),
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => About()));
                doLogout();
              }),
        ],
      ),
    );
  }
}
