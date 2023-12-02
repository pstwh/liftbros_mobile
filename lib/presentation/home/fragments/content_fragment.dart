import 'package:flutter/material.dart';
import 'package:liftbros_mobile/constants.dart';

class ContentFragment extends StatefulWidget {
  const ContentFragment({required this.callback, super.key});

  final Function callback;

  @override
  State<ContentFragment> createState() => _ContentFragmentState();
}

class _ContentFragmentState extends State<ContentFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            widget.callback();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: darkerColor, borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text('Stop Lifting',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    ));
  }
}
