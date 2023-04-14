<template>
  <Header />
    <!-- ====== Hero Section ====== -->
    <section id="h-anggota" class="h-anggota">
        <div class="l-container">
            <h2>Anggota <b>E-COOP<span>.</span></b></h2><br>
        </div>
    </section>

    <main id="main" class="main">
        <section id="table-anggota" class="table-anggota">
            <div class="container">
                <h2><b><i>Daftar Anggota</i></b></h2>
                <br />
                <div class="table-bank">
                    <table id="bank" class="table">
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
                                    <button href="" class="btn-decline"><i class="fa-solid fa-file-circle-xmark" v-on:click="decline(item.id)"></i></button>
                                    <button href="" class="btn-accept" ><i class="fa-solid fa-file-circle-check" v-on:click="accept(item.id)"></i></button>
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
    name: 'Anggota',
    components : {
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
            } else if (acc.data.data.role === 4) { // Member
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
            let anggota = await axios.get(`${baseAPI}/anggota`, {withCredentials: true});
            this.anggota = anggota.data.data;
        },
        async decline(id) {
            let result = await axios.put(`${baseAPI}/anggota/` + id, {
                is_staff: 0,
            }, { withCredentials: true });
            console.log(result);
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
                    title: 'Anggota Ditolak!'
                })
                // setTimeout(location.reload.bind(location), 1000);
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
                    title: 'Penolakan Gagal!'
                })
            }
        },
        async accept(id) {
            let result = await axios.put(`${baseAPI}/anggota/` + id, {
                is_staff: 1,
            }, { withCredentials: true });
            console.log(result);
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
                    title: 'Anggota Diterima!'
                })
                // setTimeout(location.reload.bind(location), 1000);
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
                    title: 'Penolakan Gagal!'
                })
            }
        },
        async showInfo(id) {
            let anggota = await axios.get(`${baseAPI}/anggota?search=` + id, {withCredentials: true});
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
}
</script>

<style scoped>
/*===== Hero Section =====*/
#h-anggota {
    width: 100%;
    height: 33vh;
    background: url("../assets/bg-da.jpg") top center;
    background-size: cover;
    position: relative;
    z-index: 1;
    box-shadow: 2px 0 35px 0 rgba(68, 88, 144, 0.5);
}

#h-anggota:before {
    content: "";
    background: rgba(0, 0, 0, 0.6);
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    right: 0;
}

#h-anggota .l-container {
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

#h-anggota h2 {
    color: #fff;
    font-size: 40px;
    max-width: 80%;
}

@media (max-width: 786px) {
    #h-anggota h2 {
        font-size: 26px;
        line-height: 24px;
        margin-bottom: 30px;
    }
}

/*===== Main Section =====*/
.btn-decline,
.btn-accept {
    border: none;
    background: transparent;
}

.btn-decline i,
.btn-accept i {
    color: #000;
    font-size: 18px;
}

.btn-decline i:hover,
.btn-accept i:hover {
    color: #FFB037;
}
</style>