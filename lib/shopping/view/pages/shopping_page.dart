import 'package:assessment/counter/counter.dart';
import 'package:assessment/l10n/l10n.dart';
import 'package:assessment/shared/constants.dart';
import 'package:assessment/shared/theme/colors.dart';
import 'package:assessment/shopping/view/widgets/custom_outlined_button.dart';
import 'package:assessment/shopping/view/widgets/gradient_text.dart';
import 'package:assessment/shopping/view/widgets/product_card.dart';
import 'package:assessment/shopping/view/widgets/story_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShoppingCubit(),
      child: const ShoppingView(),
    );
  }
}

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GradientText(
          l10n.shoppingAppBarTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          gradient: kDefaultGradient,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GradientOutlinedButton(
              text: 'Close',
              onPressed: () {
                // TODO(ogaroh): exit the app
              },
              icon: Icons.close,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(50), // height of the bottom container
          child: Container(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              right: 8,
            ),
            height: 60,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // open drawer
                  },
                  icon: const Icon(Icons.menu_rounded),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on_outlined),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Badge.count(
                        count: 3,
                        child: const Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // TODO(ogaroh): add side drawer
      drawer: const Drawer(),
      body: const ShoppingBody(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.monetization_on),
            icon: Icon(Icons.monetization_on_outlined),
            label: 'My Savings',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.list_alt),
            icon: Icon(Icons.list_alt_outlined),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'My Kwaju',
          ),
        ],
        currentIndex: currentIndex,
      ),
    );
  }
}

class ShoppingBody extends StatefulWidget {
  const ShoppingBody({super.key});

  @override
  State<ShoppingBody> createState() => _ShoppingBodyState();
}

class _ShoppingBodyState extends State<ShoppingBody> {
  String selected = options.first;
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final count = context.select((ShoppingCubit cubit) => cubit.state);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: CupertinoSearchTextField(
                    placeholder: 'Search for shopping items',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    gradient: kDefaultGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO(ogaroh): filters
                    },
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            child: Row(
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: kPrimaryColor),
                  onPressed: () {},
                  label: const GradientText(
                    'View All',
                    gradient: kDefaultGradient,
                  ),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map(
                      (category) => StoryWidget(
                        imageUrl: category['imageUrl']!.toString(),
                        title: category['title']!.toString(),
                        active: category['active']! as bool,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Container(
            // height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: kDefaultGradient,
            ),
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Products in Kitchen/Pantry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: kPrimaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: kPrimaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: options
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            label: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor:
                                e == options.first ? null : Colors.transparent,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: subcategories
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ActionChip(
                        label: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => setState(() {
                          selected = e;
                        }),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton.outlined(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton.outlined(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: brands
                    .map(
                      (link) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade500,
                          radius: 22,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(link),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 8,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Showing 250 items in ',
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: 'Yoghurts',
                    style: TextStyle(
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DynamicHeightGridView(
              itemCount: products.length,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              builder: (ctx, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
