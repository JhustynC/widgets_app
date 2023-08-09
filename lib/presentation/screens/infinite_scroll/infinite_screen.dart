import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = List<int>.generate(5, (index) => index);
  final scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextImages();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addFiveImages() {
    final lastID = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastID + e));
    if (!mounted) return;
    setState(() {});
  }

  Future loadNextImages() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    //todo: revisar si esta montado el componente / widget
    if (!mounted) return;
    setState(() {});
    moveScrollToBotton();
  }

  Future refreshImages() async {
    if (!mounted) return;

    isLoading = true;
    setState(() {});

    final end = imagesIds.last;
    await Future.delayed(const Duration(seconds: 2));
    imagesIds.clear();
    imagesIds.addAll(List.generate(5, (index) => index + end));
    isLoading = false;

    setState(() {});
  }

  void moveScrollToBotton() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: refreshImages,
          child: ListView.builder(
            controller: scrollController, //!IMPORTANTE ASIGNAR CONTROLADOR
            itemCount: imagesIds.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < imagesIds.length) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'));
              }
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
