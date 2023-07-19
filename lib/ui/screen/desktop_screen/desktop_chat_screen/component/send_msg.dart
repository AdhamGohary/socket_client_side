import 'package:flutter/material.dart';
import 'package:socket_client_side/utils/functions/screen_size_function.dart';

class SendMsg extends StatelessWidget {
  final List _msgs;
  final int _index;
  const SendMsg({super.key, required List msgs, required int index})
      : _index = index,
        _msgs = msgs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 0.6 * getWidth(context),
          right: 0.035 * getWidth(context),
          bottom: 0.02 * getHight(context)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.05 * getWidth(context)),
        decoration: BoxDecoration(
            color: const Color.fromARGB(127, 214, 244, 255),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.08 * getWidth(context)),
                topLeft: Radius.circular(0.08 * getWidth(context)),
                bottomRight: Radius.circular(0.08 * getWidth(context)),
                topRight: Radius.zero)),
        child: Text(_msgs[_index]['msg']),
      ),
    );
  }
}
