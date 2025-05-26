echo "🔐 BACKDOOR YOXLANIŞI BAŞLAYIR..."

# 1. Şübhəli portlara qulaq asan prosesləri tap (örn. reverse shell backdoorlar)
echo "🔍 Şübhəli portları dinləyən proseslər:"
sudo netstat -tunlp 2>/dev/null | grep -v "127.0.0.1" | grep -v "::1"

# 2. .ssh içində qeyri-adi açar faylları tap (hücumçunun public key-i əlavə edilmiş ola bilər)
echo "🔍 ~/.ssh içində şübhəli açar faylları:"
find ~/.ssh -type f \( -name "authorized_keys" -o -name "*.pub" \) -exec cat {} \; 2>/dev/null

# 3. "nohup", "nc", "curl", "wget", "python -m http.server" ilə işləyən background proseslər (backdoor əlamətləri)
echo "🔍 Şübhəli proseslər:"
ps aux | grep -E "nc|nohup|curl|wget|socat|python.*http\.server" | grep -v grep

# 4. /tmp və /dev/shm qovluqlarında şübhəli fayllar (tez-tez backdoorlar burada gizlənir)
echo "🔍 /tmp və /dev/shm içindəki icraolunan fayllar:"
find /tmp /dev/shm -type f -executable 2>/dev/null

echo "✅ BACKDOOR YOXLANIŞI BİTDİ."
