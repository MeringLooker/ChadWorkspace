view: products {
  sql_table_name: public.products ;;

  dimension: prod_desc {
    type: string
    sql: ${TABLE}.prod_desc ;;
  }

  dimension: prod_id {
    type: string
    sql: ${TABLE}.prod_id ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: prod_price {
    type: number
    sql: ${TABLE}.prod_price ;;
  }

  dimension: vend_id {
    type: string
    sql: ${TABLE}.vend_id ;;
  }

  measure: count {
    type: count
    drill_fields: [prod_name]
  }
}
