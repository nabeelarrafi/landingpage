<template>
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <div class="title d-flex">
            <a href="#" class="d-flex">
                <h1 class="logo"><a href="#"><b>E-COOP<span>.</span></b></a></h1>
            </a>
        </div>

        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-heading">Pages</li>

            <li class="nav-item">
                <router-link to="/dashboard" class="nav-link">
                    <i class="fa-solid fa-cubes"></i>
                    <span>Dashboard</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/a-akun" class="nav-link">
                    <i class="fa-solid fa-user-lock"></i>
                    <span>Akun Pegawai</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/a-pegawai" class="nav-link">
                    <i class="fa-solid fa-user-tie"></i>
                    <span>Pegawai</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/a-anggota" class="nav-link">
                    <i class="fa-solid fa-users"></i>
                    <span>Anggota</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/jabatan-pekerjaan" class="nav-link">
                    <i class="bi bi-safe2-fill"></i>
                    <span>Jabatan & Pekerjaan</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/a-simpanan" class="nav-link">
                    <i class="bi bi-safe2-fill"></i>
                    <span>Simpanan</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link to="/a-pinjaman" class="nav-link">
                    <i class="fa-solid fa-hand-holding-dollar"></i>
                    <span>Pinjaman</span>
                </router-link>
            </li>

            <li class="nav-item logout" v-on:click="logOut">
                <a class="nav-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </aside>
</template>

<script>
import axios from 'axios'
import { baseAPI } from "../api.js"
export default {
    name: "Sidebar",
    methods: {
      logOut() {
        this.$swal({
          title: 'Yakin Mau Log Out?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#289672',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Iya',
          cancelButtonText: 'Tidak',
          reverseButtons: true
        }).then(async(result) => {
            if (result.isConfirmed) {
              await axios.get(`${baseAPI}/logout`, {withCredentials: true});
              const Toast = this.$swal.mixin({
                  toast: true,
                  position: 'top-end',
                  showConfirmButton: false,
                  timer: 2000,
                  timerProgressBar: true,
              })

              Toast.fire({
                  icon: 'success',
                  title: 'Log Out Successfull!'
              })
            setTimeout(location.reload.bind(location), 2000);
            this.$router.push({name : 'Home'})
          }
        })
      }
    }
}
</script>

<style scoped>
/*===== Sidebar =====*/
.title {
    margin-bottom: 20px;
}

.sidebar .toggle-sidebar-btn {
  font-size: 32px;
  padding-left: 10px;
  cursor: pointer;
  color: #444444;
}

.sidebar .title .logo {
  font-size: 30px;
  padding: 0;
  line-height: 1;
  font-weight: 600;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.sidebar .title .logo a {
  color: #444444;
  font-size: 40px;
  text-shadow: 0px 2px 2px rgba(255, 176, 55, 0.7);
}

.sidebar {
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  width: 300px;
  z-index: 996;
  transition: all 0.3s;
  padding: 20px;
  overflow-y: auto;
  scrollbar-width: thin;
  scrollbar-color: #aab7cf transparent;
  box-shadow: 0px 0px 20px rgba(19, 23, 31, 0.3);
  background-color: #fff;
}

@media (max-width: 1199px) {
  .sidebar {
    left: -300px;
  }
}

.sidebar::-webkit-scrollbar {
  width: 5px;
  height: 8px;
  background-color: #fff;
}

.sidebar::-webkit-scrollbar-thumb {
  background-color: #fde1a6;
}

@media (max-width: 1199px) {
  .toggle-sidebar .sidebar {
    left: 0;
  }
}

@media (min-width: 1200px) {

  .toggle-sidebar #main,
  .toggle-sidebar #footer {
    margin-left: 0;
  }

  .toggle-sidebar .sidebar {
    left: -300px;
  }
}

.sidebar .nav-item span {
    color: #444444;
}

.sidebar-nav {
  padding: 0;
  margin: 0;
  list-style: none;
}

.sidebar-nav li {
  padding: 0;
  margin: 0;
  list-style: none;
}

.sidebar-nav .nav-item {
  margin-bottom: 5px;
}

.sidebar-nav .nav-heading {
  font-size: 11px;
  text-transform: uppercase;
  color: #FFB037;
  font-weight: 600;
  margin: 10px 0 5px 15px;
}

.sidebar-nav .nav-link {
  display: flex;
  align-items: center;
  font-size: 15px;
  font-weight: 600;
  color: #fff;
  transition: 0.3;
  background: #fff;
  padding: 10px 15px;
  border-radius: 4px;
}

.sidebar-nav .nav-link i {
  font-size: 16px;
  margin-right: 10px;
  color: #FFB037;
}

.sidebar-nav .nav-link:hover {
  background: #fbebc5;
}

.sidebar-nav .nav-link.active {
  background: #FFB037;
}

.sidebar-nav .nav-link.active i {
  color: #444444;
}

.sidebar-nav .nav-link .bi-chevron-down {
  margin-right: 0;
  transition: transform 0.2s ease-in-out;
}

.sidebar-nav .nav-link:not(.collapsed) .bi-chevron-down {
  transform: rotate(180deg);
}

ul li {
    cursor: pointer;
}
</style>