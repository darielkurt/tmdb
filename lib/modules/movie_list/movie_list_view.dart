import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        elevation: 2.0,
        title: Text(
          'YTS',
          style: TextStyle(color: Colors.green[600]),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text('tangina mo'),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 3,
        ),
      ),
    );
  }
}
