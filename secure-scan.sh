#!/bin/bash

echo "🔒 HEWWART TƏHLÜKƏSİZLİK SKANİ BAŞLAYIR..."

# 1. Şübhəli fayl yolları
SUSPECT_PATHS=(
  "$HOME/.config/"
  "$HOME/.local/"
  "$HOME/.cache/"
  "$HOME/.bashrc"
  "$HOME/.profile"
)

# 2. Zərərli ELF faylları tap (UPX sıxılmış və ya header-siz)
echo "🔍 ELF faylları axtarılır..."
find "${SUSPECT_PATHS[@]}" -type f -exec file {} \; 2>/dev/null | grep "ELF" | grep -E "statically linked|no section header" | cut -d: -f1 > suspicious_elf.txt

# 3. Əgər fayl tapılıbsa
if [ -s suspicious_elf.txt ]; then
  echo "⚠️ TAPILDI: ZƏRƏRLİ FAYLLAR"
  cat suspicious_elf.txt

  echo "🧹 FAYLLAR SİLİNİR..."
  while read -r line; do
    echo "❌ Silinir: $line"
    rm -f "$line"
  done < suspicious_elf.txt
else
  echo "✅ Heç bir şübhəli ELF faylı tapılmadı."
fi

# 4. Bash startup fayllarında şübhəli kod axtar
echo "🔍 .bashrc və .profile içində zərərli kod axtarılır..."
grep -E "ooWOWWJF|\.config|kworker|/dev/shm" ~/.bashrc ~/.profile 2>/dev/null

# 5. Antivirus: clamav ilə skan (əvvəl quraşdırılmayıbsa quraşdır)
if ! command -v clamscan &> /dev/null; then
  echo "🛠️ ClamAV yüklənir..."
  sudo apt update && sudo apt install clamav -y
  sudo freshclam
fi

echo "🧪 ClamAV ilə sistem skanı başlanır..."
sudo clamscan -r $HOME > clamav_scan_report.txt

echo "📄 Skan nəticələri -> clamav_scan_report.txt faylında saxlanılıb."

echo "✅ TƏHLÜKƏSİZLİK SKANİ BİTDİ."
