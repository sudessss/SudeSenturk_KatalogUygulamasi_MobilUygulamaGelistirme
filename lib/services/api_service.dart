import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:katalog_uygulamasi/model/product_model.dart';

class ApiService {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception("Failed to load products.");
    }
  }
}
