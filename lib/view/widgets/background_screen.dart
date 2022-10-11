import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1559336197-ded8aaa244bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 14, 12, 12),
            ),
          )
        ],
      ),
    );
  }
}