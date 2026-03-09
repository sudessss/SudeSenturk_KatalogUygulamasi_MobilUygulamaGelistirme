import 'package:flutter/material.dart';
import 'package:katalog_uygulamasi/components/product_card.dart';
import 'package:katalog_uygulamasi/model/product_model.dart';
import 'package:katalog_uygulamasi/services/api_service.dart';
import 'package:katalog_uygulamasi/views/cart_screen.dart';
import 'package:katalog_uygulamasi/views/product_detail_screen.dart';

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
  final Set<int> cartIds = {};
  String searchQuery = "";

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  Future<void> loadProducts() async {
    try {
      setState(() => isLoading = true);
      ProductModel resData = await apiService.fetchProducts();
      setState(() => allProducts = resData.data ?? []);
    } catch (e) {
      setState(() => errorMesagge = "Failed to load products.");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = allProducts.where((product) {
      final name = product.name ?? "";
      return name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Üst Kısım: Başlık ve Sepet
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        "Find your perfect device.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // Sepet İkonu Bölümü
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          onPressed: () => _navigateToCart(),
                          icon: const Icon(Icons.shopping_bag_outlined),
                          iconSize: 38,
                          color: Colors.black,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        if (cartIds.isNotEmpty)
                          Positioned(
                            right: 3,
                            top: 20,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 22,
                                minHeight: 22,
                              ),
                              child: Text(
                                '${cartIds.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => setState(() => searchQuery = value),
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    hintText: "Search your favorite items...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 28,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                    ), // Yükseklik buradan ayarlandı
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Promosyon Bannerı
              Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://wantapi.com/assets/banner.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Ürün Listesi
              Expanded(child: _buildProductContent(filteredProducts)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductContent(List<Data> products) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black),
      );
    }
    if (errorMesagge.isNotEmpty) {
      return Center(child: Text(errorMesagge));
    }
    if (products.isEmpty) {
      return const Center(
        child: Text(
          "No products found.",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75, // Kartların boyunu biraz daha dengeli yaptım
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(product: product, cartIds: cartIds),
              ),
            ).then(
              (_) => setState(() {}),
            ); // Geri dönüldüğünde sepet sayısını güncellemek için
          },
          child: ProductCard(product: product),
        );
      },
    );
  }

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CartScreen(products: allProducts, cartIds: cartIds),
      ),
    ).then(
      (_) => setState(() {}),
    ); // Sepetten ürün silinirse ana ekrandaki sayıyı güncellemek için
  }
}
