Untuk pergi ke Tugas 8 klik di [sini](#tugas-8-pbp)

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

# Tugas 8 PBP

### 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Misalkan navigation stack memiliki urutan sebagai berikut `a b c`. Setelah itu kita ingin routing lagi ke `d`. Berikut hasilnya jika menggunakan:
* Navigator.push --> Hasilnya adalah `a b c d` (Menambahkan route baru ke dalam stack)
* Navigator.pushReplacement --> Hasilnya adalah `a b d` (Menggantikan elemen paling atas dengan route baru)

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `Drawer`: Digunakan untuk memberikan akses ke berbagai tujuan dan fungsionalitas yang disajikan di aplikasi Anda
* `Form`: Berfungsi sebagai container form, yang membolehkan kita untuk mengumpulkan dan validasi berbagai field form 
* `Card`: Selembar _material_ yang digunakan untuk merepresentasikan suatu informasi terkait
* `ListView`: sekumpulan widget yang bisa di-_scroll_ dan disusun linear
* `TextFormField`: Sebuah form field yang mengandung text field, digunakan untuk input text
* `DropdownButtonFormField`: Sebuah form field yang mengandung DropdownButton. Digunakan untuk input menggunakan dropdown button
* `TextButton`: Suatu tombol yang bisa diberikan text


### 3. Sebutkan jenis-jenis event yang ada pada flutter
* `onChanged` : Akan muncul ketika widget mengalami perubahan
* `onPressed` : Akan muncul ketika sebuah button dipencet
* `onSaved`   : Akan muncul ketika suatu form disimpan
* `onTap`     : Akan muncul ketika suatu widget dipencet

### 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Pada dasarnya, flutter navigasi pada flutter menggunakan konsep _stack_. Halaman yang sedang dilihat oleh user berada di paling atas _stack_ navigasi. Ketika ingin mengganti halaman, maka navigator bisa merubah _top of stack_ dari _stack_ halamannya baik melalui push (menambah halaman baru di atas _stack_), pop (Menghapus halaman di _top of stack_), dan operasi-operasi lainnya.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

* Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya dan Menambahkan tiga tombol navigasi pada drawer/hamburger..

    Menambahkan kode berikut di awal file (seperti pada lab sebelumnya), untuk tombol navigasi tinggal tambahin ListTile lagi:
    ```dart
    drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
    ```
* Menambahkan halaman form
    * Menambahkan elemen input dengan tipe data String berupa judul budget. : Menambahkan text form field seperti berikut:
    ```dart
    TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO Implement onChanged dan onSaved
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
    ```
    *  Menambahkan elemen input dengan tipe data int berupa nominal budget.
    : Menambahkan text form field seperti berikut:
    ```dart
    TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Contoh: 15000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO Implement onChanged dan onSaved
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _nominal = int.parse(value!);
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (_isNumeric(value)) {
                          _nominal = int.parse(value!);
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      } else if (!_isNumeric(value)) {
                        return 'Nominal harus berupa angka valid (Harus bilangan bulat)';
                      }
                      return null;
                    },
                  ),
    ```
    * Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran.: Saya menambahkan DropdownButtonField, menggunakan placeholder, dan memberikan opsinya seperti berikut :
    ```dart
    ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      hint: const Text("Pilih Jenis"),
                      value: _jenisPemasukan,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _listPemasukan.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _jenisPemasukan = newValue!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahkan Pilih Jenis!';
                        }
                        return null;
                      },
                    ),
                  ),
    ```
    * Menambahkan button untuk menyimpan budget. : Untuk menyimpan budget, saya membuat sebuah class budget yang parameternya adalah imput-input dari field. Selain itu, class budget juga menyimpan atribut static yang menyimpan seluruh budget yang pernah dibuat. Berikut kode dari budget:
    ```dart
    class Budget {
        String judul;
        int nominal;
        String jenis;
        static List<Budget> budgets = [];

        Budget(String this.judul, int this.nominal, String this.jenis);
    }
    ```
    Berikut adalah kode dari button:
    ```dart
    TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Budget currentBudget =
                          Budget(_judul, _nominal, _jenisPemasukan!);
                      Budget.budgets.add(currentBudget);
                      _formKey.currentState?.reset();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            insetPadding: const EdgeInsets.all(10),
                            elevation: 15,
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: const <Widget>[
                                Center(
                                    child: Text('Budget Berhasil Ditambahkan')),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
    ```
* Menambahkan halaman data budget

    Untuk menampilkan data-data dari budget, saya memanfaatkan listview builder untuk looping dan memasukkan seluruh data dari budget. Berikut kodenya:
    ```dart
    ListView.builder(
            itemCount: Budget.budgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text Judul
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8, left: 15, right: 15, bottom: 8),
                      child: Text(
                        Budget.budgets[index].judul,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15, right: 15, bottom: 8),
                          child: Text(
                            Budget.budgets[index].nominal.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Flexible(fit: FlexFit.tight, child: SizedBox()),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15, right: 15, bottom: 8),
                          child: Text(
                            Budget.budgets[index].jenis,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    ```