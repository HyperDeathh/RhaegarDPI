# RhaegarDPI

Created by **Yunus Emre Birben**

A lightweight Windows service wrapper to bypass Deep Packet Inspection (DPI) and censorship (e.g. Discord, Twitter/X, and other blocked websites) using a custom hosts blacklist and custom DNS routing.

> [!TIP]
> **Gaming-Friendly & Bypasses Discord Censorship!**
> Standard DPI circumvention tools or VPNs intercept all network traffic, which frequently breaks connections, causes high latency, or gets you kicked (connection errors) from online multiplayer games like **PUBG**, **Valorant**, and **League of Legends**.
> **RhaegarDPI** uses a targeted domain filtering system (`--blacklist`) and secure DNS redirection. This successfully restores complete access to Discord (including voice channels) while **preventing any connection issues or ping spikes in online games like PUBG.**

*Read this in other languages: [Türkçe](#türkçe)*

---

## Features

- **Unblocks Discord & Twitter (X)**: Fully restores access including voice channels and media servers.
- **Gaming-Friendly (No PUBG Connection Issues)**: Only targets blocked domains listed in `custom-hosts.txt`. Game network traffic is left completely untouched.
- **Automated Windows Service**: Installs as a lightweight Windows service (`RhaegarDPI`) that starts automatically with Windows.
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

> [!TIP]
> **Oyun Dostu ve Discord Engelini Kaldıran Çözüm!**
> Standart DPI aşma araçları veya VPN'ler tüm internet trafiğinizi manipüle ettiği için **PUBG**, **Valorant**, **League of Legends** gibi çevrimiçi oyunlarda bağlantı kopması, yüksek ping veya sunucudan atılma (connection error) sorunlarına yol açar.
> **RhaegarDPI**, sadece belirlenen engelli siteleri hedef alan filtreleme sistemi (`--blacklist`) ve özel DNS yönlendirmesi sayesinde **Discord ses kanalları dahil tüm engelleri kaldırırken, PUBG gibi oyunlarda kesinlikle bağlantı veya ping sorunu yaşatmaz.**

## Özellikler
- **Discord & X (Twitter) Engelini Aşar**: Ses kanalları (voice chat) ve medya sunucuları dahil olmak üzere kesintisiz erişim sağlar.
- **Oyunlarda Sıfır Sorun (PUBG Dostu)**: Sadece `custom-hosts.txt` içindeki engelli sitelere müdahale edilir; oyun trafiğinize dokunulmaz.
- **Otomatik Windows Servisi**: Arka planda sessizce çalışır, bilgisayar açıldığında otomatik olarak başlar.
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

- Bu proje **GNU General Public License v3.0 (GPL-3.0)** ile lisanslanmıştır. Detaylar için [LICENSE](https://github.com/HyperDeathh/RhaegarDPI/blob/main/LICENSE) dosyasına göz atabilirsiniz.
- ValdikSS tarafından geliştirilen **[GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)** projesini temel alır (MIT).
- basil00 tarafından geliştirilen **[WinDivert](https://github.com/basil00/Divert)** paket yakalama kütüphanesini kullanır (LGPLv3).

