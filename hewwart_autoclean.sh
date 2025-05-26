#!/bin/bash

echo "🛡️ HEWWART AVTOMATİK TƏHLÜKƏSİZLİK TƏMİZLƏYİCİ BAŞLADI..."

# 1. Zərərli cron sətirini təmizlə
echo "🧹 crontab içindəki zərərli sətirlər yoxlanılır..."
crontab -l 2>/dev/null | grep -v "ooWOWWJF\|defunct-kernel\|base64 -d\|/dev/null" > clean_cron.tmp
crontab clean_cron.tmp && rm clean_cron.tmp
echo "✅ Zərərli cron sətirləri silindi."

# 2. Şübhəli fayllar və qovluqlar
SUSPECTS=(
  "$HOME/.config/.wHtVmisP"
  "$HOME/.config/.wHtVmisP/ooWOWWJF"
  "$HOME/.bashrc"
  "$HOME/.profile"
)

# 3. Şübhəli fayllarda təhlükəli kod varsa təmizlənir
for file in "${SUSPECTS[@]}"; do
  if [ -f "$file" ]; then
    grep -q "ooWOWWJF\|defunct-kernel\|kworker\|/dev/shm" "$file" && {
      echo "⚠️ Zərərli kod tapıldı və təmizləndi: $file"
      sed -i '/ooWOWWJF\|defunct-kernel\|kworker\|\/dev\/shm/d' "$file"
    }
  fi
done

# 4. Zərərli qovluqları sil
rm -rf "$HOME/.config/.wHtVmisP"
echo "🗑️ Şübhəli qovluqlar silindi."

# 5. ClamAV yoxla və yenilə
if ! command -v clamscan &>/dev/null; then
  echo "🔧 ClamAV yüklənir..."
  sudo apt update && sudo apt install clamav -y
fi

echo "🔄 ClamAV virus bazası yenilənir..."
sudo freshclam

# 6. ClamAV ilə $HOME skanı
echo "🔍 ClamAV ilə ev qovluğu skan olunur..."
sudo clamscan -r $HOME > $HOME/clamav_autoscan_report.txt
echo "📄 Skan hesabatı saxlanıldı: $HOME/clamav_autoscan_report.txt"

echo "✅ HEWWART TƏMİZLƏMƏ ƏMƏLİYYATI BİTDİ."
