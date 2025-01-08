import 'package:flutter/material.dart';

import '../../constant.dart';


class CustomTabbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CustomTabbar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabTitles = ["Activities", "Post"];

    return Container(
      color: Colors.grey.withOpacity(.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              tabTitles.length,
              (index) => GestureDetector(
                onTap: () => onTabChanged(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        tabTitles[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index
                              ? basicColor
                              : Colors.grey,
                        ),
                      ),
                      if (selectedIndex == index)
                        Container(
                          height: 3.0,
                          width: 55.0,
                          margin: const EdgeInsets.only(top: 5.0),
                          color: basicColor,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: "Arena",
              items: const [
                DropdownMenuItem(value: "Arena", child: Text("Arena")),
                DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
                DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
              ],
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
