<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Data Pinjaman</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Pinjaman</li>
                </ol>
            </nav>
        </div>

        <section>
            <!--===== Table Daftar Simpanan =====-->
            <div class="card card-simpanan">
                <div class="table-simpanan">
                    <table id="simpanan" class="table table-striped responsive nowrap table-hover">
                        <thead>
                            <tr>
                                <th>No Pinjaman</th>
                                <th>Tanggal Simpanan</th>
                                <th>Tengat Waktu</th>
                                <th>Nama Anggota</th>
                                <th>Jumlah Pinjaman</th>
                                <th>Tujuan</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr v-for="item in pinjaman" :key="item.id">
                                <td>{{ item.no_pinjam }}</td>
                                <td>{{ item.tanggal_pinjam }}</td>
                                <td>{{ item.tanggal_pengembalian }}</td>
                                <td>{{ item.created_by }}</td>
                                <td>{{ "Rp. " + item.jumlah }}</td>
                                <td>{{ item.tujuan }}</td>
                                <td></td>
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
    name: "A-Pinjaman",
    components : {
        Sidebar
    },
    data() {
        return {
            pinjaman: []
        }
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

        this.getPinjaman();
    },
    methods: {
        async getPinjaman() {
            let pinjam = await axios.get(`${baseAPI}/pinjam`, { withCredentials: true})
            this.pinjaman = pinjam.data.data
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

table {
    text-align: center;
}

.card {
    padding: 10px;
    background: #fff;
    border: none;
}
</style>