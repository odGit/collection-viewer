<template>
  <div class="search">
    <input :value='value' @input='$emit("input", $event.target.value)'>
    <font-awesome-icon :icon='searchIcon' />
    <span v-text="`Total: ${total}`"/>
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

  @Prop({ required: false, default: -1 })
  total!: number;

  private searchIcon = faSearch;
}
</script>

<style scoped>
  .search {
    width: 100%;
    margin: 15px 0
  }
  .search > input {
    margin-right: 15px;
    min-width: 280px;
    border-radius: 60px;
    font-size: 14px;
    line-height: 20px;
  }
  .search > span {
    padding-left: 1rem;
  }
</style>
