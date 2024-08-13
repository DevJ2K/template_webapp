<template>

  <NavigationBar/>
  <div class="h-24"></div>
  <div class="relative flex size-full flex-col items-center">
    <RouterView/>
  </div>
</template>


<script setup lang="ts">
import { RouterView } from 'vue-router'
import NavigationBar from './components/navbar/NavigationBar.vue';
</script>
