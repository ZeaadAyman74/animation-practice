import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocket extends StatelessWidget {
  const WebSocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

void chat(){
    final url=Uri.parse('');
    var channel=WebSocketChannel.connect(url,);

    channel.stream.listen((event) {
    },

    );
}

}
