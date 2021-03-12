// TODO:
// FROM REMOTE API
// add publisher, year published,
// author, rating, rarity
// in COLLECTION
// State: own, would like to have, collectable?

// ts-ignore no-unused-vars
namespace Collection {
  export interface Game {
    title: string;
    platform: string;
    region: string;
    isBootleg?: boolean;
    series?: string[];
    hasBattery?: boolean;
    hasBox?: boolean;
    hasBooklet?: boolean;
  }
}
namespace List {
  export interface Game {
    title: string;
    platform: string;
    series?: string[];
  }
}
