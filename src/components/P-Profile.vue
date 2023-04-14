<template>
    <Header />
    <!-- ====== Hero Section ====== -->
    <section id="profile" class="profile">
        <div class="l-container">
            <h2>User Profile<span>.</span></h2><br>
        </div>
    </section>

    <main id="main">
        <section id="user-data" class="user-data">
            <div class="container">
                <div class="d-flex align-items-start" id="profile-tabs">
                    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <button class="nav-link active profile-pegawai" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile-pegawai" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <div class="tabs">
                                <i class="fa-solid fa-clipboard-user"></i>
                                <span>Profile</span>
                            </div>
                        </button>
                    </div>
                    <div class="tab-pane fade show active" id="v-pills-profile-pegawai" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
                    <div class="containers1" id="containers1">
                        <div class="title">Data Diri</div>
                        <div class="content">
                            <div class="user-details">
                                <div class="input-box staff">
                                    <span class="details">Nomor Pegawai</span>
                                    <input type="text" placeholder="Nomor Anggota Akan Terisi Otomatis" class="no-anggota" v-model="no_pegawai" readonly>
                                </div>
                                <div class="input-box nama">
                                    <span class="details">Nama</span>
                                    <input type="text" placeholder="Masukan Nama" v-model="nama" required>
                                </div>
                                <div class="input-box ktp">
                                    <span class="details">Nomor KTP</span>
                                    <input type="text" placeholder="Masukan No KTP" v-model="no_ktp" required>
                                </div>
                                <div class="input-box telp">
                                    <span class="details">Nomor Telepon</span>
                                    <input type="text" placeholder="Masukan No Telp" v-model="no_telp" required>
                                </div>
                                <div class="input-box email">
                                    <span class="details">Email</span>
                                    <input type="email" placeholder="Masukan Email" v-model="email" readonly>
                                </div>
                                <div class="input-box jk">
                                    <span class="details">Jenis Kelamin</span>
                                    <select name="gender" id="gender" class="form-select" v-model="jenis_kelamin" required>
                                        <option value="pria">Pria</option>
                                        <option value="wanita">Wanita</option>
                                    </select>
                                </div>
                                <div class="input-box teml">
                                    <span class="details">Tempat Lahir</span>
                                    <input type="text" placeholder="e.g Kabupaten/Kota, Provinsi" v-model="tempat_lahir" required>
                                </div>
                                <div class="input-box tangl">
                                    <span class="details">Tanggal Lahir</span>
                                    <input type="date" class="form-control" v-model="tanggal_lahir" required>
                                </div>
                                <div class="input-box alamat">
                                    <span class="details">Alamat</span>
                                    <input type="text" placeholder="Masukan Alamat" v-model="alamat" required>
                                </div>
                                <div class="input-box jabatan">
                                    <span class="details">Jabatan</span>
                                    <input type="text" placeholder="Jabatan Akan Di Isi Oleh Admin" v-model="jabatan" readonly>
                                </div>
                            </div>
                            <div class="button" id="btn_submit">
                                <input type="submit" value="Submit Data Diri" class="submit" v-on:click="submitProfile(this.id)">
                            </div>
                            <div class="button hidden" id="btn_edit">
                                <input class="submit" value="Edit Data Diri" v-on:click="editProfile(this.id)">
                            </div>
                        </div>
                    </div>
                </div>
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
    name : 'P-Profile',
    components : {
        Header,
        Footer
    },
    data() {
        return {
            id: "",
            nama: "",
            no_ktp: "",
            no_telp: "",
            jenis_kelamin: "",
            tempat_lahir: "",
            tanggal_lahir: "",
            alamat: "",
            jabatan: "",

            no_pegawai:"",
            email: "",
        };
    },
    async mounted() {
        window.scrollTo(0,0)

        var kuki = $cookies.get("jwt")
        if (!kuki) {
            this.$router.push({name : 'Home'})
        }
        
        var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
        this.email = acc.data.data.email
        if(acc) { // Login
            if (acc.data.data.role === 1) { // Admin
                this.$router.push({name : 'Dashboard'})
            } else if (acc.data.data.role === 4 ) { // Member
                this.$router.push({name : 'Home'})
            }
        } 

        var tab = document.querySelector('#profile-tabs')
        var pill = document.querySelector('#v-pills-tab')
        if (window.innerWidth < 1000) {
            tab.classList.remove('d-flex')
            pill.classList.remove('flex-column')
        } else {
            tab.classList.add('d-flex') 
            pill.classList.add('flex-column')
        }

        this.getPegawai();
        this.validasi();
    },
    methods: {
        async getPegawai() {
            let profile = await axios.get(`${baseAPI}/userInfo/pegawai` , {withCredentials: true});
            console.log(profile);
            this.id = profile.data.data.id
            this.no_pegawai = profile.data.data.no_pegawai;
            this.nama = profile.data.data.nama;
            this.no_telp = profile.data.data.no_hp;
            this.no_ktp = profile.data.data.no_ktp;
            this.jenis_kelamin = profile.data.data.gender;
            this.tempat_lahir = profile.data.data.tempat_lahir;
            this.tanggal_lahir = profile.data.data.tanggal_lahir;
            this.alamat = profile.data.data.alamat;
            this.jabatan = profile.data.data.m_jabatan.jabatan;
        },
        async submitProfile() {
            let result = await axios.post(`${baseAPI}/pegawai`, {
                nama: this.nama,
                no_hp: this.no_telp,
                no_ktp: this.no_ktp,
                gender: this.jenis_kelamin,
                tempat_lahir: this.tempat_lahir,
                tanggal_lahir: this.tanggal_lahir,
                alamat: this.alamat,
            }, { withCredentials: true });
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
                localStorage.setItem("bank-info", JSON.stringify(result.data));
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
        },
        async editProfile(id) {
            let result = await axios.put(`${baseAPI}/pegawai/` + id, {
                nama: this.nama,
                no_hp: this.no_telp,
                no_ktp: this.no_ktp,
                gender: this.jenis_kelamin,
                tempat_lahir: this.tempat_lahir,
                tanggal_lahir: this.tanggal_lahir,
                alamat: this.alamat,
            }, { withCredentials: true });
            if (result.status === 200) {
                const Toast = this.$swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true,
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Edit Successfull!'
                })
                localStorage.setItem("bank-info", JSON.stringify(result.data));
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
        },
        async validasi() {
            const btn_submit = document.querySelector("#btn_submit")
            const btn_edit = document.querySelector("#btn_edit")

            var akun = await axios.get(`${baseAPI}/userInfo/pegawai`, {withCredentials: true})
            if (akun.status === 200) {
                btn_submit.classList.add("hidden")
                btn_edit.classList.remove("hidden")
            } 
        }
    }
}
</script>

<style scoped>
/*===== Hero Section =====*/
#profile {
    width: 100%;
    height: 30vh;
    background: url("../assets/bg-u.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#profile:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#profile .l-container {
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

#profile h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 786px) {
    #profile h2 {
        font-size: 26px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

/*===== Background Color =====*/
#user-data {
    background: #f1f1f1;
}

/*===== Main Section =====*/
#error {
    font-size: 12px;
    color: red;
}

.hidden {
  display: none;
}

#user-data .nav-link {
    color: #000;
    margin-bottom: 5px;
}

#user-data .nav-link:hover {
    color: #FFB037;
}

#user-data .tabs span {
    color: #000;
    font-size: 18px;
}

#user-data .tabs i {
    font-size: 50px;
    margin: 10px;
    display: block;
}

#user-data .nav-pills .nav-link.active {
    color: #000;
    background: #FFB037;
    border: 2px solid #000;
}

#v-pills-tab {
    padding-right: 10px;
}

#containers1 {
    width: 785px;
    background-color: #fff;
    padding: 25px 30px;
    border-radius: 5px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}

#containers1 .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}
  
#containers1 .title::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

.content .user-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

.user-details .input-box {
    margin-bottom: 15px;
    width: calc(100% / 2 - 20px);
}

.input-box span.details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}

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
.user-details .input-box select:focus {
    border-color: #FFB037;
}

.button{
    height: 45px;
    margin: 35px 0;
}
  
.button input {
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
    text-align: center;
}
  
.button input:hover {
    background: #ffc955;
}

/*===== Large Laptop/PC Responsive  */
@media (min-width: 1440px) {
    #containers1 {
        width: 1035px;
    }

    #user-data .tabs {
        width: 200px;
    }
}

/*===== Tablet Responsive  */
@media (min-width: 768px) and (max-width: 900px) {
    #v-pills-profile-tab{
        width: 220px;
        margin: 0 5px;
    }

    #v-pills-tab {
        padding: 0;
        margin-bottom: 10px;
        margin-left: 3px;
        margin-right: 0 !important;
    }

    #user-data .tabs i {
        font-size: 20px;
        display: inline;
    }

    #containers1 {
        width: 100%;
    }
}

/*===== Phone L Responsive  */
@media (min-width: 425px) and (max-width: 600px) {
    .user-details .input-box {
        margin-bottom: 15px;
        width: 100%;
    }

    #v-pills-profile-tab {
        width: 128.5px;
        height: 40px;
        margin: 0 2px;
        padding: 0;
    }

    #v-pills-tab {
        padding: 0;
        margin-bottom: 10px;
        margin-left: 2px;
        margin-right: 0 !important;
    }

    #user-data .tabs span {
        font-size: 16px;
    }

    #user-data .tabs i {
        display: inline;
        font-size: 16px;
    }

    #containers1 {
        width: 100%;
    }
 
    #btn-delete {
        font-size: 16px;
    }

    #btn-bank {
        width: 150px;
        height: 40px;
        font-size: 16px;
        padding: 8px 0;
    }

    .button input {
        font-size: 17px;
    }
}

/*===== Phone M Responsive  */
@media (min-width: 350px) and (max-width: 424px) {
    .user-details .input-box {
        margin-bottom: 15px;
        width: 100%;
    }

    #v-pills-profile-tab {
        width: 114px;
        height: 40px;
        margin: 0 1px;
        padding: 0;
    }

    #v-pills-tab {
        padding: 0;
        margin-bottom: 10px;
        margin-left: 2px;
        margin-right: 0 !important;
    }

    #user-data .tabs span {
        font-size: 16px;
    }

    #user-data .tabs i {
        display: none;
    }

    #containers1 {
        width: 100%;
    }

    #btn-delete {
        font-size: 16px;
    }

    #btn-bank {
        width: 150px;
        height: 40px;
        font-size: 15px;
        padding: 9px 0;
    }

    .button input {
       font-size: 16px;
    }
}

/*===== Phone S Responsive  */
@media (max-width: 374px) {
    .user-details .input-box {
        margin-bottom: 15px;
        width: 100%;
    }

    #v-pills-profile-tab {
        width: 96px;
        height: 40px;
        margin: 0 1px;
        padding: 0;
    }

    #v-pills-tab {
        padding: 0;
        margin-bottom: 10px;
        margin-left: 2px;
        margin-right: 0 !important;
    }

    #user-data .tabs span {
        font-size: 15px;
    }

    #user-data .tabs i {
        display: none;
    }

    #containers1 {
        width: 100%;
    }

    .button input {
       font-size: 13px;
    }
}
</style>