view: products {
  sql_table_name: demo_db.products ;;
#   derived_table: {
#     #sql: SELECT * FROM demo_db.products WHERE ({{ _filters['products.field_list'] | | replace: ",", "+" }}) > 0 ;;
#     sql: {% assign fields = _filters['products.field_list'] | replace: '^', '' | replace: '"', '' | replace: ',', '+' %}
# SELECT * FROM demo_db.products WHERE ({{ fields }})  > 0 ;;
#   }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  parameter: field_list {
    type: string
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: drill_field {
    type: string
    sql: '' ;;
    html:  {% if category._is_filtered %}
            <a href="/explore/test_model/products?fields=products.brand,products.count&f[products.category]={{ _filters['products.category'] | url_encode }}&sorts=products.count+desc" target="_self">Category info</a>
            {% else %}
            <a>No filter on category</a>
            {% endif %};;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  measure: measure_test {
    type: number
    sql: 1.0*${count}/${rank} ;;
  }


}
