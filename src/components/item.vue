<template>
  <div class="item">
    <div class="item-titel">
      <font-awesome-icon :icon='item.isBootleg ? bootlegIcon : titleIcon' />
      <span>
        {{ item.title }}
      </span>
    </div>
    <div class="item-element">
      <font-awesome-icon :icon='platformIcon' />
      <span v-text="item.platform"/>
      <font-awesome-icon v-if="item.hasBooklet" :icon='bookIcon' />
      <font-awesome-icon v-if="item.hasBox" :icon='boxedIcon' />
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faGamepad, faDizzy, faTag, faBoxOpen, faBook } from '@fortawesome/free-solid-svg-icons';

@Component({
  components: {
    FontAwesomeIcon
  }
})
export default class Item extends Vue {
  @Prop({ required: true })
  item!: Collection.Game | List.Game;

  private titleIcon = faTag;
  private bootlegIcon = faDizzy;
  private platformIcon = faGamepad;
  private boxedIcon = faBoxOpen;
  private bookIcon = faBook;
}
</script>

<style>
  .item {
    width: 60%;
    display: inline-flex;
    border: solid 1px;
    border-radius: 60px 10%;
    border-color: #9abbb0;
    padding: 5px 10px;
    margin: 5px 0;
    min-width: 280px;
  }

  .item-titel {
    padding: 0 5px;
  }

  .item-element {
    margin-left: auto;
  }
</style>
