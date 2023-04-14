<template>
    <Header />
    <!-- ====== Hero Section ====== -->
    <section id="h-pengajuan" class="h-pengajuan">
        <div class="l-container">
            <h2>Pengajuan Pinjaman <b>E-COOP<span>.</span></b></h2><br>
        </div>
    </section>

    <main id="main" class="main">
        <!--===== Table Section =====-->
        <section id="table-psimpan" class="table-psimpan">
            <div class="container">
                <h2><b><i>Daftar Pengajuan Pinjaman</i></b></h2>
                <br />
                <table class="table table-striped responsive nowrap table-hover staff">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>No Pinjaman</th>
                            <th>Nama</th>
                            <th>Jumlah</th>
                            <th>Jangka</th>
                            <th>Tujuan Meminjam</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <tr v-for="item in pinjaman" :key="item.id">
                            <td>{{ item.id }}</td>
                            <td>{{ item.no_pinjam }}</td>
                            <td>{{ item.created_by }}</td>
                            <td>Rp. {{ item.jumlah }}</td>
                            <td>{{ this.bulan }} Bulan</td>
                            <td>{{ item.tujuan }}</td>
                            <td>
                                <button href="" class="btn-accept" v-on:click="ajukan(item.id)"><i class="fa-solid fa-file-circle-check"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-striped responsive nowrap table-hover pimpinan">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Id Pinjaman</th>
                            <th>Nama Staff</th>
                            <th>Jumlah</th>
                            <th>Tujuan Meminjam</th>
                            <th>Tanggal Meminjam</th>
                            <th>Tanggal Pengajuan</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <tr v-for="item in permohonan" :key="item.id">
                            <td>{{ item.id }}</td>
                            <td>{{ item.pinjam_id }}</td>
                            <td>{{ item.created_by }}</td>
                            <td>Rp. {{ item.t_pinjam.jumlah }}</td>
                            <td>{{ item.t_pinjam.tujuan }}</td>
                            <td>{{ item.t_pinjam.tanggal_pinjam }}</td>
                            <td>{{ item.tanggal_persetujuan}}</td>
                            <td>
                                <button href="" class="btn-decline" v-on:click="tolak(item.id)"><i class="fa-solid fa-file-circle-xmark"></i></button>
                                <button href="" class="btn-accept" v-on:click="terima(item.id)"><i class="fa-solid fa-file-circle-check"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <Footer />
</template>

<script>
import axios from 'axios'
import Header from './Header.vue'
import Footer from './Footer.vue'
import moment from 'moment'
import { baseAPI } from "../api.js"
export default {
    name: 'Pengajuan',
    components : {
        Header,
        Footer
    },
    data() {
        return {
            id_pinjam: null,
            bulan: 0,
            pinjaman: [],
            permohonan: [],

            id_pegawai: 0,
        }
    },
    async mounted() {
        window.scrollTo(0,0)

        var kuki = $cookies.get("jwt")
        if (!kuki) {
            this.$router.push({name : 'Home'})
        }

        var pimpinan = document.querySelector(".pimpinan")
        var staff = document.querySelector(".staff") 
        var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
        if(acc) { // Login        
            if (acc.data.data.role === 1 ) { // Admin
                this.$router.push({name : 'Dashboard'})
            } else if (acc.data.data.role === 2) { // Pimpinan
                staff.classList.add("hidden")
            } else if (acc.data.data.role === 3) { //Staff
                pimpinan.classList.add("hidden")
            } else if (acc.data.data.role === 4) { // Member
                this.$router.push({name : 'Home'})
            }
        }

        this.getPegawai();
        this.getPinjaman();
        this.getPermohonan();
    },
    methods: {
        async getPegawai() {
            var pegawai = await axios.get(`${baseAPI}/userInfo/pegawai`, {withCredentials: true})
            this.id_pegawai = pegawai.data.data.id
        },
        async getPinjaman() {
            try {
                const pinjam = await axios.get(`${baseAPI}/pinjam?isA=0`, {withCredentials: true}); 
                this.pinjaman = pinjam.data.data
                this.id_pinjam = pinjam.data.data[0].id

                var a = new moment(pinjam.data.data[0].tanggal_pengembalian)
                var b = new moment(pinjam.data.data[0].tanggal_pinjam)

                this.bulan = a.diff(b, 'months');
            } catch (error) {
                console.log(error);
            }
        },
        async getPermohonan() {
            let permohonan =  await axios.get(`${baseAPI}/permohonan?isW=1`, { withCredentials: true})
            this.permohonan = permohonan.data.data

        },
        async ajukan(id) {
            const result = await axios.post(`${baseAPI}/permohonan`, {
                pinjam_id: id,
                alasan: "Diterima Staff",
                cond: 1
            }, { withCredentials: true } )
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
        async terima(id) {
            const result = await axios.put(`${baseAPI}/permohonan/` + id, {
                alasan: "Diterima Pimpinan",
                cond: 2,
            }, {withCredentials: true} )
            console.log(result.status);
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
                    title: 'Pinjaman Diterima!'
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
        },
        async tolak(id){
            const result = await axios.put(`${baseAPI}/permohonan` + id, {
                alasan: "Ditolak Pimpinan",
                cond: 3,
            }, {withCredentials: true} )
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
                    title: 'Pinjaman Ditolak!'
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
        }
    },
};
</script>

<style scoped>
/*===== Hero Section =====*/
#h-pengajuan {
    width: 100%;
    height: 33vh;
    background: url("../assets/bg-pj.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#h-pengajuan:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#h-pengajuan .l-container {
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

#h-pengajuan h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 786px) {
    #h-pengajuan h2 {
        font-size: 26px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

/*===== Main Section =====*/
.hidden {
    display: none;
}

.btn-decline,
.btn-accept {
    border: none;
    background: transparent;
}

.btn-decline i,
.btn-accept i {
    margin: 0 5px;
    color: #000;
    font-size: 18px;
}

.btn-decline i:hover,
.btn-accept i:hover {
    color: #FFB037;
}

table {
    text-align: center;
}

#tolakPengajuan .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

#tolakPengajuan .title::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

.content .form-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

.form-details .input-box {
    margin-bottom: 15px;
    width: 90%;
    margin-right: auto;
    margin-left: auto;
}

.input-box span.details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}

.form-details .input-box input, select{
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

.form-details .input-box select:focus {
    border-color: #FFB037;
}

#tolakPengajuan .btn-submit {
    height: 100%;
    width: 60%;
    border-radius: 5px;
    border: none;
    color: #000000;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    background: #FFB037;
    margin-left: auto;
    margin-right: auto;
}

#tolakPengajuan .btn-submit:hover {
    background: #ffc955;
}
</style>