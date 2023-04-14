<template>
  <!--====== Footer ======-->
  <footer id="footer" class="footer">
      <div class="footer-content">
        <h3><b>E-COOP<span>.</span></b></h3>
        <div class="text">
          <p>Koperasi digital pertama di Indonesia dengan pelayanan cepat dan mudah.</p>
        </div>
        <ul class="media">
            <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-whatsapp"></i></a></li>
        </ul>
      </div>
      <div class="footer-bottom">
        <p>Copyright &copy;2022&nbsp;<b>E-COOP<span>.&nbsp;</span></b>Designed by&nbsp;<b>Foxvore</b>.</p>
      </div>
    </footer>
</template>

<script>
export default {
    name : 'Footer'
}
</script>

<style>
    /*===== Footer =====*/
#footer {
  position: absolute;
  background: rgba(27, 26, 23, 0.9);
  height: auto;
  width: 100%;
  padding-top: 40px;
  color: #fff;
}

.footer-content {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  text-align: center;
}

.footer-content h3 {
  font-size: 1.8rem;
  font-weight: 400;
  text-transform: capitalize;
  line-height: 3rem;
}

.footer-content p {
  max-width: 500px;
  margin: 10px auto;
  line-height: 28px;
  font-size: 14px;
}

.text {
  max-width: 400px;
}

.media {
  list-style: none;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 1rem 0 2rem 0;
}

.media li {
  margin: 0 10px;
}

.media a {
  text-decoration: none;
  color: #fff;
}

.media a i {
  font-size: 1.1rem;
  transition: color .4s ease;
}

.media a:hover {
  color: #FFB037;
}

.footer-bottom {
  background: rgba(0, 0, 0, 0.3);
  width: 100%;
  padding: 20px 0;
  text-align: center;
}

.footer-bottom p {
  font-size: 14px;
  word-spacing: 2px;
  display: flex;
  justify-content: center;
}

/*===== Phone S Responsive =====*/
@media (max-width: 374px) {
  .footer-bottom p {
    font-size: 10px;
  }
}
</style>