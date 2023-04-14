<template>
    <Header />
    <!-- ======= Layanan Section ======= -->
    <section id="layanan" class="layanan">
        <div class="l-container">
            <h2>Layanan <b>E-COOP<span>.</span></b></h2>
        </div>
    </section>

    <main id="main">
        <!-- ======= List Section ======= -->
        <section id="list" class="list">
            <div>
                <h2><b><i>Layanan Yang Tersedia</i></b></h2><br />
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                        <div class="icon-box">
                            <div class="icon"><i class="bi bi-safe-fill"></i></div>
                                <h4 class="title"><a href="#simpanan" class="scrollto">Simpanan</a></h4>
                                <p class="description">Simpanan aman dengan cara yang mudah. Dapatkan Bonus Simpanansebesar 9% per tahun.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box">
                                <div class="icon"><i class="fa-solid fa-hand-holding-dollar"></i></div>
                                <h4 class="title"><a href="#pinjaman" class="scrollto">Pinjaman</a></h4>
                                <p class="description">Ajukan pinjaman kapanpun dan dimanapun dengan jumlan dan waktuyang bisa di sesuaikan.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box">
                                <div class="icon"><i class="fa-solid fa-check-to-slot"></i></div>
                                <h4 class="title"><a href="#simpanan" class="scrollto">Penarikan</a></h4>
                                <p class="description">Ambil uang simpananmu* tanpa syarat dan ketentuan apapun.</p>
                                <p class="description text-muted">*) jenis simpanan tertentu</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box">
                                <div class="icon"><i class="fa-solid fa-money-bill-transfer"></i></div>
                                <h4 class="title"><a href="#pinjaman" class="scrollto">Pengembalian</a></h4>
                                <p class="description">Rincian pembayaran setiap bulan terjadwal dengan jelas dan dapat disesuaikan oleh pengguna.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ======= Simpanan Section ======= -->
        <section id="simpanan" class="simpanan">
            <div class="container" v-motion-slide-visible-once-bottom>
                <div class="section-title">
                    <h2><b><i>Simpanan</i></b></h2><br />
                    <p>Ada 4 jenis simpanan yang ada di <b>E-COOP<span>.</span></b> yaitusimpanan pokok, simpanan wajib, simpanan sukarela, dan simpananberjangka.</p>
                </div>
                <div class="row gy-4">
                    <div class="col-lg-3">
                        <ul class="nav nav-tabs flex-column">
                            <li class="nav-item">
                                <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Simpanan Pokok</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Simpanan Wajib</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Simpanan Sukarela</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Simpanan Berjangka</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="tab-1">
                                <div class="row gy-4">
                                    <div class="col-lg-12 details order-2 order-lg-1">
                                        <h3>Simpanan Pokok</h3>
                                        <p class="fst-italic">Simpanan pokok adalah sejumlah uang yang telah di tentukan koperasi dan wajib dibayarkan oleh anggota kepada koperasi pada saat masuk menjadi anggota. [E-Coop menetapkan sebesar Rp. 150.000 ]</p>
                                        <p>Simpanan pokok tidak dapat diambil selama yang bersangkutan menjadi anggota.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-2">
                                <div class="row gy-4">
                                    <div class="col-lg-12 details order-2 order-lg-1">
                                        <h3>Simpanan Wajib</h3>
                                        <p class="fst-italic">Simpanan wajib adalah sejumlah simpanan dengan jumlah yang telah ditentukan oleh koperasi yang wajib dibayarkan oleh anggota setiap bulannya. [E-Coop menetapkan sebesar Rp. 15.000 ]</p>
                                        <p>Simpanan wajib tidak dapat diambil selama yang bersangkutan menjadi anggota.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-3">
                                <div class="row gy-4">
                                    <div class="col-lg-12 details order-2 order-lg-1">
                                        <h3>Simpanan Sukarela</h3>
                                        <p class="fst-italic">Simpanan sukarela adalah simpanan dengan jumlah yang tidak di tentukan dan bisa dilakukan kapanpun.</p>
                                        <p>Simpanan sukarela juga bisa di ambil saat dibutuhkan tanpa syarat apapun.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-4">
                                <div class="row gy-4">
                                    <div class="col-lg-12 details order-2 order-lg-1">
                                        <h3>Simpanan Berjangka</h3>
                                        <p class="fst-italic">Simpanan berjangka adalah simpanan pada koperasi dengan jumlah dan waktu yang ditentukan oleh anggoya yang penyetorannya dilakukan satu kali untuk satu jangka waktu tertentu sesuai dengan perjanjian.</p>
                                        <p>Perjanjian dilakukan antara anggota dengan koperasi dan tidak boleh diambil sebelum jangka waktu tersebut berakhir.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== Alur Simpan Section ===== -->
        <section id="simpan" class="simpan">
            <div v-motion-slide-visible-once-bottom>
                <h2><b><i>Alur Melakukan Simpanan & Penarikan</i></b></h2><br />
                <div class="a-simpan" id="a-simpan">
                    <ul>
                        <li>
                            <div class="content">
                                <h3>Daftar Menjadi Anggota</h3>
                                <p>Sebelum membuka simpanan, anda harus mendaftar menjadi anggota terlebih dahulu sebagai syarat dalam melakukan segala transaksi</p>
                            </div>
                            <div class="no">
                                <h4>1</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Pilih Jenis Simpanan</h3>
                                <p>Jika anda sudah mendaftar menjadi anggota, pilih jenis simpanan yang ingin anda lakukan</p>
                            </div>
                            <div class="no">
                                <h4>2</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Isi Formulir Simpanan</h3>
                                <p>Isi formulir simpanan dengan benar, pastikan jumlah dan nomor rekening koperasi sesuai dengan pilihan anda</p>
                            </div>
                            <div class="no">
                                <h4>3</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Mulai Menabung</h3>
                                <p>Setelah mengisi formulir simpanan, anda dapat langsung  menabung dengan mentransfer ke nomor rekening koperasi sesuai dengan jumlah yang di tentukan serta mencantumkan bukti transfer</p>
                            </div>
                            <div class="no">
                                <h4>4</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Melakukan Penarikan</h3>
                                <p>Anda dapat melakukan penarikan uang simpanan sesuai dengan ketentuan jenis simpanan yang telah di tetapkan</p>
                            </div>
                            <div class="no">
                                <h4>5</h4>
                            </div>
                        </li>
                        <div style="clear: both"></div>
                    </ul>
                </div>
            </div>
        </section>

        <!-- ======= Pinjaman Section ======= -->
        <section id="pinjaman" class="pinjaman">
            <div v-motion-slide-visible-once-bottom>
                <h2><b><i>Pinjaman</i></b></h2><br/>
                <div class="card m-auto" id="c-pinjam">
                    <div class="row g-0">
                        <div class="col-md-2 card-image" >
                            <img src="../assets/pinjam.png" class="img" alt="Pinjaman" />
                        </div>
                        <div class="col-md-8" id="card-body">
                            <div class="card-body">
                                <p class="card-text">Pinjaman adalah salah satu layanan untuk memberikan pinjaman berupa uang kepada anggota koperasi. Anggota dapat mengatur jumlah pinjaman dan tenor waktu sesuai dengan yang mereka inginkan. <b>E-COOP<span>.</span></b> menetapkan bunga sebesar 12% per tahun / 1% perbulan.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== Alur Pinjam Section ===== -->
        <section id="pinjam" class="pinjam">
            <div v-motion-slide-visible-once-bottom>
                <h2><b><i>Alur Pengajukan Pinjaman & Pengembalian</i></b></h2><br/>
                <div class="a-pinjam" id="a-pinjam">
                    <ul>
                        <li>
                            <div class="content">
                                <h3>Daftar Menjadi Anggota</h3>
                                <p>Sebelum Mengajukan pinjaman, anda harus mendaftar menjadi anggota terlebih dahulu sebagai syarat dalam melakukan segala transaksi</p>                            </div>
                            <div class="no">
                                <h4>1</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Pilih Jumlan Pinjaman & Tenor Waktu</h3>
                                <p>Jika anda sudah mendaftar menjadi anggota, pilih jumlah pinjaman yang ingin anda ajukan dan pilih tenor waktu yangdiinginkan</p>
                            </div>
                            <div class="no">
                                <h4>2</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Isi Formulir Pengajuan Pinjaman</h3>
                                <p>Isi formulir pengajuan pinjaman dengan benar, pastikan jumlah,tenor waktu, dan data diri sesuai dengan pilihan anda.</p>
                            </div>
                            <div class="no">
                                <h4>3</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Tunggu Pengajuan Terverifikasi</h3>
                                <p>Setelah mengisi formulir simpanan dan di kirim, tunggu pengajuan anda di verifikasi oleh staff dan pimpinan</p>
                            </div>
                            <div class="no">
                                <h4>4</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Pinjaman Akan Di Transfer Ke Bank</h3>
                                <p>Setelah pengajuan anda terverifikasi, uang pinjaman akan ditrasnfer ke nomor rekening yang tercantum pada data diri anda</p>
                            </div>
                            <div class="no">
                                <h4>5</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Proses Pengembalian</h3>
                                <p>Pengembalian dilakukan sesuai dengan ketentuan yang anda pilih saat mengisi formulir pengajuan pinjaman</p>
                            </div>
                            <div class="no">
                                <h4>6</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Isi Formulir Pengembalian</h3>
                                <p>Formulir akan otomatis terisi sesuai dengan ketentuan pinjaman saat anda meminjam.</p>
                            </div>
                            <div class="no">
                                <h4>7</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Cantumkan Bukti Transfer</h3>
                                <p>Bukti transfer wajib dicantumkan saat mengisi formulir pengembalian.</p>
                            </div>
                            <div class="no">
                                <h4>8</h4>
                            </div>
                        </li>
                        <li>
                            <div class="content">
                                <h3>Kirim Formulir</h3>
                                <p>Setelah formulir dan bukti dikirim, staff akan memeriksanya dan akan menerima pengembalian apabila data yang dikirim benar.</p>
                            </div>
                            <div class="no">
                                <h4>9</h4>
                            </div>
                        </li>
                        <div style="clear: both"></div>
                    </ul>
                </div>
            </div>
        </section>
    </main>
    <Footer />
</template>

<script>
import axios from 'axios'
import Header from './Header.vue'
import Footer from './Footer.vue'
import { baseAPI } from "../api.js"
export default {
  name : "Service",
  async mounted() {
    window.scrollTo(0,0)

    var kuki = $cookies.get("jwt")
    if (kuki) {
      var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
      if(acc) { // Login        
        if (acc.data.data.role === 1 ) { // Admin
          this.$router.push({name : 'Dashboard'})
        } else if (acc.data.data.role === 2 || acc.data.data.role === 3) { // Pimpinan & Staff
          this.$router.push({name : 'Home'})
        }
      } 
    } 
  },
  components : {
    Header,
    Footer
  }
};
</script>

<style scoped>
/*=== Hero Section ====*/
#layanan {
  width: 100%;
  height: 30vh;
  background: url("../assets/bg-l.jpg") top center;
  background-size: cover;
  position: relative;
  z-index: 1;
  box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#layanan:before {
  content: "";
  background: rgba(0, 0, 0, 0.6);
  position: absolute;
  bottom: 0;
  top: 0;
  left: 0;
  right: 0;
}

#layanan .l-container {
  position: absolute;
  bottom: 0;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  text-align: center;
  padding: 0 15px;
}

#layanan h2 {
  color: #fff;
  font-size: 40px;
  max-width: 80%;
}

@media (max-width: 1000px) {
  #layanan {
    height: 100vh;
    background-attachment: fixed;
  }

  #layanan h2 {
    font-size: 40px;
    line-height: 24px;
    margin-bottom: 30px;
  }
}

@media (max-width: 500px) {
  #layanan h2 {
    font-size: 28px;
    line-height: 30px;
  }
}

/*===== Background Color =====*/
#list {
  background-color: #f1f1f1;
}

#simpanan {
  background-color: #ffffff;
  overflow: hidden;
}

#simpan {
  background-color: #ffffff;
}

#pinjaman {
  background-color: #f1f1f1;
}

#pinjam {
  background-color: #f1f1f1;
}

/*===== Main Section =====*/
#list .icon-box {
  width: 300px;
  height: 310px;
  padding: 20px 30px;
  position: relative;
  overflow: hidden;
  background: #fff;
  box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.12);
  transition: all 0.3s ease-in-out;
  border-radius: 8px;
  z-index: 1;
  text-align: center;
  margin-bottom: 35px;
}

#list .icon-box::before {
  content: "";
  position: absolute;
  background: #ffb037;
  right: 0;
  left: 0;
  bottom: 0;
  top: 100%;
  transition: all 0.4s;
  z-index: -1;
}

#list .icon-box:hover::before {
  background: #ffb037;
  top: 0;
  border-radius: 0px;
}

#list .icon {
  margin-bottom: 15px;
}

#list .icon i {
  font-size: 48px;
  line-height: 1;
  color: #ffb037;
  transition: all 0.3s ease-in-out;
}

#list .title {
  font-weight: 700;
  margin-bottom: 15px;
  font-size: 18px;
}

#list .title a {
  color: #000;
}

#list .description {
  font-size: 15px;
  line-height: 28px;
  margin-bottom: 0;
}

#list .icon-box:hover .title a {
  color: #ffffff;
}

#list .icon-box:hover .description {
  color: #ffffff;
}

#list .icon-box:hover .icon i {
  color: #ffffff;
}

#list .text-muted {
  font-size: 12px;
}

#simpanan .nav-link {
  border: 0;
  padding: 12px 15px 12px 0;
  transition: 0.3s;
  color: #212627;
  border-radius: 0;
  border-right: 2px solid #212627;
  font-weight: 600;
  font-size: 15px;
}

#simpanan .nav-link:hover {
  color: #ffb037;
}

#simpanan .nav-link.active {
  color: #ffb037;
  border-color: #ffb037;
  background-color: #ffffff;
}

#simpanan .tab-pane.active {
  -webkit-animation: fadeIn 0.5s ease-out;
  animation: fadeIn 0.5s ease-out;
}

#simpanan h3 {
  font-size: 26px;
  font-weight: 600;
  margin-bottom: 20px;
  color: #ffb037;
}

#simpanan p {
  color: #000;
}

#simpanan p:last-child {
  margin-bottom: 0;
}

#a-simpan {
  position: relative;
  margin: 0 auto;
  padding: 0 0;
  width: 900px;
  box-sizing: border-box;
  top: 75px;
}

#a-simpan:before {
  content: "";
  position: absolute;
  left: 50%;
  width: 2px;
  height: 122%;
  background-color: #c5c5cc;
}

#a-simpan ul {
  margin: 0;
  padding: 0;
  height: 600px;
}

#a-simpan ul li {
  list-style: none;
  position: relative;
  width: 50%;
  padding: 0px 40px;
  box-sizing: border-box;
}

#a-simpan ul li:nth-child(odd) {
  float: left;
  text-align: right;
  clear: both;
  top: -50px;
}

#a-simpan ul li:nth-child(even) {
  float: right;
  text-align: left;
  clear: both;
  top: -50px;
}

#a-simpan .content {
  padding-bottom: 50px;
}

#a-simpan ul li:nth-child(odd):before {
  content: "";
  position: absolute;
  top: 50px;
  right: -6px;
  width: 10px;
  height: 10px;
  background: #ffb037;
  border-radius: 50%;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.2);
}

#a-simpan ul li:nth-child(even):before {
  content: "";
  position: absolute;
  top: 40px;
  left: -4px;
  width: 10px;
  height: 10px;
  background: #ffb037;
  border-radius: 50%;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.2);
}

#a-simpan ul li h3 {
  margin: 0;
  padding: 0;
  font-weight: 600;
  color: #ffb037;
}

#a-simpan ul li p {
  margin: 10px 0 0;
  padding: 0;
}

#a-simpan ul li .no h4 {
  margin: 0;
  padding: 0;
  font-size: 14px;
}

#a-simpan ul li:nth-child(odd) .no {
  position: absolute;
  top: 35px;
  right: -80px;
  margin: 0;
  padding: 8px 16px;
  background-color: #ffb037;
  border-radius: 20px;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.5);
}

#a-simpan ul li:nth-child(even) .no {
  position: absolute;
  top: 30px;
  left: -80px;
  margin: 0;
  padding: 8px 16px;
  background-color: #ffb037;
  border-radius: 20px;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.5);
}

#pinjaman .card {
  width: 950px;
  height: 100%;
  box-shadow: 8px 8px #ffb037;
  border: 1px solid #000;
}

#pinjaman h5 {
  font-size: 24px;
}

#card-body {
  margin: 20px;
  font-size: 18px;
  width: 658px;
  padding: 30px 16px;
}

#pinjaman .card-image {
  padding: 10px;
  width: 250px;
}

#pinjaman .img {
  width: 230px;
}

#a-pinjam {
  position: relative;
  margin: 0 auto;
  padding: 0 0;
  width: 900px;
  box-sizing: border-box;
  top: 75px;
}

#a-pinjam:before {
  content: "";
  position: absolute;
  left: 50%;
  width: 2px;
  height: 241%;
  background-color: #c5c5cc;
}

#a-pinjam ul {
  margin: 0;
  padding: 0;
  height: 600px;
}

#a-pinjam ul li {
  list-style: none;
  position: relative;
  width: 50%;
  padding: 0px 40px;
  box-sizing: border-box;
}

#a-pinjam ul li:nth-child(odd) {
  float: left;
  text-align: right;
  clear: both;
  top: -50px;
}

#a-pinjam ul li:nth-child(even) {
  float: right;
  text-align: left;
  clear: both;
  top: -50px;
}

#a-pinjam .content {
  padding-bottom: 50px;
}

#a-pinjam ul li:nth-child(odd):before {
  content: "";
  position: absolute;
  top: 50px;
  right: -6px;
  width: 10px;
  height: 10px;
  background: #ffb037;
  border-radius: 50%;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.2);
}

#a-pinjam ul li:nth-child(even):before {
  content: "";
  position: absolute;
  top: 40px;
  left: -4px;
  width: 10px;
  height: 10px;
  background: #ffb037;
  border-radius: 50%;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.2);
}

#a-pinjam ul li h3 {
  margin: 0;
  padding: 0;
  font-weight: 600;
  color: #ffb037;
}

#a-pinjam ul li p {
  margin: 10px 0 0;
  padding: 0;
}

#a-pinjam ul li .no h4 {
  margin: 0;
  padding: 0;
  font-size: 14px;
}

#a-pinjam ul li:nth-child(odd) .no {
  position: absolute;
  top: 35px;
  right: -80px;
  margin: 0;
  padding: 8px 16px;
  background-color: #ffb037;
  border-radius: 20px;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.5);
}

#a-pinjam ul li:nth-child(even) .no {
  position: absolute;
  top: 30px;
  left: -80px;
  margin: 0;
  padding: 8px 16px;
  background-color: #ffb037;
  border-radius: 20px;
  box-shadow: 0 0 0 3px rgba(255, 176, 55, 0.5);
}

/*===== Large Laptop/PC Responsive  */
@media (min-width: 1440px) {
  #list .icon-box {
    padding: 50px 30px;
  }

  #a-simpan,
  #a-pinjam {
    width: 1300px;
  }

  #a-simpan:before {
    height: 104%;
  }

  #a-pinjam:before {
    height: 190%;
  }
}

/*===== Tablet Responsive =====*/
@media (min-width: 768px) and (max-width: 900px) {
  #list .icon-box {
    margin: 0 30px;
    padding: 40px 30px;
  }

  #a-simpan:before {
    left: 10%;
    height: 105%;
  }

  #a-pinjam:before {
    left: 10%;
    height: 190%;
  }

  #a-simpan ul li,
  #a-pinjam ul li{
    width: 70%;
  }

  #a-simpan ul li .no,
  #a-pinjam ul li .no {
    width: 40px;
  }

  #a-simpan ul li:nth-child(odd),
  #a-simpan ul li:nth-child(even),
  #a-pinjam ul li:nth-child(odd), 
  #a-pinjam ul li:nth-child(even) {
    float: right;
    text-align: left;
    right: 160px;
  }

  #a-simpan ul li:nth-child(odd) .no,
  #a-simpan ul li:nth-child(even) .no,
  #a-pinjam ul li:nth-child(odd) .no,
  #a-pinjam ul li:nth-child(even) .no {
    left: -40px;
  }

  #a-simpan ul li:nth-child(odd):before,
  #a-simpan ul li:nth-child(even):before,
  #a-pinjam ul li:nth-child(odd):before,
  #a-pinjam ul li:nth-child(even):before {
    left: -40px;
  }

  #pinjaman .card {
    width: 700px;
    height: 230px;
  }

  #pinjaman .img {
    width: 180px;
  }

  #pinjaman .card-image {
    padding: 20px;
    width: 200px;
    height: 230px;
  }

  #card-body {
    margin: 37px 0;
    font-size: 16px;
    width: 490px;
    height: 155px;
    padding: 0 0;
  }
}

/*===== Phone L Responsive =====*/
@media (min-width: 425px) and (max-width: 600px) {
  #list .icon-box {
    margin: 0 50px;
    padding: 50px 30px;
  }

  #a-simpan:before {
    left: 5%;
    height: 145%;
  }

  #a-pinjam:before {
    left: 5%;
    height: 280%;
  }

  #a-simpan ul li,
  #a-pinjam ul li{
    width: 40%;
  }

  #a-simpan ul li .no,
  #a-pinjam ul li .no {
    width: 40px;
  }

  #a-simpan ul li:nth-child(odd),
  #a-simpan ul li:nth-child(even),
  #a-pinjam ul li:nth-child(odd), 
  #a-pinjam ul li:nth-child(even) {
    float: right;
    text-align: left;
    right: 475px;
  }

  #a-simpan ul li:nth-child(odd) .no,
  #a-simpan ul li:nth-child(even) .no,
  #a-pinjam ul li:nth-child(odd) .no,
  #a-pinjam ul li:nth-child(even) .no {
    left: -40px;
  }

  #a-simpan ul li:nth-child(odd):before,
  #a-simpan ul li:nth-child(even):before,
  #a-pinjam ul li:nth-child(odd):before,
  #a-pinjam ul li:nth-child(even):before {
    left: -40px;
  }

  #pinjaman .card {
    width: 380px;
    height: 100%;
  }

  #pinjaman .img {
    width: 200px;
    margin: 0 79px;
  }

  #pinjaman .card-image {
    padding-top: 30px;
    width: 380px;
  }

  #card-body {
    margin: 0 0;
    font-size: 16px;
    text-align: center;
    padding-bottom: 30px;
    width: 378px;
  }
}

/*===== Phone M Responsive =====*/
@media (min-width: 350px) and (max-width: 424px) {
  #list .icon-box {
    margin: 0 50px;
    padding: 40px 30px;
  }

  #a-simpan:before {
    left: 5%;
    height: 170%;
  }

  #a-pinjam:before {
    left: 5%;
    height: 315%;
  }

  #a-simpan ul li,
  #a-pinjam ul li{
    width: 35%;
  }

  #a-simpan ul li .no,
  #a-pinjam ul li .no {
    width: 40px;
  }

  #a-simpan ul li:nth-child(odd),
  #a-simpan ul li:nth-child(even),
  #a-pinjam ul li:nth-child(odd), 
  #a-pinjam ul li:nth-child(even) {
    float: right;
    text-align: left;
    right: 520px;
  }

  #a-simpan ul li:nth-child(odd) .no,
  #a-simpan ul li:nth-child(even) .no,
  #a-pinjam ul li:nth-child(odd) .no,
  #a-pinjam ul li:nth-child(even) .no {
    left: -40px;
  }

  #a-simpan ul li:nth-child(odd):before,
  #a-simpan ul li:nth-child(even):before,
  #a-pinjam ul li:nth-child(odd):before,
  #a-pinjam ul li:nth-child(even):before {
    left: -40px;
  }

  #pinjaman .card {
    width: 310px;
    height: 100%;
  }

  #pinjaman .img {
    width: 200px;
    margin: 0 44px;
  }

  #pinjaman .card-image {
    padding-top: 30px;
    width: 308px;
  }

  #card-body {
    margin: 0 0;
    font-size: 16px;
    text-align: center;
    width: 308px;
    padding: 0 0 20px 0;
  }
}

/*===== Phone S Responsive =====*/
@media (max-width: 374px) {
  #list .icon-box {
    width: 255px;
    margin: 0 30px;
    padding: 25px 20px;
  }

  #a-simpan:before {
    left: 5%;
    height: 190%;
  }

  #a-pinjam:before {
    left: 5%;
    height: 360%;
  }

  #a-simpan ul li,
  #a-pinjam ul li{
    width: 30%;
  }

  #a-simpan ul li .no,
  #a-pinjam ul li .no {
    width: 40px;
  }

  #a-simpan ul li:nth-child(odd),
  #a-simpan ul li:nth-child(even),
  #a-pinjam ul li:nth-child(odd), 
  #a-pinjam ul li:nth-child(even) {
    float: right;
    text-align: left;
    right: 579px;
  }

  #a-simpan ul li:nth-child(odd) .no,
  #a-simpan ul li:nth-child(even) .no,
  #a-pinjam ul li:nth-child(odd) .no,
  #a-pinjam ul li:nth-child(even) .no {
    left: -25px;
  }

  #a-simpan ul li:nth-child(odd):before,
  #a-simpan ul li:nth-child(even):before,
  #a-pinjam ul li:nth-child(odd):before,
  #a-pinjam ul li:nth-child(even):before {
    left: -25px;
  }

  #pinjaman .card {
    width: 290px;
    height: 100%;
  }

  #pinjaman .img {
    width: 200px;
    margin: 0 34px;
  }

  #pinjaman .card-image {
    padding-top: 20px;
    width: 380px;
  }

  #card-body {
    margin: 0 0;
    font-size: 16px;
    text-align: center;
    padding: 0 0 20px 0;
  }
}
</style>