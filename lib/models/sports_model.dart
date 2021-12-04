class SportModel {
  String? status;
  List? articleData;

  SportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    articleData = json['articles'];
  }
}

// class ArticleListModel {
//   List<SportArticle> artList = [];

//   ArticleListModel.fromJson(Map<String, dynamic> json) {
//     json['articles'].forEach((element) {
//       artList.add(SportArticle.fromJson(element));
//     });
//   }
// }
// new change here

//hey you

// do your best

// changes to push to github

class SportArticle {
  String? title;
  String? desc;
  String? linkUrl;
  String? imageUrl;

  SportArticle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    linkUrl = json['linkUrl'];
    imageUrl = json['imageUrl'];
  }
}
