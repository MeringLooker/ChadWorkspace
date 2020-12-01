view: tsy_weleda_attribution_test {
  sql_table_name: public.tsy_weleda_attribution_test ;;

  ## Primary Key ##

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  ## Unnecessary Dimensions ##

  dimension_group: __senttime {
    hidden: yes
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __state {
    hidden: yes
    type: string
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __updatetime {
    hidden: yes
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
    sql: ${TABLE}.__updatetime ;;
  }

  ## Dimensions Below ##

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: new_users {
    hidden: yes
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.total_users ;;
  }

  ## Measures Below ##

  measure: total_users {
    label: "Total Users"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${users} ;;
    value_format_name: decimal_2
  }

  measure: total_new_users {
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${new_users} ;;
    value_format_name: decimal_2
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id]
  # }
}
