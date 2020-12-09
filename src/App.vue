<template>
  <div id="app">
    <search v-model="searchText"/>
    <font-awesome-icon :icon='searchIcon' />
    <div
      v-for="(item, index) in collectionData"
      :key='`list-item-${index}`'
    >
      <div>
        <font-awesome-icon :icon='titleIcon' />
        <span>
          {{ item.title }}
        </span>
      </div>
      <div>
        <font-awesome-icon :icon='platformIcon' />
        <span>
          {{ item.platform }}
        </span>
      </div>
      <div>isFake:
        <font-awesome-icon v-if="item.bootleg" :icon='bootlegIcon' />
        <span>
          {{ item.bootleg }}
        </span>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import json from '@/services/collection.json';
import Search from '@/components/search.vue';
// import { library } from '@fortawesome/fontawesome-svg-core';
import { faGamepad, faSearch, faDizzy, faTag } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

@Component({
  components: {
    Search,
    FontAwesomeIcon
  }
})
export default class App extends Vue {
  private collectionData: Collection.Game[] = json.collection;
  private searchText = '';
  private searchIcon = faSearch;
  private titleIcon = faTag;
  private bootlegIcon = faDizzy;
  private platformIcon = faGamepad;
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
</style>
