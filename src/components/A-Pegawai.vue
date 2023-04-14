<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Daftar Pegawai</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Pegawai</li>
                </ol>
            </nav>
        </div>

        <section>
            <!--===== Table Daftar Pegawai =====-->
            <div class="card card-pegawai">
                <div class="table-bank">
                    <table id="bank" class="table table-striped responsive nowrap table-hover">
                        <thead>
                            <tr>
                                <th>No Pegawai</th>
                                <th>Jabatan</th>
                                <th>Nama</th>
                                <th>No Telpon</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th class="action">Action</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr v-for="item in pegawai" :key="item.id">
                                <td>{{ item.no_pegawai }}</td>
                                <td>{{ item.m_jabatan?.jabatan ?? 'Kosong' }}</td>
                                <td>{{ item.nama }}</td>
                                <td>{{ item.no_hp }}</td>
                                <td>{{ item.email }}</td>
                                <td>{{ item.gender }}</td>
                                <td class="action">
                                    <div id="jabatan" class="jabatan">
                                        <button id="btn-pimpinan" v-on:click="pimpinan(item.id, item.email)"><i class="fa-solid fa-p"></i></button>
                                        <button id="btn-staff" v-on:click="staff(item.id, item.email)"><i class="fa-solid fa-s"></i></button>
                                    </div>
                                    <button id="btn-info" v-on:click="showInfo(item.id)"><i class="fa-solid fa-circle-info"></i></button>
                                    <button id="btn-delete" v-on:click="deletePegawai(item.id)"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
    name: "A-Pegawai",
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

        this.getPegawai();
        this.getJabatan();
    },
    data() {
        return {
            pegawai: [],

            id_jabatan: "",
            position: [],
            jabatan: ""
        }
    },
    methods: {
        async getJabatan() {
            let jabatan = await axios.get(`${baseAPI}/jabatan`, {withCredentials: true});
            this.position = jabatan.data.data;

        },
        async getPegawai() {
            let pegawai = await axios.get(`${baseAPI}/pegawai`);
            this.pegawai = pegawai.data.data;
        },
        async deletePegawai(id) {
            let result = await axios.delete(`${baseAPI}/pegawai/` + id);
            if (result.status === 200) {
                this.getPegawai();
            }
        },
        async showInfo(id) {
            let pegawai = await axios.get(`${baseAPI}/pegawai?search=` + id, {withCredentials: true});
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
                                <h5 class="modal-title" id="staticBackdropLabel">Datails for ${pegawai.data.data[0].nama}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>No Pegawai : ${pegawai.data.data[0].no_pegawai} </p>
                                <p>Jabatan : ${pegawai.data.data[0].m_jabatan.jabatan} </p>
                                <p>Nama : ${pegawai.data.data[0].nama} </p>
                                <p>No Telpon : ${pegawai.data.data[0].no_hp} </p>
                                <p>Email : ${pegawai.data.data[0].email} </p>
                                <p>Gender : ${pegawai.data.data[0].gender} </p>
                                <p>Tempat Lahir : ${pegawai.data.data[0].tempat_lahir} </p>
                                <p>Tanggal Lahir : ${pegawai.data.data[0].tanggal_lahir} </p>
                                <p>Alamat : ${pegawai.data.data[0].alamat} </p>
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
        async pimpinan(id, email) {
            let result = await axios.put(`${baseAPI}/pegawai/` + id, {
                email: email,
                jabatan_id: 1,
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
        },
        async staff(id, email) {
            let result = await axios.put(`${baseAPI}/pegawai/` + id, {
                email: email,
                jabatan_id: 2,
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

.container {
    background: #fff;
    border-radius: 10px;
    padding: 15px;
}

div .hidden {
    display: none;
}

/* Table Section */
.card-pegawai {
    padding: 10px;
    background: #fff;
    border: none;
    width: 100%;
}

.jabatan {
    display: inline;
}

#btn-pimpinan,
#btn-staff,
#btn-delete,
#btn-info {
    font-size: 20px;
    margin: 5px;
    color: #000;
    cursor: pointer;
    border: none;
    background: transparent;
}
#btn-pimpinan:hover,
#btn-staff:hover,
#btn-delete:hover,
#btn-info:hover {
    color : #FFB037;
}

table {
    text-align: center;
}
</style>