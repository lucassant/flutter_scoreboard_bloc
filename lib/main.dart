import 'package:counter_bloc/counterbloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scoreboard Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BodyWidget());
  }
}

class BodyWidget extends StatelessWidget {
  final CounterBloc bloc = CounterBloc(initialCountOne: 0, initialCountTwo: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("images/usa_flag.jpg"),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Material(
                  color: Colors.black.withOpacity(0.4),
                  child: InkWell(
                    onTap: () {
                      bloc.incrementTeamOne();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Text(
                          "USA",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: StreamBuilder(
                            stream: bloc.teamOneObs,
                            builder: (context, snapshot) {
                              return Text("${snapshot.data}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Tap the flag to increment",
                          style: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("images/denmark.jpg"),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Material(
                  color: Colors.black.withOpacity(0.4),
                  child: InkWell(
                    onTap: () {
                      bloc.incrementTeamTwo();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Denmark",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: StreamBuilder(
                          stream: bloc.teamTwoObs,
                          builder: (context, snapshot) {
                            return Text("${snapshot.data}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40));
                          },
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Tap the flag to increment",
                          style: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
