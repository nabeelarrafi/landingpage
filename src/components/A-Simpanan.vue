<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Data Simpanan</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Simpanan</li>
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
                                <th>No Simpanan</th>
                                <th>Tanggal Simpanan</th>
                                <th>Jenis Simpanan</th>
                                <th>Jangka Simpanan</th>
                                <th>Nama Anggota</th>
                                <th>Target Simpanan</th>
                                <th>Tersimpan</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr v-for="item in simpanan" :key="item.id">
                                <td>{{ item.no_simpan }}</td>
                                <td>{{ item.tanggal_simpan }}</td>
                                <td>{{ item.jenis_simpanan_id }}</td>
                                <td>{{ item.jangka_simpan + " Bulan" }}</td>
                                <td>{{ item.created_by }}</td>
                                <td>{{ "Rp. " + item.total }}</td>
                                <td>{{ "Rp. " + item.jumlah }}</td>
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
    name: "A-Simpanan",
    components : {
        Sidebar
    },
    data() {
        return {
            jenis: "",
            simpanan: []
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

        this.getSimpanan();
    },
    methods: {
        async getSimpanan() {
            let simpan = await axios.get(`${baseAPI}/simpan`, { withCredentials: true})
            this.simpanan = simpan.data.data
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
    width: 100%;
}
</style>