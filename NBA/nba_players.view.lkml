view: nba_players {
  sql_table_name: chad_workspace.nba_players ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: __state {
    type: string
    sql: ${TABLE}.__state ;;
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

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: player_name {
    type: string
    sql: ${TABLE}.player_name ;;
  }

  dimension: season {
    type: number
    value_format_name: id
    sql: ${TABLE}.season ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, player_name]
  }
}
