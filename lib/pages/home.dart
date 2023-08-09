import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategory();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            const SizedBox(height: 40),
            _categoriesSection(),
            const SizedBox(height: 40),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Recommendation\nfor Diet",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 15),
                SizedBox(
                    height: 240,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      itemBuilder: (context, index) {
                        return Container(
                            width: 210,
                            decoration: BoxDecoration(
                                color: diets[index].boxColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(diets[index].iconPath),
                                Text(
                                  diets[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                                Text(
                                  diets[index].level +
                                      " | " +
                                      diets[index].duration +
                                      " | " +
                                      diets[index].calorie,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 45,
                                  width: 130,
                                  child: Center(
                                      child: Text("View",
                                          style: TextStyle(
                                              color: diets[index].viewIsSelected
                                                  ? Colors.white
                                                  : Color.fromARGB(
                                                      255, 255, 205, 222),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14))),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        diets[index].viewIsSelected
                                            ? const Color(0xFF9CCDF8)
                                            : Colors.transparent,
                                        diets[index].viewIsSelected
                                            ? Color.fromARGB(255, 205, 233, 255)
                                            : Colors.transparent
                                      ]),
                                      borderRadius: BorderRadius.circular(50)),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 25),
                      itemCount: diets.length,
                    ))
              ],
            )
          ],
        ));
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 120,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: ((context, index) {
                  return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: categories[index].boxColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    categories[index].iconPath),
                              )),
                          Text(categories[index].name,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14))
                        ],
                      ));
                })))
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 20,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search Pancake',
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 216, 216, 216)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
