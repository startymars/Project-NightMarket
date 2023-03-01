<template>
  <div class="home">
    <HeaderNav />
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/src/assets/carouselImg.png" class="d-block w-100" alt="carouselImg">
        </div>
        <div class="carousel-item">
          <img src="/src/assets/carouselImg2.png" class="d-block w-100" alt="carouselImg2">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HeaderNav from '@/components/HeaderView.vue'
export default {
  components: {
    HeaderNav
  }
}
</script>

<style scoped>
</style>
