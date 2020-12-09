<template>
  <div>
    <input :value='value' @input='$emit("input", $event.target.value)'>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
@Component({})
export default class Search extends Vue {
  @Prop({ required: false })
  value!: string;
}
</script>
