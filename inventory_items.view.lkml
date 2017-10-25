view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: currently_stocked {
    type: yesno
    sql: ${sold_date} IS NULL OR ${order_items.returned_raw} IS NOT NULL;;
  }

  measure: number_in_stock {
    type: sum
    sql: CASE WHEN ${currently_stocked} THEN 1 ELSE 0 END ;;
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }


  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }



  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }
}
