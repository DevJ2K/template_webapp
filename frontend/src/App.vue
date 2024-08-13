<template>

  <NavigationBar/>
  <div class="h-24"></div>
  <div>
    <RouterView/>
  </div>
</template>


<script setup lang="ts">
import { RouterView } from 'vue-router'
import NavigationBar from './components/navbar/NavigationBar.vue';
</script>
