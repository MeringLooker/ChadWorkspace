view: mam_ga_goals {
  sql_table_name: public.mam_ga_goals ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: join_id {
    type: string
    hidden: yes
    sql: ${keyword}||'_'||${date_date} ;;
  }

  dimension: __sampled {
    type: yesno
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
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

  dimension_group: __updatetime {
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

  dimension: adwordsadgroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: goal10completions {
    type: number
    sql: ${TABLE}.goal10completions ;;
  }

  dimension: goal11completions {
    type: number
    sql: ${TABLE}.goal11completions ;;
  }

  dimension: goal12completions {
    type: number
    sql: ${TABLE}.goal12completions ;;
  }

  dimension: goal13completions {
    type: number
    sql: ${TABLE}.goal13completions ;;
  }

  dimension: goal1completions {
    type: number
    sql: ${TABLE}.goal1completions ;;
  }

  dimension: goal2completions {
    type: number
    sql: ${TABLE}.goal2completions ;;
  }

  dimension: goal5completions {
    type: number
    sql: ${TABLE}.goal5completions ;;
  }

  dimension: goal7completions {
    type: number
    sql: ${TABLE}.goal7completions ;;
  }

  dimension: goal9completions {
    type: number
    sql: ${TABLE}.goal9completions ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
