# 🛡️ HEWWART LINUX SECURITY SCAN

Bu repo, Ubuntu sistemində şübhəli fəaliyyətləri və virusları aşkarlamaq üçün iki təhlükəsizlik skriptindən ibarətdir:

---

## 🔧 1. `secure-scan.sh` — Sadə və sürətli scan

### ✔️ Nə edir:
- Gizli `.config`, `.local` kimi qovluqlarda zərərli ELF faylları tapır
- `.bashrc` və `.profile` fayllarında zərərli kodu axtarır
- ClamAV antivirusu ilə `$HOME` qovluğunu yoxlayır

### ▶️ İstifadə:
```bash
chmod +x secure-scan.sh
./secure-scan.sh
```

---

## 🔍 2. `deep-secure-scan.sh` — Dərin sistem yoxlaması

### ✔️ Nə edir:
- `systemd` xidmətlərində şübhəli prosesləri tapır
- Sistem və istifadəçi `cron` tapşırıqlarını yoxlayır
- Gizli ELF faylları tapır və şəbəkə əlaqələrini izləyir
- ClamAV ilə sistem antivirus scan aparır

### ▶️ İstifadə:
```bash
chmod +x deep-secure-scan.sh
./deep-secure-scan.sh
```

### ⏰ Avtomatlaşdırmaq üçün (cron):
```bash
crontab -e
```

Əlavə et:
```bash
0 3 * * 0 /tam/yol/deep-secure-scan.sh >> /tam/yol/cron-scan.log 2>&1
```

---

## 📦 Fayllar:
- `secure-scan.sh`
- `deep-secure-scan.sh`
- `README.md`


# 📌 backdoor-scan.sh Quraşdırma və istifadə
Bu hissəni əsas skriptində məsələn, ClamAV yoxlamasından sonra və ya əvvəl əlavə edə bilərsən.

### ▶️ İstifadə:
```bash
chmod +x backdoor-scan.sh
./backdoor-scan.sh
```

İstəyə bağlı genişləndirmələr:
Rootkit yoxlaması üçün chkrootkit və ya rkhunter inteqrasiyası.

auditd istifadə edərək əmrlərin izlənməsi.

inotify ilə .bashrc, .ssh, .profile fayllarına dəyişiklik nəzarəti.

Əgər bu hissəni sənə ZIP şəklində, README ilə birlikdə verim istəyirsənsə, onu da hazırlayım. Davam edim?



# ☑️ İstifadə Qaydası:
Faylı yaradın:

nano hewwart_autoclean.sh
Yuxarıdakı kodu yapışdırın.

Yadda saxla və çıx (CTRL + O, sonra CTRL + X).

Fayla icazə ver:

chmod +x hewwart_autoclean.sh
İcra et:

./hewwart_autoclean.sh
İstəsən bu skripti systemd və ya cron vasitəsilə gündəlik olaraq avtomatik işə salmaq üçün də konfiqurasiya edə bilərəm. Deyin, onu da edək?