<template>
  <div id="app">
    <search v-model="searchText" :total="filteredData.length" />
    <button v-text="`Collection`" @click="() => uiState = 'collection'"/>
    <button v-text="`Wish List`" @click="() => uiState = 'wish'"/>
    <div
      v-for="(item, index) in filteredData"
      :key='`list-item-${index}`'
      class="collection"
    >
      <item :item="item" />
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator';
import { COLLECTION } from '@/services/collection';
import { LIST } from '@/services/list';
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
  private wishData: List.Game[] = LIST;
  private searchText = '';
  private filteredData: (Collection.Game | List.Game)[] = [];
  private uiState: 'collection'| 'wish' = 'collection';

  @Watch('searchText')
  onPropertyChanged () {
    setTimeout(this.getFiltered, 500);
  }

  @Watch('uiState')
  onUIchange (value: 'collection'| 'wish') {
    this.filteredData = value === 'wish' ? [...this.wishData] : [...this.collectionData];
  }

  getFiltered () {
    const data = this.uiState === 'wish' ? [...this.wishData] : [...this.collectionData];

    if (this.searchText.length > 1) {
      this.filteredData = data.filter(
        item => item.title.toLowerCase().includes(this.searchText.toLowerCase()));
    } else {
      this.filteredData = data;
    }
  }

  created () {
    setTimeout(this.getFiltered, 500);
  }
}
</script>

<style>

body {
  background-color: #f6f9f8;
}
#app {
  font-family: Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 4rem;
}

/* Portrait and Landscape */
@media only screen
  and (min-device-width: 375px)
  and (max-device-width: 667px)
  and (-webkit-min-device-pixel-ratio: 2) {

  .collection {
    width: 100%;
  }
}
</style>
