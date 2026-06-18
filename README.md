# andalask8s - Kubernetes Server Distro

**andalask8s** adalah distribusi Linux server kustom berbasis **Debian Bookworm** (x86_64) yang dirancang khusus untuk menjalankan klaster Kubernetes dengan cepat dan efisien.

## Fitur Utama
- **Basis:** Debian 12 (Bookworm)
- **Arsitektur:** x86_64 / amd64
- **Runtime Kontainer:** Docker (pre-installed)
- **Kubernetes Tooling:** `kubeadm`, `kubelet`, `kubectl` (v1.30)
- **Optimasi:** Konfigurasi kernel (sysctl) untuk Kubernetes sudah disiapkan.

## Cara Menggunakan ISO
1. **Booting:** Masukkan media bootable (USB/ISO) ke server.
2. **Login:** Default login untuk live system adalah `user` tanpa password (atau `root`).
3. **Instalasi:** Gunakan installer Debian standar yang tersedia di menu boot.

## Inisialisasi Kubernetes Cluster
Setelah sistem terinstal, Anda dapat langsung menginisialisasi klaster:

```bash
# Inisialisasi Control Plane
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Setup Kubeconfig untuk user biasa
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Instal Network Plugin (contoh: Flannel)
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
```

## Struktur Proyek Build
- `config/package-lists/`: Daftar paket yang diinstal.
- `config/hooks/live/`: Skrip kustomisasi pasca-instalasi (Kubernetes setup, banner).
- `build_andalask8s.sh`: Skrip utama untuk memulai proses build.

## Cara Build Ulang
Jika Anda ingin memodifikasi dan mem-build ulang ISO ini:
```bash
sudo ./build_andalask8s.sh
```

---
*Dibuat untuk kemudahan deployment Kubernetes di lingkungan server.*
