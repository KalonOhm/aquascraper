class FishFacts 
  attr_accessor :common_name, :taxonomic_name, :image_url, :size, :other_remarks
  @@fishes = []

  def initialize(fish_common_name, fish_taxonomic_name, fish_image_url, fish_size, additional_remarks )
    @common_name = fish_common_name
    @taxonomic_name = fish_taxonomic_name
    @image_url = fish_image_url
    @size = fish_size
    @other_remarks = additional_remarks

    @@fishes << self
  end


  #class method
  def self.all
    @@fishes
  end

end

guppy = FishFacts.new("guppy", "guppy guppy", "guppy.jpeg", "3", "Guppies breed like rabbits")

puts "Facts about a guppy:"
puts "Common name: #{guppy.common_name}"
puts "Taxonomy: #{guppy.taxonomic_name}"
puts "pic of a guppy here #{guppy.image_url}"
puts "how long is a guppy? #{guppy.size}"
puts "Care factoid: #{guppy.other_remarks}"

puts FishFacts.all
