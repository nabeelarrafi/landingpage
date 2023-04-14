<template>
    <Header />
    <!-- ====== Hero Section ====== -->
    <section id="h-pegawai" class="h-pegawai">
        <div class="l-container">
            <h2>Pegawai <b>E-COOP<span>.</span></b></h2><br>
        </div>
    </section>

    <main id="main" class="main">
        <section id="table-pegawai" class="table-pegawai">
            <div class="container">
                <h2><b><i>Daftar Pegawai</i></b></h2>
                <br />
                <div class="table-bank">
                    <table id="bank" class="table">
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
    <Footer />
</template>

<script>
import axios from 'axios'
import Header from './Header.vue'
import Footer from './Footer.vue'
import { baseAPI } from "../api.js"
export default {
    name: 'Pegawai',
    components: {
        Header,
        Footer
    },
    async mounted() {
        window.scrollTo(0,0)

        var kuki = $cookies.get("jwt")
        if (!kuki) {
            this.$router.push({name : 'Home'})
        }

        var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
        if(acc) { // Login        
            if (acc.data.data.role === 1 ) { // Admin
                this.$router.push({name : 'Dashboard'})
            } else if (acc.data.data.role === 3 || acc.data.data.role === 4) { // Staff & Member
                this.$router.push({name : 'Home'})
            }
        } 

        this.getPegawai();
    },
    data() {
        return {
            pegawai: []
        }
    },
    methods: {
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
        }
    }
}
</script>

<style>
/*===== Hero Section =====*/
#h-pegawai {
    width: 100%;
    height: 33vh;
    background: url("../assets/bg-dp.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#h-pegawai:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#h-pegawai .l-container {
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

#h-pegawai h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 786px) {
    #h-pegawai h2 {
        font-size: 26px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

/* Table Section */
#btn-info {
    font-size: 20px;
    margin: 5px;
    color: #000;
    cursor: pointer;
    border: none;
    background: transparent;
}

#btn-info:hover {
    color : #FFB037;
}

.action {
    text-align: center;
}
</style>