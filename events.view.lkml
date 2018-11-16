view: events {
   # sql_table_name: {% if events.id._model._name == "ryans_model" %} demo_db.orders {% else %} other_schema.orders {% endif %};;
    sql_table_name:{% if _model._name == 'ryans_model' %} worked {% else %} didnt_work {% endif %} ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }




  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id]
  }
}
