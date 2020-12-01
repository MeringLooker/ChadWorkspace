view: nba_rannking {
  sql_table_name: chad_workspace.nba_rannking ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # dimension_group: __senttime {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.__senttime ;;
  # }

  # dimension: __state {
  #   type: string
  #   sql: ${TABLE}.__state ;;
  # }

  # dimension_group: __updatetime {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.__updatetime ;;
  # }

  dimension: conference {
    type: string
    sql: ${TABLE}.conference ;;
  }

  dimension: g {
    type: number
    sql: ${TABLE}.g ;;
  }

  dimension: home_record {
    type: string
    sql: ${TABLE}.home_record ;;
  }

  dimension: l {
    type: number
    sql: ${TABLE}.l ;;
  }

  dimension: league_id {
    type: string
    sql: ${TABLE}.league_id ;;
  }

  dimension: road_record {
    type: string
    sql: ${TABLE}.road_record ;;
  }

  dimension: season_id {
    type: number
    sql: ${TABLE}.season_id ;;
  }

  dimension_group: standingsdate {
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
    sql: ${TABLE}.standingsdate ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: w {
    type: number
    sql: ${TABLE}.w ;;
  }

  dimension: w_pct {
    type: number
    sql: ${TABLE}.w_pct ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  # measures

  measure: total_w {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${w} ;;
  }

  measure: total_l {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${l} ;;
  }

}
