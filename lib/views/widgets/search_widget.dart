import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
    required VoidCallback onSearch,
  })  : _searchController = searchController,
        _onSearch = onSearch;

  final TextEditingController _searchController;
  final VoidCallback _onSearch;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();
    widget._searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._searchController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: widget._searchController.text.trim().isNotEmpty
                ? Colors.blue
                : Colors.grey[400],
          ),
          onPressed: widget._searchController.text.trim().isNotEmpty
              ? () {
                  widget._onSearch();
                }
              : () {},
        ),
      ),
    );
  }
}
