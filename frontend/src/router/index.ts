import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: {
        title: 'Title | Untitled'
      }
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/test',
      name: 'test',
      // route level code-splitting
      // this generates a separate chunk (test.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/TestView.vue')
    },
    {
      path: '/page1',
      name: 'page1',
      component: () => import('../views/Page_1.vue')
    },
    {
      path: '/page2',
      name: 'page2',
      component: () => import('../views/Page_2.vue')
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.meta.title && typeof to.meta.title === "string") {
    document.title = to.meta.title;

  }
  next();
})

export default router
