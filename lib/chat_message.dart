import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final Map<String, dynamic> data;

  ChatMessage(this.data);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["senderName"],
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: data["imageUrl"] != null
                        ? Image.network(
                            data["imageUrl"],
                            width: 250.0,
                          )
                        : Text(data["text"]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
