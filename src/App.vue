<template>
  <div id="app">
    <search v-model="searchText" />
    <div
      v-for="(item, index) in filteredData"
      :key='`list-item-${index}`'
      class="collection"
    >
      <item
        :title="item.title"
        :platform="item.platform"
        :isBootleg="item.bootleg"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator';
import { COLLECTION } from '@/services/collection.ts';
import Search from '@/components/search.vue';

import Item from '@/components/item.vue';

@Component({
  components: {
    Search,
    Item
  }
})
export default class App extends Vue {
  private collectionData: Collection.Game[] = COLLECTION;
  private searchText = '';
  private filteredData = [] as Collection.Game[];

  @Watch('searchText')
  onPropertyChanged () {
    setTimeout(this.getFiltered, 500);
  }

  getFiltered () {
    this.filteredData = this.collectionData;
    if (this.searchText.length > 1) {
      this.filteredData = this.collectionData.filter(
        item => item.title.toLowerCase().includes(this.searchText.toLowerCase()));
    }
  }

  created () {
    setTimeout(this.getFiltered, 500);
  }
}
</script>

<style>
#app {
  font-family: Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  background-color: wheat;
}
.collection {
  width: 100%;
}
</style>
