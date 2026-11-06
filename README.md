# UTS Pemrograman Mobile - CatAdopt

## 1. Nama Project dan Deskripsi Singkat
**Nama Project:** CatAdopt
**Deskripsi:** CatAdopt adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu proses adopsi kucing. Aplikasi ini mengambil data ras kucing dari REST API dan menyimpan data adopsi pengguna ke dalam database Supabase.

## 2. Nama, NIM, dan Kelas
- **Nama:** Ni Luh Meka Purwani
- **NIM:** 2415051089
- **Kelas:** PTI 5A

## 3. Daftar Fitur
- **Home/Dashboard**: Menampilkan banner promo dan daftar kucing.
- **List Cats (Catalog)**: Menampilkan data ras kucing dari API.
- **Detail Kucing**: Menampilkan info lengkap kucing dan tombol adopsi.
- **Form Add (Create)**: Form input untuk menyimpan data adopsi baru.
- **Form Edit (Update)**: Fitur untuk mengubah data adopsi.
- **Favorit (Read & Delete)**: Menampilkan daftar adopsi beserta fitur hapus dengan konfirmasi.
- **Profile**: Menampilkan identitas mahasiswa.
- **Responsive Layout**: Tampilan menyesuaikan ukuran layar (HP dan Tablet).

## 4. Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: Provider
- **HTTP Client**: package:http

## 5. REST API yang Digunakan
- **URL**: `https://catfact.ninja/breeds`
- **Metode**: GET (Mengambil data ras kucing berformat JSON)

## 6. Backend / Database yang Digunakan
- **Database**: Supabase (PostgreSQL)
- **Tabel**: `adoptions` (Memiliki field: `id`, `cat_name`, `breed`, `price`, `location`, `description`, `created_at`)

## 7. Struktur Arsitektur Aplikasi
Aplikasi ini menerapkan arsitektur berlapis (UI -> Provider -> Repository -> Service -> API/Database).
```text
lib/
 ├── models/        # Model data (cat.dart)
 ├── providers/     # State management (cat_provider.dart)
 ├── repositories/  # Penghubung logic (cat_repository.dart)
 ├── screens/       # Tampilan UI (home, list, detail, form, dll)
 ├── services/      # Request API & Supabase
 ├── widgets/       # Custom widget (cat_card, identity_header)
 └── main.dart      # Entry point
```
## 8. Screenshot Aplikasi
<img width="516" height="1082" alt="Screenshot 2026-11-06 115649" src="https://github.com/user-attachments/assets/17bdfda2-217d-4f15-b848-6a8413fe0b9f" />

## 9. Cara Menjalankan
1. `flutter pub get`
2. `flutter run`
