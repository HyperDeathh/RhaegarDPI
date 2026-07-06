# RhaegarDPI

Created by **Yunus Emre Birben**

A lightweight Windows service wrapper to bypass Deep Packet Inspection (DPI) and censorship (e.g. Discord, Twitter/X, and other blocked websites) using a custom hosts blacklist and custom DNS routing.

*Read this in other languages: [Türkçe](#türkçe)*

---

## Features

- **Automated Windows Service**: Installs as a lightweight Windows service (`RhaegarDPI`) that starts automatically with Windows.
- **Custom Blacklist**: Pre-configured with popular blocked domains in Turkey (Discord, X/Twitter, xplay.gg, etc.).
- **DNS Redirection**: Routes DNS queries through a custom DNS resolver (`77.88.8.8` / Yandex DNS) on port `1253` to prevent DNS poisoning and spoofing by local ISPs.
- **Easy Management**: Clean and informative command-line scripts to install, uninstall, and verify the service status with administrator privilege checks.

---

## How to Install

1. Download or clone this repository to a folder on your local drive (e.g. `C:\RhaegarDPI`).
2. Right-click **`RhaegarDPI_install.cmd`** and select **Run as administrator**.
3. The script will:
   - Check for administrator privileges.
   - Detect your CPU architecture (`x86` or `x86_64`).
   - Clean up any legacy or duplicate service installations.
   - Register and configure the `RhaegarDPI` service to run automatically on startup.
   - Start the service and flush your system DNS cache.
   - Verify if the service is running correctly.

---

## How to Uninstall

1. Right-click **`RhaegarDPI_remove.cmd`** and select **Run as administrator**.
2. The script will stop the service, remove the registered Windows service, clean up legacy drivers/services (like `WinDivert`), and flush the DNS cache.

---

## Customizing Blocked Sites

You can customize which websites bypass DPI by editing **`custom-hosts.txt`** in the root directory:
1. Open `custom-hosts.txt` in a text editor (like Notepad).
2. Add the domain names you want to bypass (one domain per line). For example:
   ```text
   example.com
   subdomain.example.com
   ```
3. Save the file.
4. Restart the service by running **`RhaegarDPI_install.cmd`** as administrator again to apply the changes.

---

## Technical Details

The service registers the executable with the following arguments:
- `-5`: Standard GoodbyeDPI preset for TCP packet fragmentation and TLS Client Hello splitting.
- `--blacklist`: Points to your local `custom-hosts.txt`.
- `--dns-addr 77.88.8.8 --dns-port 1253`: Redirects IPv4 DNS queries to a secure Yandex DNS server to prevent local ISP censorship/poisoning.
- `--dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253`: Redirects IPv6 DNS queries.

---

## License & Credits

- This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)**. See the [LICENSE](file:///c:/Users/1bene/OneDrive/Documents/RhaegarDPI/LICENSE) file for the full text.
- Based on **[GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)** by ValdikSS (MIT License).
- Uses **[WinDivert](https://github.com/basil00/Divert)** packet capture library by basil00 (LGPLv3 License).

---

# Türkçe

**Yunus Emre Birben** tarafından geliştirilmiştir.

Türkiye'deki servis sağlayıcıların uyguladığı DPI (Derin Paket İnceleme) engellemelerini ve DNS zehirlemelerini aşmak için tasarlanmış, özel ana makine (hosts) listesi ve DNS yönlendirmesi kullanan hafif bir Windows servis paketidir.

## Özellikler
- **Otomatik Windows Servisi**: Arka planda sessizce çalışır, bilgisayar açıldığında otomatik olarak başlar.
- **Özel Engelli Listesi**: Türkiye'de erişim engeli bulunan yaygın platformlar (Discord, X/Twitter, vb.) önceden eklenmiştir.
- **Güvenli DNS Yönlendirme**: ISS tabanlı DNS zehirlemelerini engellemek için DNS isteklerini güvenli DNS sunucularına yönlendirir.
- **Kolay Kurulum/Kaldırma**: Yönetici yetkisi kontrolleri içeren, bilgilendirici ve kullanımı kolay CMD arayüzü.

## Nasıl Kurulur?
1. Dosyaları bilgisayarınızda sabit bir klasöre çıkarın (Örn: `C:\RhaegarDPI`).
2. **`RhaegarDPI_install.cmd`** dosyasına sağ tıklayıp **Yönetici olarak çalıştır** seçeneğini seçin.
3. Kurulum tamamlandığında servis otomatik olarak başlayacaktır.

## Nasıl Kaldırılır?
1. **`RhaegarDPI_remove.cmd`** dosyasına sağ tıklayıp **Yönetici olarak çalıştır** seçeneğini seçin.
2. Servis durdurulacak, silinecek ve sistemden temizlenecektir.

## Lisans ve Teşekkür

- Bu proje **GNU General Public License v3.0 (GPL-3.0)** ile lisanslanmıştır. Detaylar için [LICENSE](file:///c:/Users/1bene/OneDrive/Documents/RhaegarDPI/LICENSE) dosyasına göz atabilirsiniz.
- ValdikSS tarafından geliştirilen **[GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)** projesini temel alır (MIT Lisansı).
- basil00 tarafından geliştirilen **[WinDivert](https://github.com/basil00/Divert)** paket yakalama kütüphanesini kullanır (LGPLv3 Lisansı).

