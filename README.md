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