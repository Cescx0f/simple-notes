import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Register from '@/views/Register.vue'
import Explore from '@/views/Explore.vue'
import Create from '@/views/Create.vue'
import Notes from '@/views/Notes.vue'
import Search from '@/views/Search.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/register',
    name: 'register',
    component: Register
  },
  {
    path: '/explore',
    name: 'explore',
    component: Explore
  },
  {
    path: '/create',
    name: 'create',
    component: Create
  },
  {
    path: '/notes/:id?',
    name: 'notes',
    component: Notes,
    props: true,
  },
  {
    path: '/search',
    name: 'search',
    component: Search,
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
