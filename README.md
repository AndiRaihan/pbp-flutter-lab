# Tugas 7 PBP
Tugas ini diselesaikan oleh Andi Muhamad Dzaky Raihan, NPM 2106631412, kode Asdos FRA.

### 1.  Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
[Source](https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/)
* **_State_**: Informasi yang bisa dibaca secara sinkronus ketika _widget_ dibangun dan mungkin berubah selama masa hidup _widget_-nya. 
* **_Stateless Widget_**: Sebuah widget yang state-nya tidak bisa diganggu gugat setelah dibangun. _Widget_ ini _immutable_ ketika mereka dibangun dalam kata lain perubahan apapun pada variabel, icon, tombol, atau pengambilan data tidak akan mengubah _state app_-nya. Contoh dari _stateless widget_ adalah `Text`, `RaisedButton`, dan `IconButtons`
* **_Stateful Widget_**: Sebuah widget yang state-nya bisa diubah setelah dibangun. State dari widget ini mutable dan bisa diubah berkali-kali dalam waktu hidupnya. Artinya state dari aplikasi bisa berubah berkali-kali dengan sekumpulan variabel, input, dan data yang berbeda. Contoh dari _stateful widget_ adalah `CheckBox`, `RadioButton`, `Form`, dan `TextField`

| Stateful                                                                                                        | Stateless                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| dynamic widgets                                                                                                 | static widgets                                                                                                                            |
| di-update selama runtime berdasarkan action atau perubahan data yang dilakukan oleh user                        | tidak bergantung pada perubahan data atau perubahan behavior apapun                                                                       |
| memiliki internal state dan dapat di ¬re-render jika input data nya berubah atau saat state dari widget berubah | tidak memiliki state, akan di render sekali dan tidak akan di-update sendiri, tetapi hanya akan diperbarui saat data eksternalnya berubah |
| `CheckBox`, `RadioButton`, `Form`, dan `TextField`                                                              | `Text`, `RaisedButton`, dan `IconButtons`                                                                                                 |
### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `Text`: Sebuah widget yang menampilkan dan memberikan _styling_ pada text. Digunakan untuk menambilkan text ganjil/genap dan counter klik
2. `SizedBox`: Sebuah box dengan ukuran tertentu. Digunakan untuk memberikan spasi/padding di antara tombol
3. `Row`: Sebuah widget yang menampilkan anaknya secara horizontal. Widget ini digunakan untuk menampilkan tombol
4. `Flexible`: Sebuah widget yang mengendalikan bagaimana sebuah `Row`, `Column`, atau `Flex` _flexes_. Widget ini digunakan untuk membesarkan ukuran `SizedBox` sehingga memberikan spasi full antara 2 tombol increment dan decrement 
5. `FloatingActionButton`: Sebuah widget berupa _Floatin Action Button_ dengan desain _material_. Widget ini digunakan untuk membuat tombol increment dan decrement.

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` memberi tahu _framework_ Flutter bahwa sesuatu telah berubah pada _state_ ini, sehingga method `build` akan dijalankan ulang dan apa yang diperlihatkan mencerminkan nilai yang sudah diubah. Apabila kita membuah suatu _state_ tanpa memanggil `setState()` maka method `build` tidak akan dipanggil lagi sehingga tidak akan ada yang berubah. Variabel yang dapat terdampak dengan fungsi `setState()` pada tugas ini adalah `_text` dan `_counter`

### 4. Jelaskan perbedaan antara `const` dengan `final`
[source](https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart)
* `final` berarti _single-assignment_: Sebuah variabel atau field final harus memiliki inisiasi. Setelah diberikan nilai, sebuah variabel final tidak bisa diubah nilainya. Final memodifikasi variabel.
* `const` memiliki arti yang lebih complex di dalam Dart. `const` memodifikasi nilai. `Const` bisa digunakan ketika membuat sebuah _collections_, seperti `const [1,2,3]`, dan ketika membuat sebuah objek (Selain dari `new`) seperti `const Point(2,3)`. Di sini, `const` berarti seluruh _deep state_ dari objek bisa ditentukan seluruhnya pada _compile time_ dan objek itu bisa dibekukan serta seluruhnya _immutable_
    
    * Harus dibuat dari data yang bisa dikalkulasi saat waktu kompilasi. Sebuah objek `const` tidak memiliki akses ke apapun yang diperlukan untuk kalkulasi saat _runtime_. `1 + 2` valid tapi `new DateTime.now()` tidak
    * `Const` `deeply` dan `transitively` immutable. Jika ada field `final` menyimpan sebuah _collection_, _collection_ tersebut masih bisa _mutable_. Jika ada collection `const`, maka semua yang ada di dalamnya juga harus `const` secara rekursif
    * Const itu `canonicalized`. Konsep ini seperti _string interning_: Untuk sembarang nilai `const` yang diberikan, sebuah objek `const` tunggal akan diciptakan dan digunakan kembali tidak peduli seberapa banyak kali ekspresinya dievaluasi.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. **Membuat sebuah program Flutter baru dengan nama counter_7.**
    
    Menjalankan kode `flutter create counter_7`

2. **Mengubah tampilan program menjadi seperti berikut.**

    Mengubah isi dari field `floatingActionButton` menjadi
    ```dart
    floatingActionButton: Row (
        children: [
          const SizedBox(width: 32),
          if (_counter > 0) FloatingActionButton(
            onPressed: () {
              _decrementCounter();
              _setText();
            },
            backgroundColor: const Color(0xFF40C4FF),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const Flexible(fit: FlexFit.tight, child: SizedBox()),
          FloatingActionButton(
              onPressed: () {
          _incrementCounter();
          _setText();
          },
          backgroundColor: const Color(0xFF40C4FF), //
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

        ],
      )
    ```
    Isi dari method `_setText()` dan `_decrementCounter()` adalah sebagai berikut:
    
    ``` dart
    void _decrementCounter () {
        setState(() {
        if (_counter > 0) {
            _counter--;
        }
        });
    }

    void _setText () {
        setState(() {
        if (_counter % 2 != 0) {
            _text = const Text(
            "GANJIL",
            style: TextStyle(
                color: Colors.blue,
            ),
            );
        }
        else {
            _text = const Text(
            "GENAP",
            style: TextStyle(
                color: Colors.red,
            ),
            );
        }
        });
    }
    ```

    * Dapat kita lihat di dalam field `floatingActionButton` saya menggunakan row untuk meletakkan 2 button increment dan decrement. Untuk memberikan padding antara tombol, saya memanfaatkan `const Flexible(fit: FlexFit.tight, child: SizedBox())` agar kedua tombol mepet di ujung-ujung dan `const SizedBox(width: 32)` untuk memberikan spasi di sisi kiri tombol.
    * Untuk mengubah text dan counter jika tombol dipencet, saya membuat 3 fungsi yakni `_incrementCounter()` untuk increment counter, `_decrementCounter()` untuk decrement counter (hanya akan decrement jika `_counter` > 0), dan `_setText()` untuk mengatur tulisan ganjil/genap dan warnanya. Fungsi increment & decrement akan dipanggil oleh tombol yang namanya sesuai dan akan merubah state dari `_counter`. 
    
        Untuk Tulisan ganjil/genap, saya memanfaatkan sebuah variabel bernama `_text` yang berisikan objek dari `Text` yang ditampilkan di layar. Variabel `_text` akan diubah oleh method `_setText()` dan method ini akan dipanggil setiap tombol increment atau decrement diklik. Dengan demikian, text yang ditampilkan (ganjil/genap dan warnanya) akan sesuai dengan nilai dari counternya