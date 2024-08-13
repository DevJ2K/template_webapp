<script setup lang="ts">
const makeRequests = async () => {
  console.log("Yo !");
  const url = "http://127.0.0.1:8000/test";

  try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({name: "test"}),
        });

        const result = await response.json();
        console.log("Response from FastAPI:", result);
    } catch (error) {
        console.error("Error:", error);
    }
};
</script>

<template>
  <main class="flex h-screen items-center">
    <button @click="makeRequests">Click me !</button>
  </main>
</template>
