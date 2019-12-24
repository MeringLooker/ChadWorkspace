view: products {
  sql_table_name: public.products ;;

  dimension: prod_desc {
    type: string
    sql: ${TABLE}.prod_desc ;;
  }

  dimension: prod_id {
    primary_key: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.vend_id ;;
  }
###  Measures  ###
  measure: count {
    type: count
    drill_fields: [prod_name]
  }

  measure: price {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.prod_price ;;
  }
}
