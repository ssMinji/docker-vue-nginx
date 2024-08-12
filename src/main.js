import { createApp } from 'vue'
import App from './App.vue'
import axios from 'axios'
import router from 'router'
import store from 'store'

// createApp(App).mount('#app')
axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
axios.defaults.withCredentials = false
const app = createApp(App)
app.config.globalProperties.axios = axios
app.use(store).use(router).mount('#app')

