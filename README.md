# Linux-Virus-Scanner

Aşağıda Ubuntu sisteminizdə şübhəli prosesləri aşkarlayan, zərərli ELF faylları tapan, və avtomatik təmizləyən sadə bir təhlükəsizlik bash skripti verilir.

🔧 İstifadə Qaydası:
Skripti fayla yaz:

nano secure-scan.sh
İçinə yuxarıdakı kodu yapışdır.

İcra edilə bilən et:

chmod +x secure-scan.sh
Skripti işə sal:

./secure-scan.sh


📌 Skript nə edir?
Gizli qovluqlarda zərərli ELF faylları tapır

UPX ilə sıxılmış, section header olmayan faylları aşkarlayır

.bashrc və .profile fayllarını təmizləyir

ClamAV antivirusu ilə tam scan aparır

İstəyirsənsə, əlavə olaraq sistemd xidmətlərini və ya cron tapşırıqlarını da yoxlayan versiyasını hazırlaya bilərəm. Yaz: cron və systemd versiyasını da ver.

# Əla, indi sənə cron və systemd vasitəsilə sistemdə zərərli kodların, backdoor-ların və avtomatik işləməyə qurulmuş zərərli skriptlərin axtarışını həyata keçirən təkmilləşdirilmiş skript təqdim edirəm.

📂 Skripti İstifadə Etmək üçün:
Faylı yarat:

nano deep-secure-scan.sh
İçinə skripti yapışdır.

İcra icazəsi ver:

chmod +x deep-secure-scan.sh
İşə sal:

./deep-secure-scan.sh
⏰ AVTOMAT İCRA (CRON İLƏ HƏFTƏLİK):
Skriptin tam yolunu tap:

realpath deep-secure-scan.sh
Məsələn: /home/geo-infosystem-app/deep-secure-scan.sh

Cron-a əlavə et:

crontab -e
Əlavə et:

0 3 * * 0 /home/geo-infosystem-app/deep-secure-scan.sh >> /home/geo-infosystem-app/cron-scan.log 2>&1
Bu, hər bazar günü saat 03:00-da skanı icra edəcək.

🧠 Qısaca Nə Edir?
Modul	Açıqlama
systemctl	Gizli və adından şübhəli xidmətləri yoxlayır
cron	Cron tapşırıqlarında zərərli skriptlər axtarır
ELF scan	Gizli yerlərdə potensial virus faylları axtarır
bashrc/profile	Quraşdırılmış backdoor izlərini tapır
lsof	İnternetə çıxan prosesi göstərir (mümkün C2 bağlantısı)
clamav	Fayl sistemini viruslara qarşı skan edir

Əgər istəsən, bu skripti .deb paketə və ya .service faylı şəklində daimi işləyən agent halına da gətirə bilərik. Yaz: agent kimi sistemə əlavə et.