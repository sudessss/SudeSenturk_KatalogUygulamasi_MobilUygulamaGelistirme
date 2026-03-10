![Flutter](https://img.shields.io/badge/Flutter-3.41-blue)
![Dart](https://img.shields.io/badge/Dart-3.11-blue)
![Platform](https://img.shields.io/badge/Platform-Android-green)
# 🚀 SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme

🔗 **Proje Repository:** [GitHub Linki](https://github.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme)

### 🛍️ Mini Katalog Uygulaması Hakkında
Bu uygulama, bir haftalık yoğunlaştırılmış Flutter eğitimi kapsamında geliştirilen; ürün listeleme, detay görüntüleme ve sepet simülasyonunu içeren modern bir mobil katalog prototipidir. Proje, Flutter'ın temel yapı taşlarını (Widget ağacı, Navigasyon, Model yapısı) profesyonel standartlarda pekiştirmek amacıyla inşa edilmiştir.

---

### 🖥️ Geliştirme Süreci ve Kazanımlar
* **Widget Mimarisi:** Stateless ve Stateful widget yapıları kullanılarak dinamik ve performanslı bir arayüz oluşturuldu.
* **Veri Yönetimi:** JSON formatındaki veriler Dart sınıflarına (Model) dönüştürülerek `ListView.builder` ve `GridView` ile asenkron şekilde listelendi.
* **Navigasyon:** Sayfalar arası veri aktarımı (Route Arguments) ve `Navigator` yapısı ile akıcı bir kullanıcı deneyimi sağlandı.
* **UI/UX Tasarımı:** Kullanıcı dostu bir alışveriş deneyimi için modern kart yapıları, gölgelendirmeler ve `Material 3` tasarım dili tercih edildi.

---

### 📸 Uygulama Ekran Görüntüleri
| Ana Sayfa & Keşfet | Ürün Detay Sayfası | Sepetim & Ödeme |
| :---: | :---: | :---: |
| ![Ana Sayfa](https://raw.githubusercontent.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme/main/screenshots/home_screen.jpg) | ![Detay Sayfası](https://raw.githubusercontent.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme/main/screenshots/detail_screen.jpg) | ![Sepet](https://raw.githubusercontent.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme/main/screenshots/cart_screen.jpg) |

> **Not:** Görsellerin görünmesi için `lib` klasörünün yanına bir `screenshots` klasörü açıp içine ekran görüntülerini ilgili isimlerle eklemeyi unutmayın.

---

### 🛠️ Kullanılan Teknolojiler & Özellikler
* **Framework:** Flutter 3.41.2 (Channel Stable)
* **Dart SDK:** Dart 3.11.0 DevTools:
* **DevTools:** 2.54.1
* **IDE:** Visual Studio Code / Android Studio
* **Test Ortamı:** Android Studio - Android Emulator (Pixel 9) 📱
* **Versiyon Kontrol:** Git & GitHub
* **UI Components:** GridView, Custom Card Widgets, BottomSheets, SnackBar
* **Navigation:** MaterialPageRoute & Navigator Pop/Push
* **Data Handling:** JSON Parsing & API Service Integration Simülasyonu
* **State Management:** State Management: Local state management using setState ✅

---

### 🔄 Kurulum ve Çalıştırma
Projeyi yerel ortamınızda ayağa kaldırmak için aşağıdaki adımları takip edebilirsiniz:

1. **Repoyu bilgisayarınıza indirin:**
   ```bash
   git clone [https://github.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme.git](https://github.com/sudessss/SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme.git)

2. **Proje dizinine girin:**
   ```bash
   cd SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme
   
3. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run

### 👨‍💻 Proje Künyesi

| Özellik | Detay |
| :--- | :--- |
| **Geliştirici** | Sude Şentürk |
| **Proje Adı** | SudeSenturk_KatalogUygulamasi_MobilUygulamaGelistirme |
| **Eğitim** | Flutter Mobil Uygulama Geliştirme Eğitimi |
| **Flutter Sürümü** | 3.41.2 (Stable) |
| **Durum** | ✅ Status: Completed Project |

---

### ℹ️ Hakkında (About)
Bu proje, modern mobil geliştirme standartlarını ve Flutter ekosistemini bizzat deneyimleyerek öğrenmek amacıyla geliştirilmiştir. Projenin mimari tasarımı, klasör yapısı optimizasyonu ve UI geliştirmeleri tamamen şahsım tarafından yürütülmüştür.

---

### 🌐 Kullanılan Veri Kaynakları
Bu proje kapsamında kullanılan aşağıdaki kaynaklar eğitim ve demo amaçlıdır. API kullanımı, veri modelleme ve listeleme mantığını öğretmek amacıyla entegre edilmiştir:

* 🖼️ **Banner Görseli:** [wantapi.com/assets/banner.png](https://wantapi.com/assets/banner.png)
* 📦 **Ürün Verileri (JSON):** [wantapi.com/products.php](https://wantapi.com/products.php)

---

### 📁 Proje Klasör Yapısı (Folder Structure)
Uygulama, sürdürülebilirlik ve kodun okunabilirliğini artırmak amacıyla modüler bir mimari ile inşa edilmiştir:

```text
katalog_uygulamasi/
├── android/                        # Android platformuna özgü yerel yapılandırmalar
├── ios/                            # iOS platformuna özgü yerel yapılandırmalar
├── lib/                            # Uygulamanın ana kaynak kodları
│   ├── components/                 # Tekrar kullanılabilir arayüz bileşenleri (UI Components)
│   │   └── product_card.dart       # Ürünlerin grid listesinde gösterildiği kart tasarımı
│   ├── model/                      # Veri modelleri ve JSON mapping işlemleri
│   │   └── product_model.dart      # Ürün (Product) nesnesinin veri yapısı ve constructor'ı
│   ├── services/                   # Veri çekme ve dış kaynak yönetimi
│   │   └── api_service.dart        # API simülasyonu ve veri getirme (fetch) mantığı
│   ├── views/                      # Uygulamanın ana ekranları (Screens)
│   │   ├── cart_screen.dart        # Sepet içeriği ve toplam tutarın yönetildiği ekran
│   │   ├── home_screen.dart        # Ana sayfa: Banner ve ürün listeleme görünümü
│   │   └── product_detail_screen.dart # Ürün detayları ve "Sepete Ekle" işlevselliği
│   └── main.dart                   # Uygulama giriş noktası, tema ve route tanımları
├── assets/                         # Uygulama tanıtım materyalleri
│   ├── images/                     # Banner ve ürün görselleri
│   └── data/                       # (Opsiyonel) Yerel veri simülasyonu için JSON dosyaları
├── linux/                          # Linux masaüstü desteği dosyaları
├── macos/                          # macOS masaüstü desteği dosyaları
├── web/                            # Web platformu için gerekli dosyalar
├── windows/                        # Windows masaüstü desteği dosyaları
├── test/                           # Birim (Unit) ve Widget testleri
├── pubspec.yaml                    # Paket bağımlılıkları ve varlık (asset) yönetimi
└── README.md                       # Proje teknik dokümantasyonu
