<template>
    <Header />
    <!-- ====== Hero Section ====== -->
    <section id="h-pinjam" class="h-pinjam">
        <div class="l-container">
            <h2>Pinjaman <b>E-COOP<span>.</span></b></h2><br>
        </div>
    </section>

    <main id="main">
        <!-- ====== Calculator Section -->
        <section class="calc" id="calc">
            <div class="container">
                <div class="card-group" id="c-calc">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>1</span>%</h5>
                            <p class="card-text">Bunga Pinjaman Per Bulan</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>3-12</span> Bulan</h5>
                            <p class="card-text">Jangka Waktu Pinjaman</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>2-50</span> Juta</h5>
                            <p class="card-text">Jumlah Pinjaman</p>
                        </div>
                    </div>
                </div>

                <div class="container text-center" id="slider">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <p>Saya Ingin Meminjam Sebesar :</p>
                            <div class="slider-container">
                                <div class="value-container">
                                    <!-- <button class="minus"><i class="bi bi-dash" id="k-simpan"></i></button> -->
                                    <span>Rp. {{ jumlah }}</span>
                                    <!-- <button class="plus"><i class="bi bi-plus" id="t-simpan"></i></button> -->
                                </div>
                                <input type="range" min="1" max="72" value="1" class="slider" id="s-pinjam" v-on:input="sliderPinjam">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <p>Dalam Jangka Waktu :</p>
                            <div class="slider-container">
                                <div class="value-container">
                                    <!-- <button class="minus"><i class="bi bi-dash" id="k-bulan"></i></button> -->
                                    <span>{{ bulan }} Bulan</span>
                                    <!-- <button class="plus"><i class="bi bi-plus" id="t-bulan"></i></button> -->
                                </div>
                                <input type="range" min="3" max="12" value="4" class="slider" id="sp-bulan" v-on:input="sliderBulan">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-group" id="j-calc">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Bunga Per Bulan</h5>
                            <input type="text" placeholder="Jumlah Simpanan" class="info" :value="this.rp + (0.001 * this.jumlah)" readonly>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Bunga</h5>
                            <input type="text" placeholder="Jumlah Simpanan" class="info" :value="this.rp + ((0.001 * this.jumlah) * this.bulan)" readonly>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Pembayaran Tiap Bulan</h5>
                            <input type="text" placeholder="Jumlah Simpanan" class="info" :value="this.rp + (this.jumlah / this.bulan + 0.001 * this.jumlah)" readonly>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Kembali</h5>
                            <input type="text" placeholder="Jumlah Simpanan" class="info" :value="this.rp + (this.jumlah + (0.001 * this.jumlah * this.bulan))" readonly>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ====== Form Section ====== -->
        <section class="form" id="form">
            <div class="containers" id="containers" v-motion-slide-visible-once-bottom>
                <div class="title">Formulir Pinjaman</div>
                    <div class="content">
                        <!-- <form action="#"> -->
                            <div class="pinjam-details">
                                <div class="input-box">
                                    <span class="details">Jumlah Pinjaman (Rupiah)</span>
                                    <input type="text" placeholder="Jumlah Pinjaman" v-model="jumlah" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Jangka Waktu (Bulan)</span>
                                    <input type="text" placeholder="Jangka Waktu" v-model="bulan" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Tujuan Meminjam</span>
                                    <input type="text" placeholder="Tuliskan Tujuan Meminjam" v-model="tujuan" required>
                                </div>
                                <div class="input-box">
                                <span class="details">Upload Foto KTP</span>
                                <input type="file" class="input-file form-control form-control-lg" v-on:change="onFileSelected" required>
                            </div>
                            </div>
                            <hr>
                            <div class="user-details">
                                <div class="input-box">
                                    <span class="details">Nama</span>
                                    <input type="text" placeholder="Masukan Nama" v-model="nama" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Nomor KTP</span>
                                    <input type="text" placeholder="Masukan No KTP" v-model="no_ktp" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Nomor Telfon</span>
                                    <input type="text" placeholder="Masukan No Telp" v-model="no_telp" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Jenis Kelamin</span>
                                    <input type="text" placeholder="Masukan Jenis Kelamin" v-model="jenis_kelamin" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Tempat Lahir</span>
                                    <input type="text" placeholder="e.g Kabupaten/Kota, Provinsi" v-model="tempat_lahir" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">Tanggal Lahir</span>
                                    <input type="date" v-model="tanggal_lahir" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Alamat</span>
                                    <input type="text" placeholder="Masukan Alamat" v-model="alamat" readonly>
                                </div>
                                <div class="input-box">
                                    <span class="details">Pekerjaan</span>
                                    <input type="text" placeholder="Masukan Pekerjaan" v-model="pekerjaan" readonly>
                                </div>
                                <p class="text-muted">*Jika data diri anda tidak sesuai, silahkan ubah di halaman <a href="/m-profile">profile</a></p>
                            </div>
                            <div class="button-submit">
                                <input type="submit" value="Ajukan Pinjaman" v-on:click="submitPinjaman">
                            </div>
                        <!-- </form> -->
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
    name : 'Pinjam',
    components : {
        Header,
        Footer
    },
    data() {
        return {
            rp: "Rp. ",

            ktp: null,
            tujuan: "",
            jumlah: 2000000,
            bulan: 4,

            nama: "",
            no_ktp: "",
            no_telp: "",
            jenis_kelamin: "",
            tempat_lahir: "",
            tanggal_lahir: "",
            alamat: "",
            pekerjaan: "",
        }
    },
    async mounted() {
        window.scrollTo(0,0)
        var kuki = $cookies.get("jwt")

        const btn = document.querySelector('.button-submit')
        const p_link = document.querySelector('.text-muted')

        if (kuki) { //login
            this.getUserInfo();
            this.getAnggota();
        } else if (!kuki) { // Not Login
            btn.classList.add("hidden")
            p_link.classList.add("hidden")
        }
    },
    methods: {
        async getUserInfo(){
            var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
            if(acc) { // Login
                if (acc.data.data.role === 1 ) { // Admin
                    this.$router.push({name : 'Dashboard'})
                } else if (acc.data.data.role === 2 || acc.data.data.role === 3) { // Pimpinan & Staff
                    this.$router.push({name : 'Home'})
                }
            } 
        },
        async sliderPinjam() {
            const sPinjam = document.getElementById("s-pinjam");
            switch (sPinjam.value) {
                case '1':
                    this.jumlah = 2000000
                    break;
                case '2':
                    this.jumlah = 2500000
                    break;
                case '3':
                    this.jumlah = 3000000
                    break;
                case '4':
                    this.jumlah = 3500000
                    break;
                case '5':
                    this.jumlah = 4000000
                    break;
                case '6':
                    this.jumlah = 4500000
                    break;
                case '7':
                    this.jumlah = 5000000
                    break;
                case '8':
                    this.jumlah = 5500000
                    break;
                case '9':
                    this.jumlah = 6000000
                    break;
                case '10':
                    this.jumlah = 6500000
                    break;
                case '11':
                    this.jumlah = 7000000
                    break;
                case '12':
                    this.jumlah = 7500000
                    break;
                case '13':
                    this.jumlah = 8000000
                    break;
                case '14':
                    this.jumlah = 8500000
                    break;
                case '15':
                    this.jumlah = 9000000
                    break;
                case '16':
                    this.jumlah = 9500000
                    break;
                case '17':
                    this.jumlah = 10000000
                    break;
                case '18':
                    this.jumlah = 10500000
                    break;
                case '19':
                    this.jumlah = 11000000
                    break;
                case '20':
                    this.jumlah = 11500000
                    break;
                case '21':
                    this.jumlah = 12000000
                    break;
                case '22':
                    this.jumlah = 12500000
                    break;
                case '23':
                    this.jumlah = 13000000
                    break;
                case '24':
                    this.jumlah = 13500000
                    break;
                case '25':
                    this.jumlah = 14000000
                    break;
                case '26':
                    this.jumlah = 14500000
                    break;
                case '27':
                    this.jumlah = 15000000
                    break;
                case '28':
                    this.jumlah = 15500000
                    break;
                case '29':
                    this.jumlah = 16000000 
                    break;
                case '30':
                    this.jumlah = 16500000
                    break;
                case '31':
                    this.jumlah = 17000000
                    break;
                case '32':
                    this.jumlah = 17500000
                    break;
                case '33':
                    this.jumlah = 18000000
                    break;
                case '34':
                    this.jumlah = 18500000
                    break;
                case '35':
                    this.jumlah = 19000000
                    break;
                case '36':
                    this.jumlah = 19500000
                    break;
                case '37':
                    this.jumlah = 20000000
                    break;
                case '38':
                    this.jumlah = 20500000
                    break;
                case '39':
                    this.jumlah = 21000000
                    break;
                case '40':
                    this.jumlah = 21500000
                    break;
                case '41':
                    this.jumlah = 22000000
                    break;
                case '42':
                    this.jumlah = 22500000
                    break;
                case '43':
                    this.jumlah = 23000000
                    break;
                case '44':
                    this.jumlah = 23500000 
                    break;
                case '45':
                    this.jumlah = 24000000
                    break;
                case '46':
                    this.jumlah = 24500000
                    break;
                case '47':
                    this.jumlah = 25000000
                    break;
                case '48':
                    this.jumlah = 26000000
                    break;
                case '49':
                    this.jumlah = 27000000
                    break;
                case '50':
                    this.jumlah = 28000000
                    break;
                case '51':
                    this.jumlah = 29000000
                    break;
                case '52':
                    this.jumlah = 30000000
                    break;
                case '53':
                    this.jumlah = 31000000
                    break;
                case '54':
                    this.jumlah = 32000000
                    break;
                case '55':
                    this.jumlah = 33000000
                    break;
                case '56':
                    this.jumlah = 34000000
                    break;
                case '57':
                    this.jumlah = 35000.000
                    break;
                case '58':
                    this.jumlah = 36000000
                    break;
                case '59':
                    this.jumlah = 37000000
                    break;
                case '60':
                    this.jumlah = 38000000
                    break;
                case '61':
                    this.jumlah = 39000000
                    break;
                case '62':
                    this.jumlah = 40000000
                    break;
                case '63':
                    this.jumlah = 41000000
                    break;
                case '64':
                    this.jumlah = 42000000
                    break;
                case '65':
                    this.jumlah = 43000000
                    break;
                case '66':
                    this.jumlah = 43000000
                    break;
                case '67':
                    this.jumlah = 45000000
                    break;
                case '68':
                    this.jumlah = 46000000
                    break;
                case '69':
                    this.jumlah = 47000000
                    break;
                case '70':
                    this.jumlah = 48000000
                    break;
                case '71':
                    this.jumlah = 49000000
                    break;
                case '72':
                    this.jumlah = 50000000
                    break;
                default:
                    console.log('default');
            };
        },
        async sliderBulan() {
            const spBulan = document.getElementById("sp-bulan");
            this.bulan = spBulan.value;
        },
        async getAnggota() {
            let profile = await axios.get(`${baseAPI}/anggota/info` , {withCredentials: true});
            this.id = profile.data.data.id
            this.no_anggota = profile.data.data.no_anggota;
            this.nama = profile.data.data.nama;
            this.no_telp = profile.data.data.no_hp;
            this.no_ktp = profile.data.data.no_ktp;
            this.jenis_kelamin = profile.data.data.gender;
            this.tempat_lahir = profile.data.data.tempat_lahir;
            this.tanggal_lahir = profile.data.data.tanggal_lahir;
            this.alamat = profile.data.data.alamat;
            this.pekerjaan = profile.data.data.m_pekerjaan.pekerjaan;
        },
        onFileSelected(event) {
            this.ktp = event.target.files[0]
        },
        async submitPinjaman() {
            var d = new Date()
            d.setMonth(d.getMonth() + parseInt(this.bulan))
            const fd = new FormData();
            fd.append('file', this.ktp);
            fd.append('jumlah', this.jumlah);
            fd.append('tujuan', this.tujuan);
            fd.append('tanggal_pengembalian', d)
            let result = await axios.post(`${baseAPI}/pinjam`, fd, { withCredentials: true })
            if (result.status === 201) {
                const Toast = this.$swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Input Successfull!'
                })
                setTimeout(location.reload.bind(location), 1000);
            } else {
                const Toast = this.$swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true,
                })

                Toast.fire({
                    icon: 'error',
                    title: 'Input Failed!'
                })
            }
        }
    }
}
</script>

<style scoped>
/*===== Hero Section =====*/
#h-pinjam {
    width: 100%;
    height: 30vh;
    background: url("../assets/bg-p.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#h-pinjam:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#h-pinjam .l-container {
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

#h-pinjam h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 1000px) {
    #h-pinjam {
        height: 100vh;
        background-attachment: fixed;
    }

    #h-pinjam h2 {
        font-size: 40px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

@media (max-width: 500px) {
    #h-pinjam h2 {
        font-size: 28px;
        line-height: 30px;
    }
}

/*===== Background Color =====*/
#calc {
    background-color: #FFFFFF;
}

#form {
    background-color: #F1F1F1;
}

/*===== Main =====*/
.slider-container {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    margin-bottom: 30px;
}
  
.plus, .minus {
    border: none;
    font-size: 25px;
    cursor: pointer;
    background-color: transparent;
}
  
.value-container {
    margin-bottom: 10px;
}
  
.value-container span {
    color: #000000;
    font-size: 25px;
}
  
.slider {
    width: 90%;
    height: 5px;
    background: linear-gradient(to right, #fad88d, #FFB037);
    transition: backgound 450ms ease-in;
    appearance: none;
    border-radius: 25px;
    box-shadow: 2px 8px 13px -3px rgba(116, 114, 114, 0.75);
}
  
.slider::-webkit-slider-thumb {
    cursor: pointer;
    appearance: none;
    height: 20px;
    width: 20px;
    background-color: #FFFFFF;
    border-radius: 50%;
    border: 4px solid #FFB037;
    box-shadow: 2px 8px 13px -3px rgba(116, 114, 114, 0.75);
}
  
#slider {
    margin-bottom: 40px;
}
  
#slider p {
    text-align: left;
    margin-left: 35px;
}
  
#c-calc {
    text-align: center;
    margin-bottom: 40px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
  
#c-calc .card {
    border: none;
}
  
#c-calc span {
    font-size: 300%;
}
  
#c-calc h5 {
    color: #FFB037;
}
  
#c-calc p {
    font-weight: 500;
}
  
#j-calc {
    margin-bottom: 30px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
  
#j-calc .card {
    border: none;
    text-align: center;
}
  
#j-calc h5 {
    font-weight: 600;
    color: #FFB037;
}
  
#j-calc span {
    color: #000000;
}
  
#containers{
    width: 960px;
    background-color: #fff;
    padding: 25px 30px;
    border-radius: 5px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
    align-items: center;
    margin-right: auto;
    margin-left: auto;
}
  
#containers .title{
    font-size: 25px;
    font-weight: 500;
    position: relative;
}
  
#containers .title::before{
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}
  
.content .user-details, 
.content .pinjam-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}
  
.user-details .input-box, 
.pinjam-details .input-box {
    margin-bottom: 15px;
    width: calc(100% / 2 - 20px);
}
  
.input-box span.details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}
  
.pinjam-details .input-box input, 
.user-details .input-box input, select{
    height: 45px;
    width: 100%;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
}
  
.user-details .input-box input:focus,
.pinjam-details .input-box input:focus {
    border-color: #FFB037;
}
  
.button-submit{
    height: 45px;
    margin: 35px 0
}
  
.button-submit input {
    height: 100%;
    width: 100%;
    border-radius: 5px;
    border: none;
    color: #000000;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    background: #FFB037;
}
  
.button-submit input:hover {
    background: #ffc955;
}

.input-file::-webkit-file-upload-button {
    height: 44px;
}

.hidden {
    display: none;
}

input.info {
    border: none;
    text-align: center;
}

/*===== Large Laptop/PC Responsive  */
@media (min-width: 1440px) {
    #containers {
        width: 1310px;
    }
}

/*===== Tablet Responsive  */
@media (min-width: 768px) and (max-width: 900px) {
    #containers {
        width: 710px;
    }
}

/*===== Phone L Responsive  */
@media (min-width: 425px) and (max-width: 600px) {
    #containers {
        width: 400px;
    }

    form .user-details .input-box, 
    form .pinjam-details .input-box {
        width: 100%;
    }

    #containers .text-muted {
        font-size: 12px;
    }
}

/*===== Phone M Responsive  */
@media (min-width: 350px) and (max-width: 424px) {
    #containers {
        width: 350px;
    }

    form .user-details .input-box, 
    form .pinjam-details .input-box {
        width: 100%;
    }

    #containers .text-muted {
        font-size: 12px;
    }

    form .button-submit input {
        font-size: 18px;
    }
}

/*===== Phone S Responsive  */
@media (max-width: 374px) {
    #containers {
        width: 296px;
    }

    form .user-details .input-box, 
    form .pinjam-details .input-box {
        width: 100%;
    }

    #containers .text-muted {
        font-size: 12px;
    }

    form .button-submit input {
        font-size: 16px;
    }
}
</style>