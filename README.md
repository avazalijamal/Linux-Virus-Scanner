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
