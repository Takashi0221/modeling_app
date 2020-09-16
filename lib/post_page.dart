import 'package:flutter/material.dart';
import 'package:modeling_app/post_page_model.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostPageModel>(
      create: (_) => PostPageModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('PostPage'),
        ),
        body: Consumer<PostPageModel>(
          builder: (context, model, child) {
            return Center(child: Text('PostContents'));
          },
        ),
      ),
    );
  }
}
