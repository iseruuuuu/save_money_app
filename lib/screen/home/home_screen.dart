import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_money_app/database/bloc/bloc.dart';
import 'package:save_money_app/model/money.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<Bloc>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: StreamBuilder<List<Money>>(
        stream: _bloc.todoStream,
        builder: (BuildContext context, AsyncSnapshot<List<Money>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Money money = snapshot.data![index];
                return Dismissible(
                  key: Key(money.id!),
                  onDismissed: (direction) {
                    _bloc.delete(money.id!);
                  },
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
