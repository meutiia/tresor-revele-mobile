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