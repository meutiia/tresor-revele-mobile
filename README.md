# Trésor Révélé Mobile
Meutia Fajriyah (2306165635)

<details>
<Summary><b>Tugas 7</b></Summary>

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
* Stateless widget adalah widget yang statis dan tidak berubah selama runtime, description dari widget ini diturunkan dari parent widgetnya. Saat mengconstruct stateless widget, kita hanya perlu defining final properties. Contohnya adalah `Icon` dan `Container`.
* Stateful widget, kebalikannya, merupakan widget yang dinamis dan dapat berubah selama runtime. Contohnya adalah `Switch` dan `Checkbox`.

Perbedaan antara kedua widget di atas adalah sifat immutability-nya. Stateless widget bersifat statis sedangkan stateful widget bersifat dinamis.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
* `Scaffold`: memberi struktur dasar halaman
* `AppBar`: memberi navbar di bagian atas
* `Column`: menyusun children widget (vertically)
* `Row`: menyusun children widget (horizontally)
* `Text`: menambahkan text
* `Card`: menambahkan card box
* `Container`: memberikan container padding/margin pada widget lain
* `GridView`: menyusun widget dalam grid
* `InkWell`: menambahkan efek animasi pada widget
* `Icon`: menambahkan icon (logo)
* `Center`: align center widget
* `Padding`: mengatur layout penempatan
* `SizedBox`: memberikan jarak tertentu

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` adalah function khusus di Flutter yang digunakan untuk merencanakan suatu update ke suatu state objek component, ketika suatu state berubah, komponen merespons dengan me-render ulang widget terkait. Variabel yang dapat terdampak dari penggunaan function `setState()` adalah semua variabel state yang berada di dalam stateful widget.

### 4. Jelaskan perbedaan antara const dengan final.
* `const`: merupakan variabel yang harus diinisiasi sebelum runtime dan tidak dapat diubah lagi setelahnya, benar-benar immutable
* `final`: merupakan variabel yang bisa diinisiasi saat runtime, tetapi nilainya tidak bisa diubah-ubah (immutable after stated)

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Instalasi Flutter
2. Membuat project Flutter baru dengan menjalankan `flutter create tresor_revele`
3. Setelah project muncul di directory, saya merapikan struktur proyek dengan melakukan sedikit perubahan pada file `main.dart` dan membuat file baru dengan nama `menu.dart` (merupakan *best practice* sesuai anjuran pada tutorial)
4. Kemudian, pada `menu.dart` saya mengubah class `MyHomePage` yang awalnya stateful menjadi stateless widget
5. Checklist selanjutnya adalah membuat 3 tombol sederhana untuk melihat product, menambahkan products, dan logout. Pertama, saya membuat class baru dengan nama `ItemHomePage` yang berisi attributes (name, icon, color) pada `menu.dart`
6. Lalu, di dalam class `MyHomePage` saya menambahkan `List<ItemHomepage>` yang berisi keterangan lebih lengkap mengenai text, icon, dan color dari masing-masing button yang ingin saya buat
7. Untuk memunculkan snackbar saat button ditekan, saya membuat class baru lagi dengan nama `ItemCard` untuk menampilkan button serta snackbar yang sesuai
8. Terakhir, saya mengintegrasikan widget-widget yang sudah dibuat pada `Widget build()` yang ada di dalam class `MyHomePage`
9. Selesai!

</details>

<details>
<Summary><b>Tugas 8</b></Summary>

### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` di Flutter digunakan untuk membuat object yang nilainya constant dan sudah diketahui saat compile time, keuntungan menggunakan `const` adalah:
* **performa lebih baik**, karena widget `const` sudah di-compile sebelumnya, Flutter tidak perlu rebuild setiap kali ada update pada widget tree
* **memori yang lebih efisien**, penggunaan memori lebih hemat karena data hanya dibuat sekali dan tidak berubah-ubah

<b>kapan menggunakan `const`?</b>
gunakan `const` untuk value yang dipastikan tidak akan berubah dan sudah memiliki nilai tetap sejak awal compile time (text atau icon static)

<b>kapan jangan menggunakan `const`?</b>
jangan gunakan `const` untuk value yang bisa jadi akan berubah saat aplikasi sedang running, contohnya adalah widget yang menerima input dan akan menampilkan inputnya langsung

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk menyusun widget vertically atau horizontally
* `Column`: Menyusun widget vertically dari atas ke bawah
* `Row`: Menyusun widget horizontally dari kiri ke kanan

Keduanya memiliki properti seperti `mainAxisAlignment` dan `crossAxisAlignment` untuk mengatur posisi child widgetnya

contoh implementasi `Column` pada `left_drawer.dart`:
```dart
child: const Column(
  children: [
    Text('Trésor Révélé'),
    Padding(padding: EdgeInsets.all(8)),
    Text("Step into our collections!"),
  ],
)
```
pada tugas ini saya belum mengimplement `Row` layout, tetapi untuk contoh implementasinya saya akan mengambil potongan code dari `menu.dart` Flutter app mental health tracker:
```dart
child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
        ]
)
```

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Semua elemen input yang digunakan pada `goodsentry_form.dart` adalah `TextFormField`, hal ini karena mengikuti models pada Django app yang sudah dikembangkan sebelumnya, saya hanya menggunakan tipe data `CharField`, `IntegerField`, dan `TextField`

elemen input Flutter yang tidak digunakan pada tugas ini:
* `Checkbox`: menyediakan pilihan input boolean
* `DropdownButtonFormField`: menyediakan beberapa opsi jawaban dalam bentuk drop down
* `Radio`: menyediakan beberapa opsi dalam bentuk radio
* `Switch`: pilihan melakukan on/off dalam bentuk switch
* `Slider`: menyediakan opsi memilih dalam range tertentu
* `DatePicker` atau `TimePicker`: menyediakan opsi memilih tanggal/jam

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Ya, aplikasi saya sudah mengimplement theme dengan mengubah pemilihan warna (primary dan secondary) pada `main.dart` seperti di potongan code ini:
```dart
return MaterialApp(
    title: 'Trésor Révélé',
    theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
    ).copyWith(secondary: Colors.brown[50]),
    useMaterial3: true,
    ),
    home: MyHomePage(),
);
```

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangangi navigasi dengan banyak halaman pada Flutter, saya menggunakan beberapa `Navigator` yaitu, `push()`, `pop()`, dan `pushReplacement()`
* `push()`: digunakan untuk membuka halaman baru, sama seperti fitur push pada stack yang menumpuk halaman baru ke atas tumpukan yang sudah ada
```dart
Navigator.push(context,
    MaterialPageRoute(builder: (context) => const GoodsEntryFormPage()));
```
* `pop()`: digunakan untuk menghapus route yang sedang ditampilkan dari stack route yang ada (metode back)
```dart
actions: [
    TextButton(
        child: const Text('OK'),
        onPressed: () {
            Navigator.pop(context);
            _formKey.currentState!.reset();
        },
    ),
],
```
* `pushReplacement()`: untuk mengarahkan ke halaman tertentu tanpa mengubah stack yang ada
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ));
```

</details>

<details>

<Summary><b>Tugas 9</b></Summary>

### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Model merupakan representasi data di sebuah aplikasi, saat kita melakukan pengambilan ataupun pengiriman data JSON, menggunakan model memungkinkan kita untuk memetakan data tersebut ke objek dengan atribut yang lebih mudah diakses dan dimodifikasi. Selain itu, model membuat kode lebih terorganisir dan membantu dalam melakukan validasi data (pengujian).
<br>
<br>
Jika kita **tidak membuat model** terlebih dahulu, memang tidak selalu akan terjadi error dalam aplikasi. Namun, data yang diolah akan dalam bentuk raw JSON (key-value) yang akan meningkatkan kompleksitas dalam pengolahan data dan meningkatkan adanya kemungkinan error.

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Fungsi dari library `http` yang diimplementasikan pada tugas ini adalah untuk mengirim HTTP request ke server Django, seperti:
* GET (mengambil data goods yang ada di Django)
```dart
Future<List<GoodsEntry>> fetchGoods(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json-by-user/');
    
    var data = response;
    
    List<GoodsEntry> listGoods = [];
    for (var d in data) {
      if (d != null) {
        listGoods.add(GoodsEntry.fromJson(d));
      }
    }
    return listGoods;
  }
```
* POST (menambahkan goods baru ke server)
```dart
final response = await request.postJson(
  "http://localhost:8000/create-flutter/",
    jsonEncode(<String, String>{
        'name': _name,
        'price': _price.toString(),
        'description': _description,
        'category': _category,
        'condition': _condition.toString(),
    }),
);
```
### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` digunakan untuk menyimpan user session dalam aplikasi, memungkinkan aplikasi mengingat dan mempertahankan status akun suatu user yang sudah terautentikasi, membuat sebuah akun tetap login selama sesi berjalan, `CookieRequest` perlu dibagikan ke semua komponen di Flutter untuk memastikan aplikasi konsisten dalam pengelolaan cookienya

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. user input data ke dalam aplikasi Flutter melalui UI (contoh: form)
2. data dikirim ke server menggunakan HTTP request (contoh: POST) melalui library `http`
3. server Django menerima data, mengolahnya (contoh: simpan ke database dan validasi input) lalu return respons JSON atau status code
4. Flutter menerima respons JSON, convert jadi model, dan menampilkan data tersebut di UI menggunakan widget yang telah disusun dengan rapih

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. user input data akun untuk login atau register pada Flutter
2. saat user `login`, flutter akan mengirim http request (POST) ke endpoint Django dengan data yang sesuai untuk divalidasi, dan jika sudah valid akan mereturn cookie dan memulai session
3. saat user `register`, data seperti username dan password akan dikirim ke server Django untuk memproses pembuatan akun baru dan jika berhasil maka user akan diarahkan untuk login di page Flutter
4. saat sudah `login`, Flutter menyimpan cookie atau token menggunakan `CookieRequest` untuk keperluan autentikasi selanjutnya dan user juga dapat mengakses data-data yang memerlukan autentikasi (contoh: goods yang terfilter per user logged in)
5. saat user `logout`, Flutter menghapus cookie dan mengakhiri session dengan melakukan request http (POST) ke server Django yang lalu mengarahkan user kembali ke login page di Flutter

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
#### setup Django
1. untuk menambahkan fitur registrasi dan login di Flutter yang terintegrasi dengan server Django, pertama saya melakukan startapp authentication dengan `python3 manage.py startapp authentication` dan menambahkan `authentication` ke INSTALLED_APPS yang ada di `settings.py`
2. lalu saya juga install library `django-cors-headers` dan menambahkannya ke INSTALLED_APPS dan requirements
3. pada `views.py` di app `authentication` saya menambahkan function untuk login, register, dan logout yang nantinya akan dipanggil pada program Flutter
4. saya juga menambahkan path menuju function-function tersebut di `urls.py` folder authentication dan root folder
5. pada root Flutter, saya juga menginstall package `provider` dan `pbp_django_auth` yang sudah disediakan dan menyesuaikan widget-widget yang sudah ada sebelumnya
#### implement login, register
6. untuk implement fitur login, saya membuat `login.dart` pada folder `screens` 
7. setelah itu kita mengubah widget awal yang ditampilkan oleh Flutter pada `main.dart` dari
```dart
return MaterialApp(
      ...
      home: MyHomePage(),
    );

// menjadi

return MaterialApp(
      ...
      home: const LoginPage(),
    );
```
8. sedangkan untuk fitur register, kurang lebih mirip seperti login, pertama saya membuat `register.dart` dan menambahkan button untuk menghubungkan page register dan login

#### membuat model kustom
9. selanjutnya adalah membuat model yang menyesuaikan dengan endpoint JSON `GoodsEntry` website Django, mengikuti arahan saat tutorial, saya memanfaatkan web Quicktype untuk membantu membuat model yang sesuai
10. kemudian hasil code yang didapat dari Quicktype saya paste pada `lib/models/goods_entry.dart` di program Flutter

#### membuat page goods catalogue
11. untuk menampilkan goods yang terdapat di endpoint JSON, pertama saya membuat `list_goodsentry.dart` pada folder `screens` dan import package-package yang dibutuhkan, pada page ini, masing-masing goods hanya menampilkan nama, harga, dan description
12. untuk dapat mengakses catalogue ini dari side bar dan home page, saya juga menambahkan pilihan catalogue pada `left_drawer.dart` (side bar) dan `goods_card.dart` (home page)

#### membuat page goods detail
13. selanjutnya adalah membuat page untuk melihat detail dari tiap goods yang ada pada catalogue, pertama saya membuat `goods_detail.dart` pada folder `screens`, page ini akan menampilkan semua atribut yang dimiliki oleh goods dan button untuk kembali ke catalogue
14. lalu saya sedikit mengubah catalogue agar card yang ditampilkan dapat diclick untuk mengarahkan ke page detail dengan menggunakan `builder: (context) => DetailItemPage`

#### filter pada halaman catalogue
15. untuk filter goods sesuai user yang sedang log in, saya menambahkan function `get_user_goods_json` pada `views.py` di main Django dan melakukan routing di `urls.py`
16. pada `list_goodsentry.dart` saya juga mengubah response menjadi `final response = await request.get('http://localhost:8000/json-by-user/');`, dengan ini goods yang ditampilkan hanya goods yang sesuai dengan user yang sedang log in

17. selesai!

</details>