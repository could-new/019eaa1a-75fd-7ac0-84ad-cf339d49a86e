# NalaNeo Loadstring

NalaNeo Loadstring adalah aplikasi pembuat (generator) Loadstring untuk membantu mengonversi skrip ke dalam format eksekusi game. Aplikasi ini memiliki fitur pembuatan URL raw kustom secara instan yang memudahkan pembuatan skrip executor.

## Fitur Utama
- **Loadstring Generator**: Memasukkan skrip dan mengubahnya menjadi kode Loadstring yang siap digunakan.
- **Custom Script Name**: Menambahkan nama kustom ke URL raw Anda.
- **Copy to Clipboard**: Menyalin hasil Loadstring dengan satu klik.
- **Splash Screen**: Tampilan loading (splash) yang keren sebelum masuk ke menu utama.
- **Tentang Developer**: Integrasi langsung dengan link Traktir Kopi (SociaBuzz) dan TikTok (NalaNeo_Official).

## Cara Penggunaan
1. Buka aplikasi dan tunggu proses Splash Screen selesai.
2. Di halaman utama ("Loadstring Make"), isi kolom skrip dengan teks/skrip yang Anda inginkan.
3. Masukkan "Custom Name" (misal: ScriptKeren).
4. Klik tombol "Generate Loadstring".
5. Hasilnya akan berbentuk `loadstring(game:HttpGet("https://NalaNeo/ScriptKeren/Raw.com"))()`
6. Klik ikon Salin untuk meng-copy hasilnya.

## Tentang Developer
Dibuat oleh NalaNeo. Dukung pengembangan aplikasi ini melalui:
- [Traktir Kopi (SociaBuzz)](https://sociabuzz.com/nalaneo_official/tribe)
- [TikTok @nalaneo_official](https://www.tiktok.com/@nalaneo_official)

## Persyaratan (Tech Stack)
- Flutter SDK ^3.7.2
- `url_launcher`: Untuk membuka tautan luar (TikTok, SociaBuzz).
- `font_awesome_flutter`: Ikon TikTok dan ikon tambahan lainnya.

---
## Tentang CouldAI
Aplikasi ini dibuat menggunakan [CouldAI](https://could.ai), pembuat aplikasi AI untuk aplikasi lintas platform yang mengubah prompt menjadi aplikasi native iOS, Android, Web, dan Desktop nyata dengan agen AI otonom yang merancang, membangun, menguji, men-deploy, dan mengulangi aplikasi siap produksi.
