<template>
    <Header />
    <!-- ====== Hero Section ====== -->
    <section id="h-simpan" class="h-simpan">
        <div class="l-container">
            <h2>Simpanan <b>E-COOP<span>.</span></b></h2><br>
        </div>
    </section>

    <main id="main">
        <!-- ====== Calculator Section ====== -->  
        <section id="calc" class="calc">
            <div class="container">
                <div class="card-group" id="c-calc">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>9</span>%</h5>
                            <p class="card-text">Bonus Simpanan Per Tahun</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>1-12</span> Bulan</h5>
                            <p class="card-text">Jangka Waktu Simpanan</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><span>2-50</span> Juta</h5>
                            <p class="card-text">Jumlah Simpanan</p>
                        </div>
                    </div>
                </div>

                <div class="container text-center" id="slider">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <p>Saya Ingin Menyimpan Sebesar :</p>
                            <div class="slider-container">
                                <div class="value-container">
                                    <!-- <button class="minus"><i class="bi bi-dash" id="k-simpan"></i></button> -->
                                    <span id="j-simpan">Rp. {{ jumlah }}</span>
                                    <!-- <button class="plus" v-on:click="plus"><i class="bi bi-plus" id="t-simpan"></i></button> -->
                                </div>
                                <input type="range" min="1" max="25" class="slider" id="s-simpan" value="1" v-on:input="sliderSimpan">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <p>Dalam Jangka Waktu :</p>
                            <div class="slider-container">
                                <div class="value-container">
                                    <!-- <button class="minus"><i class="bi bi-dash" id="k-bulan"></i></button> -->
                                    <span id="js-bulan" >{{ bulan }} Bulan</span>
                                    <!-- <button class="plus"><i class="bi bi-plus" id="t-bulan"></i></button> -->
                                </div>
                                <input type="range" min="1" max="12" class="slider" id="ss-bulan" value="1" v-on:input="sliderBulan">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-group" id="j-calc">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Bonus Per Bulan</h5>
                            <input type="text" class="info" :value="this.rp + (0.0075 * this.jumlah)" readonly>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Bonus</h5>
                            <input type="text" class="info" :value="this.rp + ((0.0075 * this.bulan) * this.jumlah)" readonly>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Jumlah Akhir Simpanan</h5>
                            <input type="text" class="info" :value="this.rp + (this.jumlah + ((0.0075 * this.bulan) * this.jumlah))" readonly>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ====== Form Section ====== -->
        <section id="form" class="form">
            <div class="containers" id="containers" v-motion-slide-visible-once-bottom>
                <div class="title">Formulir Simpanan Berjangka</div>
                <div class="content">
                    <!-- <form action="#" enctype='multipart/form-data'> -->
                        <div class="simpan-details">
                            <div class="input-box">
                                <span class="details">Jumlah Simpanan (Rupiah)</span>
                                <input type="text" placeholder="Jumlah Simpanan" id="t-simpan" v-model="jumlah" readonly>
                            </div>
                            <div class="input-box">
                                <span class="details">Jangka Waktu (Bulan)</span>
                                <input type="text" placeholder="Jangka Waktu" id="jk-simpan" v-model="bulan" readonly>
                            </div>
                            <div class="input-box">
                                <span class="details">Simpanan Perbulan</span>
                                <input type="text" placeholder="Simpanan Perbulan" :value="this.jumlah / this.bulan" readonly>
                            </div>
                            <div class="input-box">
                                <span class="details">Upload Foto KTP</span>
                                <input type="file" id="file" name="file" class="input-file form-control form-control-lg" v-on:change="onFileSelected">
                            </div>
                            <p class="text-muted">*Simpanan Perbulan Akan Di Bulatkan</p>
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
                            <input type="submit" value="Ajukan Simpanan Berjangka" v-on:click="submitSimpanan">
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
    name : 'Simpan',
    components : {
        Header,
        Footer
    },
    data() {
        return {
            rp: "Rp. ",

            jumlah: 2000000,
            bulan: 1,

            ktp: null,

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

        if (kuki) {
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
        async sliderSimpan() {
            const sSimpan = document.getElementById("s-simpan");
            switch (sSimpan.value) {
                case '1':
                    this.jumlah = 2000000
                    break;
                case '2':
                    this.jumlah = 3000000
                    break;
                case '3':
                    this.jumlah = 4000000  
                    break;
                case '4': 
                    this.jumlah = 5000000
                    break;
                case '5':
                    this.jumlah = 6000000
                    break;
                case '6': 
                    this.jumlah = 7000000
                    break;
                case '7':
                    this.jumlah = 8000000
                    break;
                case '8':
                    this.jumlah = 9000000 
                    break;
                case '9':
                    this.jumlah = 10000000 
                    break;
                case '10':
                    this.jumlah = 11000000
                    break;
                case '11':
                    this.jumlah = 12000000
                    break;
                case '12':
                    this.jumlah = 13000000
                    break;
                case '13':
                    this.jumlah = 14000000
                    break;
                case '14':
                    this.jumlah = 15000000
                    break;
                case '15':
                    this.jumlah = 16000000
                    break;
                case '16':
                    this.jumlah = 17000000
                    break;
                case '17':
                    this.jumlah = 18000000
                    break;
                case '18':
                    this.jumlah = 19000000
                    break;
                case '19':
                    this.jumlah = 20000000
                    break;
                case '20':
                    this.jumlah = 25000000 
                    break;
                case '21':
                    this.jumlah = 30000000 
                    break;
                case '22':
                    this.jumlah = 35000000 
                    break;
                case '23':
                    this.jumlah = 40000000 
                    break;
                case '24':
                    this.jumlah = 45000000
                    break;
                case '25':
                    this.jumlah = 50000000
                    break;
                default:
                    console.log('default');
            };
        },
        async sliderBulan() {
            const ssBulan = document.getElementById("ss-bulan");
            this.bulan = ssBulan.value;
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
        async onFileSelected(event) {
            this.ktp = event.target.files[0]
        },
        async submitSimpanan() {
            const fd = new FormData();
            fd.append('file', this.ktp);
            fd.append('jumlah', 0);
            fd.append('total', this.jumlah);
            fd.append('jangka_simpan', this.bulan)
            let result = await axios.post(`${baseAPI}/simpan`, fd, { withCredentials: true })
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
#h-simpan {
    width: 100%;
    height: 30vh;
    background: url("../assets/bg-s.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#h-simpan:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#h-simpan .l-container {
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

#h-simpan h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 1000px) {
    #h-simpan {
        height: 100vh;
        background-attachment: fixed;
    }

    #h-simpan h2 {
        font-size: 40px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

@media (max-width: 500px) {
    #h-simpan h2 {
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
.content .simpan-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}
  
.user-details .input-box, 
.simpan-details .input-box {
    margin-bottom: 15px;
    width: calc(100% / 2 - 20px);
}
  
.input-box span.details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}
  
.simpan-details .input-box input, 
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
.simpan-details .input-box input:focus {
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

#btn-info, 
#btn-decline,
#btn-accept {
    font-size: 20px;
    margin: 5px;
    color: #000;
    cursor: pointer;
}

#btn-info:hover, 
#btn-decline:hover, 
#btn-accept:hover {
    color : #FFB037;
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
    form .simpan-details .input-box {
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
    form .simpan-details .input-box {
        width: 100%;
    }

    #containers .text-muted {
        font-size: 12px;
    }

    form .button-submit input {
        font-size: 16px;
    }
}

/*===== Phone S Responsive  */
@media (max-width: 374px) {
    #containers {
        width: 296px;
    }

    form .user-details .input-box, 
    form .simpan-details .input-box {
        width: 100%;
    }

    #containers .text-muted {
        font-size: 12px;
    }

    form .button-submit input {
        font-size: 13px;
    }
}
</style>