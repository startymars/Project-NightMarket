<template>
  <div class="container food">
    <div class="title d-flex justify-content-between align-items-center">
      <h4>美食管理</h4>
      <button
        class="btn btn-primary btn-lg"
        type="button"
        @click="openModal('create')"
      >
        新增產品
      </button>
    </div>
    <table class="table mt-4">
      <thead>
        <tr>
          <th width="120">分類</th>
          <th>產品名稱</th>
          <th width="120">原價</th>
          <th width="120">售價</th>
          <th width="100">是否啟用</th>
          <th width="120">編輯</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in products" :key="item.id">
          <td>{{ item.category }}</td>
          <td>{{ item.title }}</td>
          <td class="text-left">{{ item.origin_price }}</td>
          <td class="text-left">{{ item.price }}</td>
          <td>
            <span class="text-success" v-if="item.is_enabled">啟用</span>
            <span v-else>未啟用</span>
          </td>
          <td>
            <div class="btn-group">
              <button
                type="button"
                class="btn btn-outline-dark btn-sm"
                @click="openModal('edit', item)"
              >
                編輯
              </button>
              <button
                type="button"
                class="btn btn-outline-danger btn-sm"
                @click="openModal('delete', item)"
              >
                刪除
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <!-- Modal -->
    <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            ...
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        </div>
    </div>
    </div>
    <!-- Modal -->
<div class="modal fade" ref="productModal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</template>

<style scoped>
.food {
  position: absolute;
  width: 80%;
  height: calc(100vh - (51.2px + 10%));
  left: 17%;
  top: 10%;
}
</style>

<script>
const { VITE_APP_URL, VITE_APP_PATH } = import.meta.env
export default {
  data () {
    return {
      products: [],
      tempProduct: {
        imagesUrl: []
      },
      bsModal: ''
    }
  },
  methods: {
    getProducts () {
      this.$http
        .get(`${VITE_APP_URL}/v2/api/${VITE_APP_PATH}/admin/products`)
        .then((res) => {
          console.log(res.data)
          this.products = res.data.products
        })
        .catch((err) => {
          alert(err.response.data)
        })
    },
    openModal (status, product) {
      if (status === 'create') {
        this.isNew = true
        this.tempProduct = {
          imagesUrl: []
        }
      } else if (status === 'edit') {
        this.isNew = false
        this.tempProduct = { ...product }
        console.log(this.tempProduct)
      } else if (status === 'delete') {
        this.tempProduct = { ...product }
      }
    }
  },
  mounted () {
    this.getProducts()
    console.log(this.$refs)
  }
}
</script>
