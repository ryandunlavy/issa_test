connection: "thelook"
#really testing

explore: current_timestamp {
  persist_for: "0 minutes"
}


view: current_timestamp {
  derived_table: {
    sql: SELECT CURRENT_TIMESTAMP as time;;
  }

  dimension: time {
    type: date_time
    sql: ${TABLE}.time ;;
  }
}

#
# # include all the views
# include: "*.view"
#
# # include all the dashboards
# include: "*.dashboard"
#
# datagroup: orders_update {
#   sql_trigger: SELECT MAX(created) FROM orders ;;
#   max_cache_age: "4 hours"
# }
#
# explore: inv_extended {
#   fields: [ALL_FIELDS*, -inv_extended.test_set*]
# }
#
# explore: user_data {}
#
# explore: self_join {
#   from: orders
#   join: orders {
#     view_label: "Self Join"
#     from: orders
#     sql_on: ${orders.id} =${self_join.id};;
#     relationship: many_to_one
#   }
# }
#
# ###Added comment
#
# ###Commend added as developer
#
#
# explore: orders {
#   join: inventory_items {
#     sql_on: ${inventory_items.date_string} = ${orders.date_string};;
#     type: left_outer
#     relationship: many_to_many
#   }
# }
#
# explore: users2 {
#   from: users
#   join: user_facts_pdt {
#     sql_on: ${users2.id} = ${user_facts_pdt.user_id} ;;
#     type: left_outer
#     relationship: one_to_one
#   }
#
# }
#
# explore: users {
# #
# #   join: user_data {
# #     sql_on: ${users.id} = ${user_data.user_id} ;;
# #     type: inner
# #     fields: []
# #     relationship: many_to_one
# #     view_label: "Users"
# #   }
#
# }
#
# explore: order_items {
#   label: "2017 Orders"
#
#   sql_always_where: ${orders.created_date} > '2017-01-01' ;;
#
#   persist_with: orders_update
#
#   join: inventory_items {
#     sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
#     type: left_outer
#     relationship: many_to_many
#   }
#
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: products {
#     sql_on: ${products.id} = ${inventory_items.product_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id} ;;
#     type:  left_outer
#     relationship: many_to_one
#   }
#
#   join: user_data {
#     sql_on: ${users.id} = ${user_data.user_id} ;;
#     type: inner
#     relationship: many_to_one
#     view_label: "Users"
#   }
#
#   join: ndt {
#     sql_on: ${ndt.user_id}=${user_data.user_id} ;;
#     type: left_outer
#     relationship: many_to_one
#
#   }
# }
#
# explore: ndt {}
#
# explore: products {}
#
# explore: inventory_items{
#   label: "Inventory by category"
#
#   always_filter: {
#     filters: {
#       field: products.category
#       value: "Accessories"
#     }
#   }
#
#   join: products {
#     fields: [id, item_name, brand, category, department, retail_price, sku]
#     sql_on: ${products.id} = ${inventory_items.product_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: order_items {
#     fields: [return_rate]
#     sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
#     type: left_outer
#     relationship: one_to_many
#   }
#
#
# }
