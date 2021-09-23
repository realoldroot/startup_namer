class TopicTitle {
  TopicTitle({
    this.tid,
    this.fid,
    this.quoteFrom,
    this.quoteTo,
    this.titlefont,
    this.topicMisc,
    this.author,
    this.authorid,
    this.subject,
    this.type,
    this.postdate,
    this.lastpost,
    this.lastposter,
    this.replies,
    this.lastmodify,
    this.recommend,
    this.tpcurl,
  });

  TopicTitle.fromJson(dynamic json) {
    tid = json['tid'];
    fid = json['fid'];
    quoteFrom = json['quote_from'];
    quoteTo = json['quote_to'];
    titlefont = json['titlefont'];
    topicMisc = json['topic_misc'];
    author = json['author'];
    authorid = json['authorid'];
    subject = json['subject'];
    type = json['type'];
    postdate = json['postdate'];
    lastpost = json['lastpost'];
    lastposter = json['lastposter'];
    replies = json['replies'];
    lastmodify = json['lastmodify'];
    recommend = json['recommend'];
    tpcurl = json['tpcurl'];
  }

  int? tid;
  int? fid;
  int? quoteFrom;
  dynamic quoteTo;
  dynamic titlefont;
  dynamic topicMisc;
  String? author;
  int? authorid;
  String? subject;
  int? type;
  int? postdate;
  int? lastpost;
  String? lastposter;
  int? replies;
  int? lastmodify;
  int? recommend;
  String? tpcurl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tid'] = tid;
    map['fid'] = fid;
    map['quote_from'] = quoteFrom;
    map['quote_to'] = quoteTo;
    map['titlefont'] = titlefont;
    map['topic_misc'] = topicMisc;
    map['author'] = author;
    map['authorid'] = authorid;
    map['subject'] = subject;
    map['type'] = type;
    map['postdate'] = postdate;
    map['lastpost'] = lastpost;
    map['lastposter'] = lastposter;
    map['replies'] = replies;
    map['lastmodify'] = lastmodify;
    map['recommend'] = recommend;
    map['tpcurl'] = tpcurl;
    return map;
  }
}
