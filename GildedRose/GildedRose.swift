//
//  GildedRose.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public class GildedRose {
    
    public static func updateQuality(_ items: Array<Item>) -> [Item] {
        var updatedItems = items
        for i in 0..<updatedItems.count {
            switch updatedItems[i].name {
            case "Aged Brie":
                updateQualityForAgedBrie(&updatedItems[i])
                updateSellIn(&updatedItems[i])
            case "Backstage passes to a TAFKAL80ETC concert":
                updateQualityForBackstagePass(&updatedItems[i])
                updateSellIn(&updatedItems[i])
            case "Conjured Mana Cake":
                updateQualityForConjured(&updatedItems[i])
                updateSellIn(&updatedItems[i])
            case "Sulfuras, Hand of Ragnaros":
                break
            default:
                updateQualityForNormalItem(&updatedItems[i])
                updateSellIn(&updatedItems[i])
            }
        }
        return updatedItems
    }
    
    private static func updateSellIn(_ item: inout Item) {
        item.sellIn -= 1
    }
    
    private static func updateQualityForNormalItem(_ item: inout Item) {
        if item.sellIn <= 0 {
            item.quality -= 2
        } else {
            item.quality -= 1
        }
        item.quality = max(0, item.quality)
    }
    
    private static func updateQualityForAgedBrie(_ item: inout Item) {
        if item.sellIn <= 0 {
            item.quality += 2
        } else {
            item.quality += 1
        }
        item.quality = min(50, item.quality)
    }
    
    private static func updateQualityForBackstagePass(_ item: inout Item) {
        if item.sellIn <= 0 {
            item.quality = 0
        } else if item.sellIn <= 5 {
            item.quality += 3
        } else if item.sellIn <= 10 {
            item.quality += 2
        } else {
            item.quality += 1
        }
        item.quality = min(50, item.quality)
    }
    
    private static func updateQualityForConjured(_ item: inout Item) {
        if item.sellIn < 0 {
            item.quality -= 4
        } else {
            item.quality -= 2
        }
        item.quality = max(0, item.quality)
    }
}
