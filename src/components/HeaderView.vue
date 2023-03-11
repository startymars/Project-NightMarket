<template>
  <nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
      <div class="logo">
        <router-link to="/">
          <img src="../assets/Logo.png" alt="logo" width="200"/>
        </router-link>
      </div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav align-items-center">
          <li class="nav-item">
            <router-link to="/News" class="text-decoration-none text-white">最新消息</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/Food" class="text-decoration-none text-white">美食報報</router-link>
          </li>
          <li class="nav-item d-flex align-items-center rounded-pill">
              <router-link to="/Favorite" class="px-2">
                <img src="../assets/heart.png" alt="favorite" />
              </router-link>
              <router-link to="/Cart" class="px-2">
                <img src="../assets/shopping-cart.png" alt="shopping-cart" />
              </router-link>
              <img src="../assets/user.png" alt="user" class="px-2" />
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>

window.addEventListener('scroll', function () {
  const scrollTop = window.pageYOffset || document.documentElement.scrollTop
  const nav = document.querySelector('nav')
  if (scrollTop > 100) {
    nav.classList.add('scrolled')
  } else {
    nav.classList.remove('scrolled')
  }
})

export default {

}
</script>

<style scoped>
.rounded-pill{
  background-color: rgba(255, 255, 255, 0.1);
}
.nav-item{
  padding:10px;
}

nav.scrolled {
  background-color: black;
}
</style>
