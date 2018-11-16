include: "orders.view"
connection: "thelook"

explore: orders {
  always_filter: {
    filters: {
      field: orders.created_time
      value: "this week"
    }
  }
}

explore: extended {
  view_name: orders
  always_filter: {}
}
