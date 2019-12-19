view: orders {
  sql_table_name: public.orders ;;

  dimension: cust_id {
    hidden: yes
    type: string
    sql: ${TABLE}.cust_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_num {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_num ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
