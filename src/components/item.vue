<template>
  <div class="item">
    <div class="item-element">
      <font-awesome-icon :icon='titleIcon' />
      <span>
        {{ title }}
      </span>
    </div>
    <div class="item-element">
      <font-awesome-icon :icon='platformIcon' />
      <span>
        {{ platform }}
      </span>
    </div>
    <div class="item-element">
      <font-awesome-icon v-if="isBootleg" :icon='bootlegIcon' />
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faGamepad, faDizzy, faTag } from '@fortawesome/free-solid-svg-icons';

@Component({
  components: {
    FontAwesomeIcon
  }
})
export default class Item extends Vue {
  @Prop({ required: true })
  title!: string;

  @Prop({ required: true })
  platform!: string;

  @Prop({ required: true })
  isBootleg!: boolean;

  private titleIcon = faTag;
  private bootlegIcon = faDizzy;
  private platformIcon = faGamepad;
}
</script>

<style>
  .item {
    width: auto;
    display: inline-flex;
    border: solid 1px;
    border-radius: 10% 60px;
    border-color: goldenrod;
    padding: 5px 10px;
    margin: 5px 0;
    min-width: 360px;
  }

  .item-element {
    padding: 0 5px;
  }
</style>
