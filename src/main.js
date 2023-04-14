import { createApp } from 'vue'
import { MotionPlugin } from '@vueuse/motion'
import App from './App.vue'
import router from './router'
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import VueCookies from 'vue-cookies';

createApp(App)
    .use(router)
    .use(MotionPlugin)
    .use(VueSweetalert2)
    .use(VueCookies)
    .mount('#app');