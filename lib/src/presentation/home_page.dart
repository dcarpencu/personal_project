import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/src/actions/index1.dart';
import 'package:movie_app/src/containers/home_page_container.dart';
import 'package:movie_app/src/models/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ScrollController _controller = ScrollController();
  //final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return HomePageContainer(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Available courses'),
            leading: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(const Logout());
              },
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 8,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.image),
                      title: Text('The Enchanted Nightingale'),
                      subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('Check available tutors'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          //style: ButtonStyle(elevation: 4),
                          onPressed: () {/* ... */},
                          child: const Text('Course description'),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
