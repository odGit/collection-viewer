<template>
  <div id="app">
    <search v-model="searchText"/>
    <div
      v-for="(item, index) in collectionData"
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
import { Component, Vue } from 'vue-property-decorator';
import json from '@/services/collection.json';
import Search from '@/components/search.vue';

import Item from '@/components/item.vue';

@Component({
  components: {
    Search,
    Item
  }
})
export default class App extends Vue {
  private collectionData: Collection.Game[] = json.collection;
  private searchText = '';
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
}
.collection {
  width: 100%;
}
</style>
