import 'package:flutter/material.dart';
import 'package:stage0_task/utils/constants.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: 'Search Country',
                prefixIcon: Icon(Icons.search, color: AppColors.textLightMode),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: Containerstyle(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.public),
                        Text("EN"),
                      ],
                    ),
                  ),
                  Container(
                    decoration: Containerstyle(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt),
                        Text("Filter"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }

  BoxDecoration Containerstyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      border: Border.all(
        width: 0.25,
        color: AppColors.containerBorders, // Ensure this is a valid color
      ),
      boxShadow: [
        BoxShadow(
          color: Color(
              0x1018280D), // #1018280D is the equivalent color with transparency
          blurRadius: 2.0, // Matches the 2px blur from the CSS
          offset: Offset(0, 1), // Horizontal (0px) and vertical (1px) shadow
        ),
      ],
    );
  }
}
