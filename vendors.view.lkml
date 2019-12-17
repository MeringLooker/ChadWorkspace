view: vendors {
  sql_table_name: public.vendors ;;

  dimension: vend_address {
    hidden: yes
    type: string
    sql: ${TABLE}.vend_address ;;
  }

  dimension: vend_city {
    type: string
    sql: ${TABLE}.vend_city ;;
  }

  dimension: vend_country {
    type: string
    sql: ${TABLE}.vend_country ;;
  }

  dimension: vend_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.vend_id ;;
  }

  dimension: vend_name {
    type: string
    sql: ${TABLE}.vend_name ;;
  }

  dimension: vend_state {
    type: string
    sql: ${TABLE}.vend_state ;;
  }

  dimension: vend_zip {
    hidden: yes
    type: string
    sql: ${TABLE}.vend_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [vend_name]
  }
}
