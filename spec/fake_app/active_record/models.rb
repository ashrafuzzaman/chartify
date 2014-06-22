# models
class Product < ActiveRecord::Base
  has_many :line_items
end
class Order < ActiveRecord::Base
  has_many :line_items
end
class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
end

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:products) { |t| t.string :name; t.integer :price }
    create_table(:orders) { |t| t.date :ordered_on; }
    create_table(:line_items) { |t| t.integer :product_id; t.integer :order_id; t.integer :quantity; t.integer :price }
  end
end
ActiveRecord::Migration.verbose = false
CreateAllTables.up