class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item(item)
    end
  end

  def update_item(item)
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.name != "Sulfuras, Hand of Ragnaros"
          decrease_quality(item)
        end
      else
          increase_quality(item)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              increase_quality(item)
            end
            if item.sell_in < 6
              increase_quality(item)
            end
          end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            
              if item.name != "Sulfuras, Hand of Ragnaros"
                decrease_quality(item)
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          increase_quality(item)
        end
      end
    end

    def increase_quality(item)
      item.quality += 1 if item.quality < 50
    end

     def decrease_quality(item)
      item.quality -= 1 if item.quality > 0
    end

end
