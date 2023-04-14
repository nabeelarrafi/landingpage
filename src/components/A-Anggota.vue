<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Daftar Anggota</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Anggota</li>
                </ol>
            </nav>
        </div>

        <section>
            <!--===== Table Daftar Anggota =====-->
            <div class="card card-pegawai">
                <div class="table-bank">
                    <table id="bank" class="table table-striped responsive nowrap table-hover">
                        <thead>
                            <tr>
                                <th>No Anggota</th>
                                <th>Nama</th>
                                <th>Pekerjaan</th>
                                <th>No Telpon</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th class="action">Action</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr v-for="item in anggota" :key="item.id">
                                <td>{{ item.no_anggota }}</td>
                                <td>{{ item.nama }}</td>
                                <td>{{ item.m_pekerjaan.pekerjaan }}</td>
                                <td>{{ item.no_hp }}</td>
                                <td>{{ item.email }}</td>
                                <td>{{ item.gender }}</td>
                                <td class="action">
                                    <button id="btn-info" v-on:click="showInfo(item.id)"><i class="fa-solid fa-circle-info"></i></button>
                                    <!-- <button id="btn-delete" v-on:click="deletePegawai(item.id)"><i class="fa-solid fa-trash"></i></button> -->
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
    name: "A-Anggota",
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

        this.getAnggota();
    },
    data() {
        return {
            anggota: []
        }
    },
    methods: {
        async getAnggota() {
            let anggota = await axios.get(`${baseAPI}/anggota`, { withCredentials: true});
            this.anggota = anggota.data.data;
        },
        async deleteAnggota(id) {
            let result = await axios.delete(`${baseAPI}/anggota/` + id);
            if (result.status === 200) {
                this.getAnggota();
            }
        },
        async showInfo(id) {
            let anggota = await axios.get(`${baseAPI}/anggota?Id=` + id, {withCredentials: true});
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
                                <h5 class="modal-title" id="staticBackdropLabel">Datails for ${anggota.data.data[0].nama}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>No Pegawai : ${anggota.data.data[0].no_pegawai} </p>
                                <p>Nama : ${anggota.data.data[0].nama} </p>
                                <p>Jabatan : ${anggota.data.data[0].m_pekerjaan.pekerjaan} </p>
                                <p>No Telpon : ${anggota.data.data[0].no_hp} </p>
                                <p>Email : ${anggota.data.data[0].email} </p>
                                <p>Gender : ${anggota.data.data[0].gender} </p>
                                <p>No KTP : ${anggota.data.data[0].no_ktp} </p>
                                <p>Tempat Lahir : ${anggota.data.data[0].tempat_lahir} </p>
                                <p>Tanggal Lahir : ${anggota.data.data[0].tanggal_lahir} </p>
                                <p>Alamat : ${anggota.data.data[0].alamat} </p>
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

/* Table Section */
.card-pegawai {
    padding: 10px;
    background: #fff;
    border: none;
    width: 100%;
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
</style>