<template>
  <!-- ======= Header ======= -->
	<header id="header" class="header fixed-top" v-on:scroll="scrollF">
		<div class="container d-flex align-items-center justify-content-between">
			<h1 class="logo"><a href="#"><b>E-COOP<span>.</span></b></a></h1>
			<nav id="navbar" class="navbar">
				<ul>
					<li class="home">
            <router-link to="/" class="nav-link scrollto"><i class="fa-solid fa-house"></i>&nbsp;Homepage</router-link>
          </li>
					<li class="service">
            <router-link to="/service" class="nav-link scrollto"><i class="fa-solid fa-hands-holding"></i>&nbsp;Layanan</router-link>
          </li>
					<li class="pegawai">
            <router-link to="/pegawai" class="nav-link scrollto"><i class="fa-solid fa-hands-holding"></i>&nbsp;Pegawai</router-link>
          </li>
					<li class="anggota">
            <router-link to="/anggota" class="nav-link scrollto"><i class="fa-solid fa-hands-holding"></i>&nbsp;Anggota</router-link>
          </li>
					<li class="simpan">
            <router-link to="/simpan" class="nav-link scrollto"><i class="bi bi-safe-fill"></i>&nbsp;Simpan</router-link>
          </li>
					<li class="pengajuan">
            <router-link to="/pengajuan" class="nav-link scrollto"><i class="bi bi-safe-fill"></i>&nbsp;Pengajuan Pinjaman</router-link>
          </li>
					<li class="pinjam">
            <router-link to="/pinjam" class="nav-link scrollto"><i class="fa-solid fa-hand-holding-dollar"></i>&nbsp;Pinjam</router-link>
          </li>
					<li class="profile-pegawai">
            <router-link to="/p-profile" class="nav-link scrollto"><i class="fa-solid fa-user-gear"></i>&nbsp;Profile</router-link>
          </li>
					<li class="profile-anggota">
            <router-link to="/m-profile" class="nav-link scrollto"><i class="fa-solid fa-user-gear"></i>&nbsp;Profile</router-link>
          </li>
					<li class="sign-up">
            <router-link to="/signup" class="nav-link scrollto"><i class="bi bi-door-closed-fill"></i>&nbsp;Sign In</router-link>
          </li>
					<li class="logout">
            <a to="#" class="nav-link scrollto" v-on:click="logOut"><i class="bi bi-door-open-fill"></i>&nbsp;Log Out</a>
          </li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle" v-on:click="mobileNav"></i>
			</nav>
		</div>
	</header>
</template>

<script>
import axios from 'axios'
import { baseAPI } from "../api.js"
export default {
  name: 'Header',
  created () {
    window.addEventListener('scroll', this.scrollF);
  },
  destroyed () {
    window.removeEventListener('scroll', this.scrollF);
  },
  methods: {
    mobileNav() {
      var navbar = document.querySelector('.navbar')
      navbar.classList.toggle('navbar-mobile')

      var navbarToggle = document.querySelector('.mobile-nav-toggle')
      navbarToggle.classList.toggle('bi-list')
      navbarToggle.classList.toggle('bi-x')
    },
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
            timer: 1500,
            timerProgressBar: true,
          })

          Toast.fire({
            icon: 'success',
            title: 'Log Out Successfull!'
          })
          setTimeout(location.reload.bind(location), 1500);
          this.$router.push({name : 'Home'})
        }
      })
    },
    scrollF() {
      var header = document.querySelector('.header')
      if (window.scrollY > 100) {
        header.classList.add('header-scrolled')
      } else {
        header.classList.remove('header-scrolled')
      }

      var top = document.querySelector('.back-to-top')
      if (window.scrollY > 100) {
        top.classList.add('active')
      } else {
        top.classList.remove('active')
      }
    }
  },
  async mounted() {
    var service = document.querySelector('.service')
    var simpan = document.querySelector('.simpan')
    var pinjam = document.querySelector('.pinjam')
    var p_profile = document.querySelector('.profile-pegawai')
    var m_profile = document.querySelector('.profile-anggota')
    var signup = document.querySelector('.sign-up')
    var logout = document.querySelector('.logout')
    var anggota = document.querySelector('.anggota')
    var pegawai = document.querySelector('.pegawai')
    var pengajuan = document.querySelector('.pengajuan')

    if (this.$cookies.get("jwt")) {
      var acc = await axios.get(`${baseAPI}/userInfo`, {withCredentials: true});
      if (acc) {
        signup.classList.add('hidden')
        if (acc.data.data.role === 2) { // Pimpinan
          service.classList.add('hidden')
          simpan.classList.add('hidden')
          pinjam.classList.add('hidden')
          m_profile.classList.add('hidden')
        } else if (acc.data.data.role === 3) { // Staff
          service.classList.add('hidden')
          simpan.classList.add('hidden')
          pinjam.classList.add('hidden')
          pegawai.classList.add('hidden')
          m_profile.classList.add('hidden')
        } else if (acc.data.data.role === 4) { // Member
          anggota.classList.add('hidden')
          pegawai.classList.add('hidden')
          pengajuan.classList.add('hidden')
          p_profile.classList.add('hidden')
        }
      }
    } else {
      p_profile.classList.add('hidden')
      m_profile.classList.add('hidden')
      logout.classList.add('hidden')
      pengajuan.classList.add('hidden')
      anggota.classList.add('hidden')
      pegawai.classList.add('hidden')
    }
  }
}
</script>

<style scoped>
/*===== Header =====*/
#header {
  transition: all 0.5s;
  z-index: 997;
  padding: 20px 0;
}

#header .logo {
  font-size: 30px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 600;
  letter-spacing: 1px;
  text-transform: uppercase;
}

#header .logo a {
  color: #fff;
  font-size: 40px;
  text-shadow: 0px 4px 4px rgba(0, 0, 0, 3);
}

#header.header-scrolled,
#header.header-inner-pages {
  background: rgba(27, 26, 23, 0.7);
  padding: 12px 0;
  backdrop-filter: blur(5px);
}

/*===== Desktop Navigation =====*/
.navbar {
  padding: 0;
}

.navbar ul {
  margin: 0;
  padding: 0;
  display: flex;
  list-style: none;
  align-items: center;
}

.navbar li {
  position: relative;
}

.navbar>ul>li {
  white-space: nowrap;
  padding: 10px 0 10px 24px;
}

.navbar a,
.navbar a:focus {
  display: flex;
  align-items: center;
  justify-content: left;
  font-family: "Poppins", sans-serif;
  color: #fff;
  font-size: 15px;
  padding: 0 4px;
  white-space: nowrap;
  transition: 0.3s;
  letter-spacing: 0.4px;
  position: relative;
}

.navbar a i,
.navbar a:focus i {
  font-size: 12px;
  line-height: 0;
  margin-left: 5px;
}

.navbar>ul>li>a:before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: -6px;
  left: 0;
  background-color: #FFB037;
  visibility: hidden;
  transform: scaleX(0);
  transition: all 0.3s ease-in-out 0s;
}

.navbar a:hover:before,
.navbar li:hover>a:before,
.navbar .active:before {
  visibility: visible;
  transform: scaleX(1);
}

.navbar a:hover,
.navbar .active,
.navbar .active:focus,
.navbar li:hover>a {
  color: #fff;
}

/*===== Mobile Navigation =====*/
.mobile-nav-toggle {
  color: #fff;
  font-size: 28px;
  cursor: pointer;
  display: none;
  line-height: 0;
  transition: 0.5s;
}

@media (max-width: 768px) {
  .mobile-nav-toggle {
    display: block;
  }

  .navbar ul {
    display: none;
  }
}

@media (max-width: 768px) {
  #header .logo a {
    font-size: 25px;
  }
}

.navbar-mobile {
  position: fixed;
  overflow: hidden;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(255, 176, 55, 0.7);
  transition: 0.3s;
  z-index: 999;
}

.navbar-mobile .mobile-nav-toggle {
  position: absolute;
  top: 15px;
  right: 15px;
}

.navbar-mobile ul {
  display: block;
  position: absolute;
  top: 55px;
  right: 15px;
  bottom: 15px;
  left: 15px;
  padding: 10px 0;
  background-color: #fff;
  overflow-y: auto;
  transition: 0.3s;
}

.navbar-mobile>ul>li {
  padding: 0;
}

.navbar-mobile a:hover:before,
.navbar-mobile li:hover>a:before,
.navbar-mobile .active:before {
  visibility: hidden;
}

.navbar-mobile a,
.navbar-mobile a:focus {
  padding: 10px 20px;
  font-size: 20px;
  color: #000;
}

.navbar-mobile a:hover,
.navbar-mobile .active,
.navbar-mobile li:hover>a {
  color: #FFB037;
}

.navbar-mobile .getstarted,
.navbar-mobile .getstarted:focus {
  margin: 15px;
}

.nav-link {
  cursor: pointer;
}

#navbar .nav-link i {
  font-size: 20px;
  margin-right: 10px;
}

.hidden {
  display: none;
}

@media (min-width: 1000px) {
  #navbar i {
    display: none;
  }
}
</style>