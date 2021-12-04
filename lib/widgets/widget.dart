import 'package:flutter/material.dart';
import 'package:news/screens/webview_screen.dart';

Widget buildArticleItems(model, context) => InkWell(
      onTap: () {
        naviagteTo(context, WebViewScreen(model['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        height: 170.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: model['urlToImage'] != null
                            ? NetworkImage(model['urlToImage'])
                            : NetworkImage(
                                'https://acmesaico.com/wp-content/themes/consultix/images/no-image-found-360x260.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                          ),
                          child: Text(
                            model['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  model['description'] != null
                      ? Text(
                          model['description'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                          ),
                        )
                      : Text('Null'),
                  Spacer(),
                  Text(
                    model['publishedAt'],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

void naviagteTo(context, Widget widget) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));

Widget listviewBuilder(List list, context) => ListView.separated(
    itemBuilder: (context, index) => buildArticleItems(list[index], context),
    separatorBuilder: (context, index) => SizedBox(
          height: 1.0,
        ),
    itemCount: list.length);
