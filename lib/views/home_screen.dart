import 'package:flutter/material.dart';
import 'package:katalog_uygulamasi/model/product_model.dart';
import 'package:katalog_uygulamasi/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  String errorMesagge = "";
  List<Data> allProducts = [];
  ApiService apiService = ApiService();

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      ProductModel resData = await apiService.fetchProducts();
      setState(() {
        allProducts = resData.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMesagge = "Failed to load products.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 32,
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),

              SizedBox(height: 8),

              Text(
                "Find your prefect device.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search products",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://wantapi.com/assets/banner.png",
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              SizedBox(height: 16),

              if (isLoading)
                Center(child: CircularProgressIndicator())
              else if (errorMesagge != "")
                Center(child: Text(errorMesagge))
              else
                Expanded(
                  child: GridView.builder(
                    itemCount: allProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = allProducts[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(product.image ?? ""),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 1),
                                  Text(
                                    product.tagline ?? "",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  SizedBox(height: 1),

                                  Text(
                                    product.price ?? "N/A",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
