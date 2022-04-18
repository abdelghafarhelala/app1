import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/shared/colors.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${getLang(context, 'services')}'),
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildServiceItem2(context),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
            itemCount: 10));
  }

  Widget buildServiceItem(context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/flat-customer-support-illustration_23-2148899114.jpg?t=st=1650286763~exp=1650287363~hmac=244f771ec1effc2b72dfd83c519903aef8bc743141ef3cd98d795f7029171852&w=740',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: Theme.of(context).textTheme.caption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildServiceItem2(context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.network(
                  'https://img.freepik.com/free-vector/flat-customer-support-illustration_23-2148899114.jpg?t=st=1650286763~exp=1650287363~hmac=244f771ec1effc2b72dfd83c519903aef8bc743141ef3cd98d795f7029171852&w=740',
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Title of service',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
