import 'package:flutter/material.dart';
import 'package:socket_client_side/utils/functions/screen_size_function.dart';

class ReceiveMsg extends StatelessWidget {
  final List _msgs;
  final int _index;
  const ReceiveMsg({super.key, required List msgs, required int index})
      : _msgs = msgs,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 0.01 * getWidth(context),
          right: 0.6 * getWidth(context),
          bottom: 0.02 * getHight(context)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.05 * getWidth(context)),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 85, 120),
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.1 * getWidth(context)),
                  topLeft: Radius.circular(0.1 * getWidth(context)),
                  bottomRight: Radius.circular(0.1 * getWidth(context)),
                  bottomLeft: Radius.zero)),
          child: Text(_msgs[_index]['msg'])),
    );
  }
}
