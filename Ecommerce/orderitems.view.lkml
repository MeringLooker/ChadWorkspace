view: orderitems {
  sql_table_name: public.orderitems ;;

  dimension: item_price {
    type: number
    sql: ${TABLE}.item_price ;;
  }

  dimension: order_item {
    type: number
    sql: ${TABLE}.order_item ;;
  }

  dimension: order_num {
    type: number
    sql: ${TABLE}.order_num ;;
  }

  dimension: prod_id {
    type: string
    sql: ${TABLE}.prod_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
