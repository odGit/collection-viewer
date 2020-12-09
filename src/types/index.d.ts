//TODO:
// FROM REMOTE API
// add publisher, year published,
// author, rating, rarity
// in COLLECTION
// State: own, would like to have, collectable?


namespace Collection {
  export interface Game {
    title: string
    platform: string
    bootleg: boolean
    region: string
  }
}
