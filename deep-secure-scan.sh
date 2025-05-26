#!/bin/bash

echo "🔒 HEWWART DEEP TƏHLÜKƏSİZLİK SKAN BAŞLAYIR..."
DATE=$(date +%F_%T)
LOG="scan_log_$DATE.txt"
touch "$LOG"

# 1. Şübhəli systemd xidmətləri (adətən maskalanmış və ya gizlədilmiş)
echo -e "\n🔍 systemd xidmətləri skan edilir..." | tee -a "$LOG"
systemctl list-units --type=service --all | grep -E '\.config|\.cache|ooWOWWJF|kworker|/tmp|shm' | tee -a "$LOG"

# 2. Cron tapşırıqları — sistem və istifadəçi səviyyəsində
echo -e "\n🔍 Cron tapşırıqları axtarılır..." | tee -a "$LOG"
echo -e "\n[Sistem cron tapşırıqları: /etc/crontab]" | tee -a "$LOG"
cat /etc/crontab | tee -a "$LOG"

echo -e "\n[/etc/cron.* qovluqları]" | tee -a "$LOG"
ls -al /etc/cron.* | tee -a "$LOG"

echo -e "\n[İstifadəçi cron (crontab -l)]" | tee -a "$LOG"
crontab -l 2>/dev/null | tee -a "$LOG"

# 3. Gizli ELF fayllar (öncəki kimi)
echo -e "\n🔍 Gizli ELF fayllar skan edilir..." | tee -a "$LOG"
find ~/.config ~/.local ~/.cache -type f -exec file {} \; 2>/dev/null | grep ELF | tee -a "$LOG"

# 4. .bashrc və .profile daxilində backdoor izləri
echo -e "\n🔍 .bashrc və .profile daxilində zərərli kod axtarılır..." | tee -a "$LOG"
grep -E "ooWOWWJF|\.config|/dev/shm|kworker" ~/.bashrc ~/.profile 2>/dev/null | tee -a "$LOG"

# 5. Aktif əlaqə yaradan proseslər
echo -e "\n🔍 Şəbəkəyə çıxan proseslər (ESTABLISHED)" | tee -a "$LOG"
sudo lsof -i -nP | grep ESTABLISHED | tee -a "$LOG"

# 6. ClamAV ilə skan
if ! command -v clamscan &> /dev/null; then
  echo "🛠️ ClamAV quraşdırılır..." | tee -a "$LOG"
  sudo apt update && sudo apt install clamav -y
  sudo freshclam
fi
echo -e "\n🧪 ClamAV ilə virus skanı (Home qovluğu)..." | tee -a "$LOG"
sudo clamscan -r $HOME | tee -a "$LOG"

echo -e "\n✅ SKAN TAMAMLANDI. Gündəlik faylı: $LOG"
