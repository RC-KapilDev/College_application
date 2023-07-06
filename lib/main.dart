import 'package:flutter/material.dart';
import 'appwidgets/navigation_drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'constants/constants.dart';
import 'appwidgets/Reuseable_card.dart';
import 'appwidgets/Subject_list.dart';
import 'appwidgets/HomePageItemCard.dart';
import 'appwidgets/BottomappBar.dart';
import 'pages/subject.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const HomePage());
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SubjectsList> subjectlist = [];

  void addSubject() {
    subjectlist.add(SubjectsList(
        color: Colors.redAccent, subname: 'python', percentage: '70'));

    subjectlist.add(SubjectsList(
        color: Colors.redAccent,
        subname: 'Software Engineering',
        percentage: '73'));

    subjectlist.add(
        SubjectsList(color: Colors.green, subname: 'PHP', percentage: '90'));

    subjectlist.add(
        SubjectsList(color: Colors.green, subname: 'C++', percentage: '90'));

    subjectlist.add(
        SubjectsList(color: Colors.green, subname: 'Java', percentage: '90'));
  }

  @override
  void initState() {
    addSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        endDrawer: const NavigationDrawerWidget(),
        backgroundColor: const Color(0xFF0A0E21),
        body: Builder(builder: (context) {
          return SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[
                    const Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                      ),
                    ),
                    const Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          'Welcome Back, Name',
                          style: TextStyle(
                            fontFamily: 'Noto Serif',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: const Icon(Icons.menu)),
                    ),
                  ]),
                ),
                Expanded(
                  flex: 3,
                  child: Reusablecard(
                    color: const Color(0xFF1D1E33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text('Overall Attedence',
                                        style: kheadingprogress)),
                              ),
                              Expanded(
                                flex: 4,
                                child: CircularPercentIndicator(
                                  radius: 70.0,
                                  lineWidth: 20.0,
                                  percent: 0.75,
                                  center: const Text(
                                    "75%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  progressColor: Colors.tealAccent,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Subjects',
                                  style: kheadingprogress,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 7.0, bottom: 10.0),
                                  child: ListView.builder(
                                      itemCount: subjectlist.length,
                                      addRepaintBoundaries: true,
                                      itemBuilder: (context, int index) {
                                        SubjectsList subject_list =
                                            subjectlist[index];

                                        return Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                  left: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.7,
                                                  ),
                                                  top: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0,
                                                  )),
                                            ),
                                            child: ListTile(
                                              leading: Text(
                                                '${subject_list.percentage}%  ${subject_list.subname}',
                                                style: kheadingprogress
                                                    .copyWith(fontSize: 13),
                                              ),
                                              trailing: Container(
                                                height: 10,
                                                width: 10,
                                                color: subject_list.color,
                                              ),
                                            ));
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Reusablecard(
                    color: Color(0xFF1D1E33),
                    child: HomePageItemsCard(
                      iconData: Icons.grade_outlined,
                      name: 'Semester Results',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    color: const Color(0xFF1D1E33),
                    child: HomePageItemsCard(
                      iconData: Icons.calculate_outlined,
                      name: 'GPA Calculator',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalculatorPage1()));
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Reusablecard(
                      color: Color(0xFF1D1E33),
                      child: HomePageItemsCard(
                        iconData: Icons.calendar_today_outlined,
                        name: 'College Calendar',
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Reusablecard(
                    color: const Color(0xFF1D1E33),
                    child: HomePageItemsCard(
                      iconData: Icons.search,
                      name: 'Lost Item',
                      ontap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BottomappBar(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
