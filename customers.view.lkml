view: customers {
  sql_table_name: public.customers ;;

  dimension: cust_address {
    type: string
    sql: ${TABLE}.cust_address ;;
  }

  dimension: cust_city {
    type: string
    sql: ${TABLE}.cust_city ;;
  }

  dimension: cust_contact {
    type: string
    sql: ${TABLE}.cust_contact ;;
  }

  dimension: cust_country {
    type: string
    sql: ${TABLE}.cust_country ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}.cust_email ;;
  }

  dimension: cust_id {
    type: string
    sql: ${TABLE}.cust_id ;;
  }

  dimension: cust_name {
    type: string
    sql: ${TABLE}.cust_name ;;
  }

  dimension: cust_state {
    type: string
    sql: ${TABLE}.cust_state ;;
  }

  dimension: cust_zip {
    type: string
    sql: ${TABLE}.cust_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [cust_name]
  }
}
