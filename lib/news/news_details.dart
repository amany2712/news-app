import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
   static const String routeHome = '/news';
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as NewsItem;
    final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(item.news.source?.name ?? ''),
            
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: item.news.urlToImage ??
                      'https://t4.ftcdn.net/jpg/05/17/53/57/360_F_517535712_q7f9QC9X6TQxWi6xYZZbMmw5cnLMr279.jpg',
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported_outlined),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
               item.news.source?.name ?? '',
                style:
                    titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
              ),
              const SizedBox(
                height: 4,
              ),
             
                 Text(
                  item.news.title ?? '',
                  style: titleSmallStyle?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              
              const SizedBox(
                height: 2,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  timeago.format(DateTime.parse(item.news.publishedAt!)),
                  style:
                      titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Container(
                width: 383,
                height: 370,
                color: AppTheme.white,
                child: Column(
                  children: [
                        Text(item.news.description ?? "",
                         style: Theme.of(context).textTheme.titleSmall?.copyWith(
                           fontSize: 13,
                           fontWeight: FontWeight.w300
                           )
                        ),
                      
                    
                     const SizedBox(
                      height: 55,
                     ),
                 GestureDetector(
                  onTap: () {
                    final uri = Uri.parse(item.news.url ?? '');
                     launchUrl(uri);

                  },
                   
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children:[
                       Text("View Full Article",
                         style: Theme.of(context).textTheme.titleSmall?.copyWith(
                           fontSize: 14,
                           fontWeight: FontWeight.w400
                           ),
                         ),
                       const Icon(Icons.arrow_right),
                      ],
                   ),
                 ),

                  ],
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }

  
}
