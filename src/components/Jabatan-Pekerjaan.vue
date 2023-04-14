<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Daftar Jabatan & Pekerjaan</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Jabatan & Pekerjaan</li>
                </ol>
            </nav>
        </div>

        <section class="section jabatan-pekerjaan">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row info">

                        <div class="col-xxl-6 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <h5 class="card-title">Total Data Pekerjaan</h5>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-regular fa-id-card"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_pekerjaan }} Data</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-6 col-md-6">
                            <div class="card info-card">
                                <div class="card-body">
                                    <h5 class="card-title">Total Data Jabatan</h5>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-clipboard-user"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{ data_jabatan }} Data</h6>
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

                    <div class="col pekerjaan">
                        <!--===== Table Pekerjaan =====-->
                        <div class="card card-pekerjaan">
                            <div class="table-pekerjaan">
                                <div id="btn-pekerjaan">
                                    <a class="form-modal" data-bs-toggle="modal" data-bs-target="#inputPekerjaan"><i class="fa-regular fa-id-card"></i> Tambah Pekerjaan</a>
                                </div>
                                <table id="pekerjaan" class="table table-striped responsive nowrap table-hover">
                                    <thead>
                                        <tr>
                                            <th>Pekerjaan</th>
                                            <th class="action">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr v-for="item in job" :key="item.id">
                                            <td>{{ item.pekerjaan }}</td>
                                            <td class="action">
                                                <button id="btn-info" v-on:click="showPekerjaan(item.id)"><i class="fa-solid fa-circle-info"></i></button>
                                                <button id="btn-delete" v-on:click="deletePekerjaan(item.id)"><i class="fa-solid fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col jabatan">
                        <!--===== Table Jabatan =====-->
                        <div class="card card-jabatan">
                            <div class="table-jabatan">
                                <div id="btn-jabatan">
                                    <a class="form-modal" data-bs-toggle="modal" data-bs-target="#inputJabatan"><i class="fa-solid fa-clipboard-user"></i> Tambah Jabatan</a>
                                </div>
                                <table id="jabatan" class="table table-striped responsive nowrap table-hover">
                                    <thead>
                                        <tr>
                                            <th>Jabatan</th>
                                            <th class="action">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <tr v-for="item in position" :key="item.id">
                                            <td>{{ item.jabatan }}</td>
                                            <td class="action">
                                                <button id="btn-info" v-on:click="showJabatan(item.id)"><i class="fa-solid fa-circle-info"></i></button>
                                                <button id="btn-delete" v-on:click="deleteJabatan(item.id)"><i class="fa-solid fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--===== Modal Pekerjaan =====-->
            <div class="modal fade" id="inputPekerjaan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title">Masukan Pekerjaan</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form>
                            <div class="modal-body">
                                <div class="pekerjaan-details">
                                    <div class="input-box">
                                        <span class="details">Pekerjaan</span>
                                        <input type="text" placeholder="Masukan Pekerjaan" required v-model="pekerjaan">
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Deskripsi</span>
                                        <input type="text" placeholder="Masukan Deskripsi" required v-model="desc">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-submit" v-on:click="submitPekerjaan">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--===== Modal Jabatan =====-->
            <div class="modal fade" id="inputJabatan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title">Masukan Jabatan</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form>
                            <div class="modal-body">
                                <div class="jabatan-details">
                                    <div class="input-box">
                                        <span class="details">Jabatan</span>
                                        <input type="text" placeholder="Masukan Jabatan" required v-model="jabatan">
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Deskripsi</span>
                                        <input type="text" placeholder="Masukan Deskripsi" required v-model="desc">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-submit" v-on:click="submitJabatan">Submit</button>
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
    name: "Jabatan-Pekerjaan",
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

        this.getDataPekerjaan();
        this.getPekerjaan();
        this.getDataJabatan();
        this.getJabatan();
    },
    data() {
        return {
            pekerjaan: "",
            jabatan: "",
            desc: "",

            job: [],
            position: [],

            data_pekerjaan: [],
            data_jabatan: []
        };
    },
    methods: {
        async getDataPekerjaan() {
            let pekerjaan = await axios.get(`${baseAPI}/pekerjaan`);
            this.data_pekerjaan = pekerjaan.data.totalRows;
        },
        async getPekerjaan() {
            let pekerjaan = await axios.get(`${baseAPI}/pekerjaan`);
            this.job = pekerjaan.data.data;
        },
        async submitPekerjaan() {
            let result = await axios.post(`${baseAPI}/pekerjaan`, {
                pekerjaan: this.pekerjaan,
                desc: this.desc
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
        async deletePekerjaan(id) {
            let result = await axios.delete(`${baseAPI}/pekerjaan/` + id, {withCredentials: true});
            if (result.status === 200) {
                location.reload();
                this.getPekerjaan();
            }
        },
        async showPekerjaan(id) {
            let pekerjaan = await axios.get(`${baseAPI}/pekerjaan?search=` + id, {withCredentials: true});
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
                                <h5 class="modal-title" id="staticBackdropLabel">Info ${pekerjaan.data.data[0].pekerjaan}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Pekerjaan : ${pekerjaan.data.data[0].pekerjaan} </p>
                                <p>Deskripsi : ${pekerjaan.data.data[0].desc} </p>
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
        async getDataJabatan() {
            let jabatan = await axios.get(`${baseAPI}/jabatan`, {withCredentials: true});
            this.data_jabatan = jabatan.data.totalRows;
        },
        async getJabatan() {
            let jabatan = await axios.get(`${baseAPI}/jabatan`, {withCredentials: true});
            this.position = jabatan.data.data;
        },
        async submitJabatan() {
            let result = await axios.post(`${baseAPI}/jabatan`, {
                jabatan: this.jabatan,
                desc: this.desc
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
        async deleteJabatan(id) {
            let result = await axios.delete(`${baseAPI}/jabatan/` + id, {withCredentials: true});
            if (result.status === 200) {
                location.reload();
                this.getJabatan();
            }
        },
        async showJabatan(id) {
            let jabatan = await axios.get(`${baseAPI}/jabatan?search=` + id, {withCredentials: true});
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
                                <h5 class="modal-title" id="staticBackdropLabel">Info Bank ${jabatan.data.data[0].jabatan}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Id : ${jabatan.data.data[0].id} </p>
                                <p>Jabatan : ${jabatan.data.data[0].jabatan} </p>
                                <p>Deskripsi : ${jabatan.data.data[0].desc} </p>
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
.jabatan-pekerjaan .info-card {
    padding-bottom: 10px;
    border: none;
}

.jabatan-pekerjaan .info-card h6 {
    font-size: 28px;
    color: #444;
    font-weight: 700;
    margin: 0;
    padding: 0;
}

.jabatan-pekerjaan .card-icon {
    font-size: 32px;
    line-height: 0;
    width: 64px;
    height: 64px;
    flex-shrink: 0;
    flex-grow: 0;
}

.jabatan-pekerjaan .card-icon {
    color: #ff9900;
    background: #ffecdf;
}

.info {
    width: 1200px;
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

/* Table Section */
.pekerjaan {
    display: inline-block;
    margin-right: 9px;
}

.jabatan {
    display: inline-block;
    margin-left: 9px;
}

.card-pekerjaan {
    margin-top: 24px;
    padding: 10px;
    background: #fff;
    border: none;
    width: 576px;
}

.card-jabatan {
    margin-top: 24px;
    padding: 10px;
    background: #fff;
    border: none;
    width: 576px;
}

#btn-pekerjaan {
    width: 210px;
    height: 50px;
    font-size: 18px;
    background: #FFB037;
    text-align: center;
    border-radius: 5px;
    padding: 12px 0;
    margin-bottom: 10px;
    cursor: pointer;
}

#btn-jabatan {
    width: 195px;
    height: 50px;
    font-size: 18px;
    background: #FFB037;
    text-align: center;
    border-radius: 5px;
    padding: 12px 0;
    margin-bottom: 10px;
    cursor: pointer;
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

.action {
    text-align: center;
}

#inputPekerjaan .title,
#inputJabatan .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

#inputPekerjaan .title::before,
#inputJabatan .title::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

form .pekerjaan-details,
form .jabatan-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

form .pekerjaan-details .input-box,
form .jabatan-details .input-box {
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

.pekerjaan-details .input-box input, 
.jabatan-details .input-box input {
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

.pekerjaan-details .input-box input:focus,
.jabatan-details .input-box select:focus {
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

#inputPekerjaan .btn-submit,
#inputJabatan .btn-submit {
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

#btn-pekerjaan:hover,
#btn-jabatan:hover,
#inputPekerjaan .btn-submit:hover,
#inputJabatan .btn-submit:hover {
    background: #ffc955;
}
</style>