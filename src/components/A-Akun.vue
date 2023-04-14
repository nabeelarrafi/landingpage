<template>
    <Sidebar />

    <main class="main" id="main">
        <div class="pagetitle">
            <h1>Akun Pegawai</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active">Akun</li>
                </ol>
            </nav>
        </div>

        <section class="section akun">
            <!--===== Table Rekening Bank =====-->
            <div class="card card-akun">
                <div class="table-akun">
                    <div id="btn-akun">
                        <a class="form-modal" data-bs-toggle="modal" data-bs-target="#inputAkun"><i class="fa-solid fa-user-lock"></i> Tambah Akun Pegawai</a>
                    </div>
                    <table id="akun" class="table table-striped responsive nowrap table-hover">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th class="action">Action</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr v-for="item in akun" :key="item.id">
                                <td>{{ item.email }}</td>
                                <td>
                                    <input type="password" :value="item.password" readonly>
                                </td>
                                <td>{{ item.role_id }}</td>
                                <td class="action">
                                    <button id="btn-delete" v-on:click="deleteAkun(item.id)"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--===== Modal Akun =====-->
            <div class="modal fade" id="inputAkun" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title">Daftar Akun Pegawai</div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form>
                            <div class="modal-body">
                                <div class="akun-details">
                                    <div class="input-box">
                                        <span class="details">Email</span>
                                        <input type="email" placeholder="Masukan Email" required v-model="email" autocomplete="off">
                                        <span v-if="v$.email.$error" id="error">
                                            {{ v$.email.$errors[0].$message }}
                                        </span>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Password</span>
                                        <input type="password" placeholder="Masukan Password" required v-model="password" autocomplete="off">
                                        <span v-if="v$.password.$error" id="error">
                                            {{ v$.password.$errors[0].$message }}
                                        </span>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Role</span>
                                        <select class="form-select" v-model="id_jabatan" >
                                            <option v-for="item in jabatan" :key="item.id" :value="item.id">
                                                {{ item.jabatan }}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-submit" v-on:click="addAkun">Submit</button>
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
import useValidate from '@vuelidate/core'
import { required, email, minLength } from '@vuelidate/validators'
import Sidebar from './Sidebar.vue'
import { baseAPI } from "../api.js"
export default {
    name: "A-Akun",
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

        this.getAkun();
        this.getJabatan();
    },
    data() {
        return {
            v$: useValidate(),
            id_jabatan: "",
            email: "",
            password: "",

            akun: [],
            jabatan: []
        }
    },
    validations() {
        return {
            id_jabatan: {  },
            email: { required, email },
            password: { required, minLength: minLength(8) },
        };
    },
    methods: {
        async getJabatan() {
            let jabatan = await axios.get(`${baseAPI}/jabatan`, {withCredentials: true});
            this.jabatan = jabatan.data.data;
        },
        async getAkun() {
            let akun = await axios.get(`${baseAPI}/userStaff`, {withCredentials: true});
            this.akun = akun.data.data;
            // console.log(akun.data.data)
        },
        async addAkun() {
            this.v$.$validate();
            if (!this.v$.$error) {
                let result = await axios.post(`${baseAPI}/signup`, {
                    role_id: this.id_jabatan,
                    email: this.email,
                    password: this.password,
                });
                if (result.status === 201) {
                    const Toast = this.$swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 2000,
                        timerProgressBar: true,
                    })

                    Toast.fire({
                        icon: 'success',
                        title: 'Submit Successfull!'
                    })
                    this.$router.push({name : 'A-Akun'})
                    setTimeout(location.reload.bind(location), 1000);
                } 
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
                    title: 'Submit Failed!'
                })
            }
        },
        async deleteAkun(id) {
            let result = await axios.delete(`${baseAPI}/pegawai/` + id);
            if (result.status === 200) {
                location.reload();
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
#error {
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

.container {
    background: #fff;
    border-radius: 10px;
    padding: 15px;
}

/* Table Section */
.card-akun {
    padding: 10px;
    background: #fff;
    border: none;
    width: 100%;
}

#btn-akun {
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

#btn-akun a {
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

#akun {
    text-align: center;
}

table input[type="password"] {
    border: none;
    background: transparent;
}

/* Table Section */
#inputAkun .title {
    font-size: 25px;
    font-weight: 500;
    position: relative;
}

#inputAkun .title::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #fad88d, #FFB037);
}

form .akun-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
}

form .akun-details .input-box {
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

.akun-details .input-box input, select {
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

.akun-details .input-box input:focus,
.akun-details .input-box select:focus {
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

#inputAkun .btn-submit {
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

div #btn-akun:hover,
#inputAkun .btn-submit:hover {
    background: #ffc955;
}

select:focus>option:checked {
  background: #ffc955 !important;
}
</style>