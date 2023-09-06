import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valuyuta_kursi/data/language_data.dart';
import 'package:valuyuta_kursi/domain/models/language_model.dart';
import 'package:valuyuta_kursi/screens/loading_screen.dart';
import '../core/apis.dart';
import '../core/service_locatoryt.dart';
import '../domain/models/money_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Valyuta> list = [];
  List<LanguageModel> language = [];
  bool isLoading = false;
  String flag1 = "us";
  String flag2 = "ru";
  String selected1 = "USA";
  String selected2 = "RUB";
  String convert = "";
  String rate1 = "0";
  String rate2 = "0";
  String editing1 = "";
  String editing2 = "";
  String price = "";
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() async {
    setState(() => isLoading = true);
    /// all data
    list = await repozitory.fetchData();
    /// sum
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.sizeOf(context).width;
    final y = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue.shade50,
        body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 40,),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Currency Converter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(31, 34, 97, 1)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            "Check live rates, set rate alerts, receive\nnotifications and more.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(128, 128, 128, 1)),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          margin:
                          const EdgeInsets.symmetric(horizontal: 25,),
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 0.38,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20,
                                vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /// #1
                                const Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(152, 152, 152, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        placeholderFadeInDuration: const Duration(
                                            milliseconds: 1000),
                                        placeholder: (context,
                                            url) => const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons.public, size: 40,),
                                        imageUrl: "${Apis.flagUrl}${flag1
                                            .substring(0, 2)
                                            .toLowerCase()}.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15,),

                                    /// text and icon
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(selected1, style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),),
                                        PopupMenuButton(
                                          icon: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 40, color: Colors.grey,),
                                          itemBuilder: (context) {
                                            return [
                                              for(int i = 0; i <
                                                  list.length; i++)
                                                PopupMenuItem(
                                                  child: Text(list[i].ccy,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontSize: 30),),
                                                  onTap: () {
                                                    selected1 = list[i].ccy;
                                                    flag1 = selected1;
                                                    rate1 = list[i].rate;
                                                    setState(() {});
                                                  },
                                                ),
                                            ];
                                          },
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    /// TextFild
                                    SizedBox(
                                      width: x * 0.33,
                                      child: TextField(
                                        controller: controller,
                                        onChanged: (value) {
                                          price = value;
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromRGBO(
                                              230, 230, 230, 1),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide.none
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(13)),
                                              borderSide: BorderSide.none
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Divider(
                                      color: Colors.grey.shade500,
                                      thickness: 1,
                                    ),
                                    Center(
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                38, 39, 141, 1),
                                          ),
                                          child: IconButton(
                                              onPressed: () {
                                                editing1 = selected1;
                                                selected1 = selected2;
                                                selected2 = editing1;
                                                editing2 = flag1;
                                                flag1 = flag2;
                                                flag2 = editing2;
                                                setState(() {});
                                              },
                                              alignment: Alignment.center,
                                              icon: const Icon(Icons.swap_vert,
                                                color: Colors.white,
                                                size: 35,)),
                                        )
                                    ),
                                  ],
                                ),

                                /// #2
                                const SizedBox(height: 20,),
                                const Text(
                                  "Converted Amount",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(152, 152, 152, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        placeholderFadeInDuration: const Duration(
                                            milliseconds: 500),
                                        placeholder: (context,
                                            url) => const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons.public, size: 40,),
                                        imageUrl: "${Apis.flagUrl}${flag2
                                            .substring(0, 2)
                                            .toLowerCase()}.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(selected2, style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),),
                                        PopupMenuButton(
                                          icon: const Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 40, color: Colors.grey),
                                          itemBuilder: (context) {
                                            return [
                                              for(int i = 0; i <
                                                  list.length; i++)
                                                PopupMenuItem(
                                                  child: Text(list[i].ccy,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontSize: 30),),
                                                  onTap: () {
                                                    selected2 = list[i].ccy;
                                                    flag2 = selected2;
                                                    rate2 = list[i].rate;
                                                    setState(() {});
                                                  },
                                                ),
                                            ];
                                          },
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    /// #TextFild
                                    SizedBox(
                                      width: x * 0.33,
                                      child: TextField(
                                        enabled: false,
                                        keyboardType: TextInputType.number,
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          hintText: (double.parse(
                                              controller.value.text.isNotEmpty
                                                  ? controller.value.text
                                                  : "0") *
                                              double.parse(rate1) /
                                              double.parse(rate2))
                                              .toString(),
                                          hintStyle: const TextStyle(
                                            color: Colors.black,),
                                          filled: true,
                                          fillColor: const Color.fromRGBO(
                                              230, 230, 230, 1),
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide.none
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(13)),
                                              borderSide: BorderSide.none
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// last result
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30,),
                              const Text("Indicative Exchange Rate",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(161, 161, 161, 1),),),
                              const SizedBox(height: 20,),
                              Text("1 $flag1 = ${(double.parse(
                                  controller.value.text.isNotEmpty
                                      ? controller.value.text
                                      : "0") *
                                  double.parse(rate1) /
                                  double.parse(rate2)).toString()}",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600,
                                ),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  await languageRepository.storeLanguage(
                                      LanguageModel(
                                          valyutaConvertor: English
                                              .currencyConverter,
                                          description: English.description,
                                          amount: English.amount,
                                          amountConvert: English
                                              .convertedAmount,
                                          valyutaRate: English.rate));
                                  setState(() {});
                                  getAllData();
                                },
                                child: const Text("ENG", style: TextStyle(
                                    fontSize: 20, color: Colors.red),),
                              ),
                              const SizedBox(width: 5,),
                              TextButton(
                                onPressed: () async {
                                  await languageRepository.storeLanguage(
                                    LanguageModel(
                                        valyutaConvertor: Russia
                                            .currencyConverter,
                                        description: Russia.description,
                                        amount: Russia.amount,
                                        amountConvert: Russia.convertedAmount,
                                        valyutaRate: Russia.rate),
                                  );
                                  setState(() {});
                                  getAllData();
                                },
                                child: const Text("RUS", style: TextStyle(
                                    fontSize: 20, color: Colors.blue),),
                              ),
                              const SizedBox(width: 5,),
                              TextButton(
                                onPressed: () async {
                                  await languageRepository.storeLanguage(
                                      LanguageModel(
                                          valyutaConvertor: Uzbek
                                              .currencyConverter,
                                          description: Uzbek.description,
                                          amount: Uzbek.amount,
                                          amountConvert: Uzbek.convertedAmount,
                                          valyutaRate: Uzbek.rate));
                                  setState(() {});
                                  getAllData();
                                },
                                child: const Text("UZB", style: TextStyle(
                                    fontSize: 20, color: Colors.black),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if(isLoading)const LoadingPage(),
                  ],
                ),
              ),
        ),
    );
  }
}
