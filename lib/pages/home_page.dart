import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:news_feed_app/utils/constants.dart';
import 'package:news_feed_app/widgets/bottom_nav_bar.dart';
import 'package:news_feed_app/widgets/category_picker.dart';
import 'package:news_feed_app/widgets/country_picker.dart';
import 'package:news_feed_app/widgets/default_app_bar.dart';
import 'package:news_feed_app/widgets/news_item_card.dart';
import 'package:news_feed_app/widgets/search_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> future;
  String? searchTerm;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 1;

  List<String> categoryItems = [
    "GENERAL",
    "BUSINESS",
    "ENTERTAINMENT",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
    "TECHNOLOGY",
  ];
  late String selectedCategory;

  List<String> countryItems = [
    "ALL",
    "ca",
    "ch",
    "eg",
    "fr",
    "gb",
    "gr",
    "ng",
    "sa",
    "ua",
    "us",
  ];
  final Map<String, String> countryNames = {
    'ALL': 'All Countries',
    'ca': 'Canada',
    'ch': 'Switzerland',
    'eg': 'Egypt',
    'fr': 'France',
    'gb': 'United Kingdom',
    'gr': 'Greece',
    'ng': 'Nigeria',
    'sa': 'Saudi Arabia',
    'ua': 'Ukraine',
    'us': 'United States',
  };
  late String selectedCountry;

  @override
  void initState() {
    selectedCategory = categoryItems[0];
    selectedCountry = countryItems[0];
    future = getNewsData();

    super.initState();
  }

  Future<List<Article>> getNewsData() async {
    NewsAPI newsAPI = NewsAPI(apiKey: "f932247b0b1341158e0b1826a86331ec");

    final countryParam =
        selectedCountry == "ALL" ? null : selectedCountry.toLowerCase();

    return await newsAPI.getTopHeadlines(
      country: countryParam,
      query: searchTerm,
      category: selectedCategory,
      pageSize: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isSearching
              ? SearchAppBar(
                controller: searchController,
                onCancel:
                    () => setState(() {
                      isSearching = false;
                      searchTerm = null;
                      searchController.clear();
                      future = getNewsData();
                    }),
                onSearch:
                    () => setState(() {
                      searchTerm = searchController.text;
                      future = getNewsData();
                    }),
              )
              : DefaultAppBar(
                onSearchTap:
                    () => setState(() {
                      isSearching = true;
                    }),
              ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTap:
            (index) => setState(() {
              selectedIndex = index;
              if (index == 0) {
                isSearching = true;
              } else {
                isSearching = false;
                selectedCategory = 'GENERAL';
                future = getNewsData();
              }
            }),
      ),
      body: SafeArea(
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: ListView.builder(
        //           itemCount: mockArticles.length,
        //           itemBuilder: (context, index) {
        //             final article = mockArticles[index];
        //             return NewsArticleCard(article: article);
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CountryPicker(
                countries: countryItems,
                selected: selectedCountry,
                countryNames: countryNames,
                onSelected:
                    (code) => setState(() {
                      selectedCountry = code;
                      future = getNewsData();
                    }),
              ),
              const SizedBox(height: 4),
              CategoryPicker(
                categories: categoryItems,
                selected: selectedCategory,
                onSelected:
                    (category) => setState(() {
                      selectedCategory = category;
                      future = getNewsData();
                    }),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error loading the news"),
                      );
                    }
                    final newsData = snapshot.data ?? [];
                    return newsData.isEmpty
                        ? const Center(child: Text("No news available"))
                        : ListView.builder(
                          itemBuilder:
                              (context, index) =>
                                  NewsItemCard(article: newsData[index]),
                          itemCount: newsData.length,
                        );
                  },
                  future: future,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
