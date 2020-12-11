<template>
  <div class="search">
    <input :value='value' @input='$emit("input", $event.target.value)'>
    <font-awesome-icon :icon='searchIcon' />
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
@Component({
  components: {
    FontAwesomeIcon
  }
})
export default class Search extends Vue {
  @Prop({ required: false })
  value!: string;

  private searchIcon = faSearch;
}
</script>

<style scoped>
  .search {
    width: 100%;
    min-width: 360px;
    margin: 15px 0
  }
  .search > input {
      margin-right: 15px;
    }
</style>
