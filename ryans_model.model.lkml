connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

label: "test label"

datagroup: orders_update {
  sql_trigger: SELECT MAX(created) FROM orders ;;
  max_cache_age: "4 hours"
}

explore: orders {

  join: user_facts_pdt {
    sql_on: ${orders.user_id} = ${user_facts_pdt.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: users {

  join: user_data {
    sql_on: ${users.id} = ${user_data.user_id} ;;
    type: inner
    relationship: many_to_one
    view_label: "Users"
  }

}

explore: order_items {
  label: "2017 Orders"

  sql_always_where: ${orders.created_date} > '2017-01-01' ;;

  persist_with: orders_update

  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: many_to_many
  }

  join: orders {
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.id} = ${orders.user_id} ;;
    type:  left_outer
    relationship: many_to_one
  }

  join: user_data {
    sql_on: ${users.id} = ${user_data.user_id} ;;
    type: inner
    relationship: many_to_one
    view_label: "Users"
  }
}



explore: inventory_items{
  label: "Inventory by category"

  always_filter: {
    filters: {
      field: products.category
      value: "Accessories"
    }
  }

  join: products {
    fields: [id, item_name, brand, category, department, retail_price, sku]
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_items {
    fields: [return_rate]
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: one_to_many
  }





}
