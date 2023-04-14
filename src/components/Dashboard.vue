<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row info">

                        <div class="col-xxl-3 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <router-link to="/a-pegawai"><h5 class="card-title">Total Pegawai</h5></router-link>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-user-tie"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_pegawai }} Orang</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-3 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <router-link to="a-anggota"><h5 class="card-title">Total Anggota</h5></router-link>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-users"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_anggota }} Orang</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-3 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <router-link to="a-simpanan"><h5 class="card-title">Total Simpanan</h5></router-link>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-safe2-fill"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_simpanan }} Record</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-3 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <router-link to="a-pinjaman"><h5 class="card-title">Total Pinjaman</h5></router-link>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-hand-holding-dollar"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_pinjaman }} Record</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col col-md-6">
                            <div class="card info-card line-2">
                                <div class="card-body">
                                    <h5 class="card-title">Total Rekening Koperasi</h5>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-regular fa-credit-card"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_rekening }} Record</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col col-md-6">
                            <div class="card info-card line-2">
                                <div class="card-body">
                                    <h5 class="card-title">Total Nama Bank</h5>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-building-columns"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_nama_bank }} Record</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <div class="col rekening-bank">
                        <!--===== Table Rekening Bank =====-->
                        <div class="card card-bank">
                            <div class="table-bank">
                                <div id="btn-rekening">
                                    <a class="form-modal" data-bs-toggle="modal" data-bs-target="#inputRekening"><i class="bi bi-safe2"></i> Tambah Bank Koperasi</a>
                                </div>
                                <table id="bank" class="table table-striped responsive nowrap table-hover">
                                    <thead>
                                        <tr>
                                            <th>Bank Koperasi</th>
                                            <th>Nama Pemilik Bank</th>
                                            <th class="action">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr v-for="item in rekening" :key="item.id">
                                            <td>{{ item.namaBank.nama_bank }}</td>
                                            <td>{{ item.nama_pemilik_bank }}</td>
                                            <td class="action">
                                                <button id="btn-info" v-on:click="showInfo(item.id)"><i class="fa-solid fa-circle-info"></i></button>
                                                <button id="btn-delete" v-on:click="deleteRekening(item.id)"><i class="fa-solid fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col nama-bank">
                        <!--===== Table Nama Bank =====-->
                        <div class="card card-nama">
                            <div class="table-bank">
                                <div id="btn-bank">
                                    <a class="form-modal" data-bs-toggle="modal" data-bs-target="#inputBank"><i class="bi bi-safe2"></i> Tambah Nama Bank</a>
                                </div>
                                <table id="bank" class="table table-striped responsive nowrap table-hover">
                                    <thead>
                                        <tr>
                                            <th>Daftar Nama Bank</th>
                                            <!-- <th class="action">Action</th> -->
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr v-for="item in nama_bank" :key="item.id">
                                            <td>{{ item.nama_bank }}</td>
                                            <!-- <td class="action">
                                                <button id="btn-delete" v-on:click="deleteNamaBank(item.id)"><i class="fa-solid fa-trash"></i></button>
                                            </td> -->
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--===== Modal Rekening Bank =====-->
            <div class="modal fade" id="inputRekening" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title">Masukan Bank Koperasi</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form>
                            <div class="modal-body">
                                <div class="bank-details">
                                    <div class="input-box">
                                        <span class="details">Bank</span>
                                        <select class="form-select" v-model="id_bank">
                                            <option v-for="item in nama_bank" :key="item.id" :value="item.id">
                                                {{ item.nama_bank }}
                                            </option>
                                        </select>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Nomor Rekening</span>
                                        <input type="text" placeholder="Masukan No Rekening" required v-model="no_rek">
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Nama Pemilik</span>
                                        <input type="text" placeholder="Masukan Nama Pemilik" required v-model="pemilik">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-submit" v-on:click="submitRekening">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--===== Modal Nama Bank =====-->
            <div class="modal fade" id="inputBank" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title">Masukan Bank Koperasi</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form>
                            <div class="modal-body">
                                <div class="bank-details">
                                    <div class="input-box">
                                        <span class="details">Bank</span>
                                        <input type="text" placeholder="Masukan Bank" required v-model="nama">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-submit" v-on:click="submitNamaBank">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</template>

<script>
import axios from 'axios'
import Sidebar from './Sidebar.vue'
import { baseAPI } from "../api.js"
export default {
    name: "Dashboard",
    components : {
        Sidebar
    },
    async mounted() {

        var kuki = $cookies.get("jwt")
        if (!kuki) {
            this.$router.push({name : 'Home'})
        }

        var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
        if(acc) { // Login        
            if (acc.data.data.role === 2 || acc.data.data.role === 3 || acc.data.data.role === 4 ) { // Pimpinan, Staff & Member
                this.$router.push({name : 'Home'})
            } 
        } 

        this.getRekening();
        this.getNamaBank();
        this.getDataPegawai();
        this.getDataAnggota();
        this.getDataSimpanan();
        this.getDataPinjaman();
        this.getDataRekening();
        this.getDataNamaBank();
    },
    data() {
        return {
            nama: "",
            
            id_bank: "",
            no_rek: "",
            pemilik: "",

            rekening: [],
            nama_bank: [],
            data_pegawai: "",
            data_anggota: "",
            data_simpanan: "",
            data_pinjaman: "",
            data_rekening: "",
            data_nama_bank: ""
        };
    },
    methods: {
        async getDataPegawai() {
            let pegawai = await axios.get(`${baseAPI}/pegawai`);
            this.data_pegawai = pegawai.data.totalRows;
        },
        async getDataAnggota() {
            let anggota = await axios.get(`${baseAPI}/anggota`, { withCredentials: true});
            this.data_anggota = anggota.data.totalRows;
        },
        async getDataSimpanan() {
            let simpanan = await axios.get(`${baseAPI}/simpan`, { withCredentials: true});
            this.data_simpanan = simpanan.data.totalRows;
        },
        async getDataPinjaman() {
            let pinjaman = await axios.get(`${baseAPI}/pinjam`, { withCredentials: true});
            this.data_pinjaman = pinjaman.data.totalRows;
        },
        async getDataRekening() {
            let r_bank = await axios.get(`${baseAPI}/bank?search=2`, {withCredentials: true});
            this.data_rekening = r_bank.data.totalRows;
        },
        async getDataNamaBank() {
            let n_bank = await axios.get(`${baseAPI}/namaBank`);
            this.data_nama_bank = n_bank.data.totalRows;
        },
        async getNamaBank() {
            let n_bank = await axios.get(`${baseAPI}/namaBank`);
            this.nama_bank = n_bank.data.data;
        },
        async submitNamaBank() {
            let result = await axios.post(`${baseAPI}/namaBank`, {
                nama_bank: this.nama
            }, {withCredentials: true});
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
                localStorage.setItem("namaBank-info", JSON.stringify(result.data));
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
        async deleteNamaBank(id) {
            let result = await axios.delete(`${baseAPI}/namaBank/` + id, {withCredentials: true});
            if (result.status === 200) {
                location.reload();
            }
        },
        async getRekening() {
            let r_bank = await axios.get(`${baseAPI}/bank?search=2`, {withCredentials: true});
            this.rekening = r_bank.data.data;
        },
        async submitRekening() {
            let result = await axios.post(`${baseAPI}/bank`, {
                nama_bank_id: this.id_bank,
                no_rek: this.no_rek,
                nama_pemilik_bank: this.pemilik, 
                jenis_kepemilikan_id: 2
            }, {withCredentials: true});
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
                localStorage.setItem("rekening-info", JSON.stringify(result.data));
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
        async deleteRekening(id) {
            let result = await axios.delete(`${baseAPI}/bank/` + id, {withCredentials: true});
            if (result.status === 200) {
                location.reload();
            }
        },
        async showInfo(id) {
            let a_bank = await axios.get(`${baseAPI}/bank?Id=` + id, {withCredentials: true});
            var modalWrap = null;
            if (modalWrap !== null) {
                modalWrap.remove();
            }

            modalWrap = document.createElement('div');
            modalWrap.innerHTML = `
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Info Bank ${a_bank.data.data[0].namaBank.nama_bank}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Bank : ${a_bank.data.data[0].namaBank.nama_bank} </p>
                                <p>No Rekening : ${a_bank.data.data[0].no_rek} </p>
                                <p>Nama Pemilik : ${a_bank.data.data[0].nama_pemilik_bank} </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            document.body.append(modalWrap);

            var modal = new bootstrap.Modal(modalWrap.querySelector('.modal'));
            modal.show();
        },
    }
};
</script>

<style scoped>
/*===== Page Title =====*/
.pagetitle {
    margin: 10px 0;
}

.pagetitle h1 {
    font-size: 24px;
    margin-bottom: 0;
    font-weight: 600;
    color: #ff9900;
}

.breadcrumb-item.active {
    color: #ff9900;
}

/*===== Main =====*/
#error {
    font-size: 12px;
    color: red;
}

#main {
    height: 100vh;
    padding: 20px 30px;
    transition: all 0.3s;
    background: #F7F5F2;
}

@media (max-width: 1199px) {
  #main {
    padding: 20px;
  }
}

@media (min-width: 1200px) {
    #main,
    #footer {
        margin-left: 300px;
    }
}

section {
    padding: 20px 0;
}

a {
    color: #212529;
}

/* Info Cards */
.dashboard .info-card {
    padding-bottom: 10px;
    border: none;
}

.dashboard .info-card h6 {
    font-size: 28px;
    color: #444;
    font-weight: 700;
    margin: 0;
    padding: 0;
}

.dashboard .card-icon {
    font-size: 32px;
    line-height: 0;
    width: 64px;
    height: 64px;
    flex-shrink: 0;
    flex-grow: 0;
}

.dashboard .card-icon {
    color: #ff9900;
    background: #ffecdf;
}

.info {
    width: 1200px;
}

.info a:hover{
    color: #ff9900;
}

.card-title {
    margin-bottom: 20px;
}

.card-title::before {
    content: "";
    position: absolute;
    left: 15px;
    top: 40px;
    height: 4px;
    width: 70px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

/* Bank Section */
.rekening-bank {
    display: inline-block;
    margin-right: 12px;
}

.nama-bank {
    display: inline-block;
    margin-left: 12px;
}

.card-bank {
    margin-top: 24px;
    padding: 10px;
    background: #fff;
    border: none;
    width: 776px;
}

.card-nama {
    margin-top: 24px;
    padding: 10px;
    background: #fff;
    border: none;
    width: 370px;
}


#btn-rekening {
    width: 250px;
    height: 50px;
    font-size: 18px;
    background: #FFB037;
    text-align: center;
    border-radius: 5px;
    padding: 12px 0;
    margin-bottom: 10px;
    cursor: pointer;
}

#btn-bank {
    width: 225px;
    height: 50px;
    font-size: 18px;
    background: #FFB037;
    text-align: center;
    border-radius: 5px;
    padding: 12px 0;
    margin-bottom: 10px;
    cursor: pointer;
}

#btn-bank a {
    color: #000;
}

#btn-delete,
#btn-info {
    font-size: 20px;
    margin: 5px;
    color: #000;
    cursor: pointer;
    border: none;
    background: transparent;
}

#btn-delete:hover,
#btn-info:hover {
    color : #FFB037;
}

#bank .action {
    text-align: center;
}

#inputRekening .title,
#inputBank .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

#inputRekening .title::before,
#inputBank .title::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

form .bank-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

form .bank-details .input-box {
    margin-bottom: 15px;
    width: 90%;
    margin-right: auto;
    margin-left: auto;
}

form .input-box span.details {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
}

.bank-details .input-box input, select {
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

.bank-details .input-box input:focus,
.bank-details .input-box select:focus {
    border-color: #FFB037;
}

form .button{
    height: 45px;
    margin: 35px 0;
}
  
form .button input {
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

#inputRekening .btn-submit,
#inputBank .btn-submit {
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

div #btn-bank:hover,
#inputBank .btn-submit:hover {
    background: #ffc955;
}

select:focus>option:checked {
  background: #ffc955 !important;
}

.line-2 {
    margin-top: 24px;
    width: 576px;
}
</style>