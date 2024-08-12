<script setup lang="ts">
import TheWelcome from "../components/TheWelcome.vue";
const makeRequests = async () => {
  console.log("Yo !");
};
</script>

<template>
  <main class="flex h-screen items-center">
    <button @click="makeRequests">Click me !</button>
  </main>
</template>
