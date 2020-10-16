import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1000,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: HomePage(
        title: 'Time Keeper Lookup',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child:
                    Text('Please enter the three characters of a timekeeper.'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: SizedBox(
                width: 400,
                child: TextFormField(
                  onChanged: (value) {},
                  // controller: searchCriteriaTextEditingController,
                  onFieldSubmitted: (value) {
                    print('submitted1 $value');
                    //   try {
                    //     BlocProvider.of<SearchBloc>(context).add(SubmitEvent(
                    //         searchTerm:
                    //             searchCriteriaTextEditingController.value.text));
                    //   } catch (e) {
                    //     print(e);
                    //   }
                    //   // print('submitted2 $value');
                  },
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Search Criteria',
                    isDense: false,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Person')],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     new BottomNavigationBarItem(
      //       icon: Icon(Icons.copy),
      //       label: 'tits',
      //     ),
      //     new BottomNavigationBarItem(
      //       icon: Icon(Icons.copy),
      //       label: 'tits',
      //     )
      //   ],
      // ),
    );
  }
}
