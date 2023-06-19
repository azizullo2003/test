import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    // initialize controller
    _controller = ExpandedTileController(isExpanded: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings').tr(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'currencies',
              style: theme.textTheme.displaySmall,
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                //TODO: radio button for every item
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: Text(
                    'BTC',
                    style: theme.textTheme.titleLarge,
                  ),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: Text(
                    'LIGHTNING',
                    style: theme.textTheme.titleLarge,
                  ),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: const Text('BTC'),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: const Text('BTC'),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: const Text('BTC'),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ExpandedTile(
                  //TODO: export icon from figma
                  trailing: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.green,
                  ),
                  trailingRotation: 180,
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.transparent,
                    headerPadding: EdgeInsets.all(24.0),
                    contentPadding: EdgeInsets.all(24.0),
                    contentBackgroundColor: Colors.transparent,
                  ),
                  controller: _controller,
                  title: const Text('BTC'),
                  content: const Center(
                    child: Column(
                      children: [
                        Text('abc'),
                        Text('cba'),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
