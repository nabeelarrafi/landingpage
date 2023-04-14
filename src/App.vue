<template>
  <div id="app">
		<router-view /> 
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	</div>
</template>

<script>
export default {
  name: 'App',
}
</script>

<style>
/*===== Tag =====*/
body, ul, li, p {
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

a {
  text-decoration: none;
  color: #FFB037;
}

a:hover {
  color: #ffc955;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Poppins", sans-serif;
}

span {
  color: #FFB037;
}

#main h2 {
  text-align: center;
  color: black;
  text-shadow: 2px 2px 2px #9A9A9A;
}

/*===== Custom Scrollbar =====*/
::-webkit-scrollbar {
  width: 5px;
}

::-webkit-scrollbar-track {
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background-color: #FFB037;
  border-radius: 10px;
}

/*===== Back to top button =====*/
.back-to-top {
  position: fixed;
  visibility: hidden;
  opacity: 0;
  right: 15px;
  bottom: 15px;
  z-index: 996;
  background: #FFB037;
  width: 40px;
  height: 40px;
  border-radius: 50px;
  transition: all 0.4s;
}

.back-to-top i {
  font-size: 28px;
  color: #000000;
  line-height: 0;
}

.back-to-top:hover {
  background: #FFB037;
  color: #000000;
}

.back-to-top.active {
  visibility: visible;
  opacity: 1;
}

/*===== Sections General =====*/
section {
  padding: 60px 0;
  overflow: hidden;
}

.section-title {
  text-align: center;
  padding-bottom: 30px;
}

.section-title h3 {
  margin: 15px 0 0 0;
  font-size: 32px;
  font-weight: 700;
}

.section-title p {
  margin: 15px auto 0 auto;
  font-weight: 600;
}

@media (min-width: 1024px) {
  .section-title p {
    width: 50%;
  }
}
</style>