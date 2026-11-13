
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/social_network.dart';
import '../routes.dart';
import 'detail_page.dart';
import 'home/bloc/home_bloc.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'СОЦИАЛЬНЫЕ СЕТИ',
          style: TextStyle(fontFamily: 'RobotoSlab'),
        ),
        backgroundColor: Colors.green,
      ),

      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state) {
            case HomeInitial():
              return const Center(
                child: Text('Данные ещё не загружены'),
              );

            case HomeLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case HomeLoaded(:final socialNetworks):
              return _buildHomeContent(socialNetworks);

            case HomeError(:final message):
              return Center(
                child: Text(message),
              );
          }
        },
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(
              context,
              Routes.profile,
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent(List<SocialNetwork> socialNetworks) {
    final bool isWideScreen =
        MediaQuery.sizeOf(context).width > 600;

    final double verticalSpacing = isWideScreen ? 45 : 25;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Text(
                'Социальные сети',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Text(
                'Социальные сети — это интернет-платформы '
                    'для общения пользователей, обмена сообщениями, '
                    'фотографиями, видео и другой информацией.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),

            SizedBox(height: verticalSpacing),

            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: socialNetworks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        socialNetworks[index].imagePath,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: verticalSpacing),

            LayoutBuilder(
              builder: (context, constraints) {
                final bool isWide = constraints.maxWidth > 600;

                if (isWide) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 100,
                    ),
                    itemCount: socialNetworks.length,
                    itemBuilder: (context, index) {
                      return _buildSocialNetworkCard(
                        socialNetworks[index],
                      );
                    },
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: socialNetworks.length,
                  itemBuilder: (context, index) {
                    return _buildSocialNetworkCard(
                      socialNetworks[index],
                    );
                  },
                );
              },
            ),

            SizedBox(height: verticalSpacing),

            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: const Text(
                      'Трисветов Ричард Вунгович\n'
                          'Группа ИКБО-63-23',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialNetworkCard(SocialNetwork network) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.public),
        title: Text(network.title),
        subtitle: Text(network.description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                title: network.title,
                description: network.description,
                imagePath: network.imagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}
