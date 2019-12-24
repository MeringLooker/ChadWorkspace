view: mam_sem_gdn {
  sql_table_name: public.mam_sem_gdn ;;
  drill_fields: [id]

####### Dimensions #######

  dimension: id {
    hidden:  yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: join_id {
    hidden:  yes
    type: string
    sql: ${ad_group_id} ||'_'|| ${day_date} ;;
  }

  dimension: advertising_channel {                            #used in the model to filter
    type: string
    label: "Channel"
    group_label: "Adwords Dimensions"
    sql:
        case
          when ${account} ilike '%GDN' then 'Display'
          when ${account} ilike '%SEM' then 'Search'
          else 'Uncategorized'
          end
        ;;
  }

  dimension_group: __senttime {
    hidden:  yes
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
    hidden:  yes
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

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    hidden:  yes
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: avg__position {
    hidden:  yes
    type: string
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    hidden:  yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    hidden:  yes
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    hidden:  yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    hidden:  yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reportname {
    hidden:  yes
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: search_impr__share {
    hidden:  yes
    type: string
    sql: ${TABLE}."search impr. share" ;;
  }

  dimension: search_lost_is_rank {
    hidden:  yes
    type: string
    sql: ${TABLE}."search lost is (rank)" ;;
  }

  dimension: total_conv__value {
    hidden:  yes
    type: number
    sql: ${TABLE}."total conv. value" ;;
  }

####### Measures #######
measure: total_impressions{
  type: sum_distinct
  group_label: "Adwords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${impressions} ;;
}
measure: total_clicks {
  type:sum_distinct
  group_label: "Adwords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${clicks} ;;
}

measure: total_cost {
  type: sum_distinct
  group_label: "Adwords Reporting"
  sql_distinct_key: ${id} ;;
  sql:  ${cost}/1000000.00 ;;
  value_format_name: usd
}

measure: total_conversions {
  type: sum_distinct
  group_label: "Adwords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${conversions} ;;
}
measure: click_through_rate {
  label: "CTR"
  group_label: "Adwords Reporting"
  type: number
  sql:  ${total_clicks}/nullif(${total_impressions},0) ;;
  value_format_name: percent_2
}

measure: cost_per_click {
  label: "CPC"
  group_label: "Adwords Reporting"
  type:  number
  sql: ${total_cost}/nullif(${total_clicks},0) ;;
  value_format_name: usd
}

measure: cost_per_thousand {
  label: "CPM"
  group_label: "Adwords Reporting"
  type:  number
  sql: ${total_cost}/nullif(${total_impressions}/1000,0) ;;
  value_format_name: usd
}

measure: total_conversion_rate{
  label: "CVR"
  group_label:"Adwords Reporting"
  sql: ${total_conversions}/nullif(${total_clicks},0) ;;
}

measure: cost_per_conversion {
  label: "CPA"
  group_label: "Adwords Reporting"
  type:  number
  sql: ${total_cost}/nullif(${total_conversions},0) ;;
}

  measure: count {
    type: count
    drill_fields: [id, reportname]
  }
}
