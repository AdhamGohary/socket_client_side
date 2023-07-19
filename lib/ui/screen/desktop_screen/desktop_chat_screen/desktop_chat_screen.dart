import 'package:flutter/material.dart';
import 'package:socket_client_side/ui/screen/desktop_screen/desktop_chat_screen/component/recieve_msg.dart';
import 'package:socket_client_side/ui/screen/desktop_screen/desktop_chat_screen/component/send_msg.dart';
import 'package:socket_client_side/utils/functions/screen_size_function.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class DesktopChatScreen extends StatefulWidget {
  const DesktopChatScreen({super.key});

  @override
  State<DesktopChatScreen> createState() => _DesktopChatScreenState();
}

class _DesktopChatScreenState extends State<DesktopChatScreen> {
  final TextEditingController msg = TextEditingController();
  final msgs = [];
  late io.Socket socket;
  @override
  void initState() {
    initSocket();
    super.initState();
  }

  void initSocket() {
    socket = io.io('http://localhost:1212', {
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.connect();
    socket.onConnect((_) => print('Client 1 connect to server'));
    socket.on('res', (data) {
      msgs.insert(0, data);
      setState(() {});
    });
    socket.onDisconnect((_) => print('Client 1 disconnect with server'));
  }

  @override
  void dispose() {
    msg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Client 1 (adham)',
          style: TextStyle(fontSize: 0.05 * getWidth(context)),
        ),
      ),
      bottomNavigationBar: TextFormField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              hintText: 'send',
              hintStyle: TextStyle(
                  color: Colors.white, fontSize: 0.02 * getWidth(context)),
              suffixIcon: IconButton(
                  onPressed: () {
                    socket.emit('msg', [
                      {"isClient2": false, "msg": msg.text}
                    ]);
                    msg.clear();
                  },
                  icon: const Icon(Icons.send))),
          controller: msg),
      body: ListView.builder(
          reverse: true,
          itemCount: msgs.length,
          itemBuilder: (_, index) {
            return msgs[index]['isClient2'] == false
                ? SendMsg(msgs: msgs, index: index)
                : ReceiveMsg(msgs: msgs, index: index);
          }),
    );
  }
}
