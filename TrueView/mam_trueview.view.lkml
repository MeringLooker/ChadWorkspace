view: mam_trueview {
  sql_table_name: public.mam_trueview ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: fiscal_year {
    type: string
    sql:
      case
        when ${day_date} between '2015-07-01' and '2016-06-30' then 'FY 15/16'
        when ${day_date} between '2016-07-01' and '2017-06-30' then 'FY 16/17'
        when ${day_date} between '2017-07-01' and '2018-06-30' then 'FY 17/18'
        when ${day_date} between '2018-07-01' and '2019-06-30' then 'FY 18/19'
        when ${day_date} between '2019-07-01' and '2020-06-30' then 'FY 19/20'
        else 'Uncategorized'
        end;;
  }

  dimension: season {
    type:  string
    sql:
      case
        when ${campaign} ilike '%FY19/20 Fall%' then 'Fall'
        when ${campaign} ilike '%FY19/20 Winter%' then 'Winter'
        when ${campaign} ilike '%FY19/20 Summer%' then 'Summer'
        else 'Uncategorized'
        end;;
  }

  dimension: layer {
    type: string
    sql:
      case
        when ${campaign} ilike '%retargeting%' then'Retargeting'
        when ${campaign} ilike '%prospecting%' then 'Prospecting'
        WHEN ${campaign_id} = '6542201483' then 'Prospecting'
        WHEN ${campaign_id} = '6542201492' then 'Prospecting'
        WHEN ${campaign_id} = '6542201486' then 'Prospecting'
        WHEN ${campaign_id} = '6542201474' then 'Prospecting'
        else 'Uncategorized'
        end;;
  }


  dimension: audience {
    type: string
    sql:
    case
      when ${ad_group} ilike '%InMarket Travel%' then 'In-Market Travel'
      when ${ad_group} ilike '%Retargeting%' then 'Retargeting'
      when ${ad_group} ilike '%Outdoor Enthusiasts' then 'Brand'
      when ${ad_group} ilike '%Skiing Enthusiasts' then 'Brand'
      when ${ad_group} ilike '%Cycling Enthusiasts' then 'Brand'
      when ${ad_group} ilike '%Running Enthusiasts' then 'Brand'
      when ${ad_group} ilike '%Competitive Destination' then 'Competitive Destination'
      else 'Uncategorized'
      end;;
  }

  dimension: mam_region {
    type:  string
    sql:
    case
      when ${campaign} ilike '%CA/NV' then 'California/Nevada'
      when ${campaign} ilike '%SF' then 'San Francisco'
      when ${campaign} ilike '%DEN' then 'Denver'
      when ${campaign} ilike '%NE' then 'Northeast'
      else 'Uncategorized'
      end;;
  }

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

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    hidden: yes
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}."ad type" ;;
  }

  dimension: all_conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."all conv." ;;
  }

  dimension: all_conv__rate {
    hidden: yes
    type: string
    sql: ${TABLE}."all conv. rate" ;;
  }

  dimension: all_conv__value {
    hidden: yes
    type: number
    sql: ${TABLE}."all conv. value" ;;
  }

  dimension: avg__cost {
    hidden: yes
    type: number
    sql: ${TABLE}."avg. cost" ;;
  }

  dimension: avg__cpc {
    hidden: yes
    type: number
    sql: ${TABLE}."avg. cpc" ;;
  }

  dimension: avg__cpm {
    hidden: yes
    type: number
    sql: ${TABLE}."avg. cpm" ;;
  }

  dimension: avg__cpv {
    hidden: yes
    type: number
    sql: ${TABLE}."avg. cpv" ;;
  }

  dimension: avg__position {
    hidden: yes
    type: string
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    hidden: yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    hidden: yes
    type: string
    sql: ${TABLE}."client name" ;;
  }

  dimension: conv__rate {
    hidden: yes
    type: string
    sql: ${TABLE}."conv. rate" ;;
  }

  dimension: conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost__all_conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."cost / all conv." ;;
  }

  dimension: cost__conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."cost / conv." ;;
  }

  dimension: countryterritory {
    hidden: yes
    type: number
    sql: ${TABLE}."country/territory" ;;
  }

  dimension: crossdevice_conv_ {
    hidden: yes
    type: string
    sql: ${TABLE}."cross-device conv." ;;
  }

  dimension: ctr {
    hidden: yes
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: currency {
    hidden: yes
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}."customer id" ;;
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
    hidden: yes
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_rate {
    hidden: yes
    type: string
    sql: ${TABLE}."interaction rate" ;;
  }

  dimension: interaction_types {
    hidden: yes
    type: string
    sql: ${TABLE}."interaction types" ;;
  }

  dimension: interactions {
    hidden: yes
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_targetable {
    hidden: yes
    type: string
    sql: ${TABLE}."is targetable" ;;
  }

  dimension: location_type {
    hidden: yes
    type: string
    sql: ${TABLE}."location type" ;;
  }

  dimension: metro_area {
    hidden: yes
    type: string
    sql: ${TABLE}."metro area" ;;
  }

  dimension: most_specific_location {
    hidden: yes
    type: number
    sql: ${TABLE}."most specific location" ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: network_with_search_partners {
    hidden: yes
    type: string
    sql: ${TABLE}."network (with search partners)" ;;
  }

  dimension: region {
    hidden: yes
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: time_zone {
    hidden: yes
    type: string
    sql: ${TABLE}."time zone" ;;
  }

  dimension: total_conv__value {
    hidden: yes
    type: number
    sql: ${TABLE}."total conv. value" ;;
  }

  dimension: value__all_conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."value / all conv." ;;
  }

  dimension: value__conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."value / conv." ;;
  }

  dimension: view_rate {
    hidden: yes
    type: string
    sql: ${TABLE}."view rate" ;;
  }

  dimension: views {
    hidden: yes
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: viewthrough_conv_ {
    hidden: yes
    type: number
    sql: ${TABLE}."view-through conv." ;;
  }

######### Measures ###########

measure: total_cost {
  type: sum
  sql:(${cost}/1000000.00) ;;
  value_format_name: usd
}

measure: total_impressions {
  type:  sum
  sql: ${impressions} ;;
}

measure: total_views {
  type: sum
  sql:  ${views} ;;
}


measure: total_view_rate {
  type: number
  sql: 1.0*${total_views}/nullif(${total_impressions},0) ;;
  value_format_name: percent_0
}

measure: cost_per_thousand {
  type:  number
  sql:  ${total_cost}/nullif(${total_impressions}/1000,0) ;;
  value_format: "0.00"
}

measure:cost_per_view {
  type: number
  sql: ${total_cost}/nullif(${total_views},0) ;;
  value_format: "0.00"
}

  measure: count {
    type: count
    drill_fields: [id, client_name, reportname]
  }
}
