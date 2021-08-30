import 'package:flutter/material.dart';
import 'package:the_observer_flutter/logic/api.dart';


class MenuCard extends StatelessWidget {
  MenuCard( {required this.cat, required this.loading} );

  late String cat;
  late Function loading;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: InkWell(
        onTap: () {
          loading(cat);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
          child: Text(
            cat,
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}