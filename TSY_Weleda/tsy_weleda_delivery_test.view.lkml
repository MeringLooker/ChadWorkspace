view: tsy_weleda_delivery_test {
  sql_table_name: public.tsy_weleda_delivery_test ;;

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

  dimension: ad_size {
    type: string
    sql: ${TABLE}.ad_size ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
    link: {
      label: "Creative Example"
      url:"{{ tsy_weleda_delivery_test.media_url }}"
      icon_url: "https://www.theshipyard.com/libraries/sites/1/assets/logo-on-white.svg"
    }
  }

  dimension_group: date {
    group_label: "Date Periods"
    label: ""
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: engaged_user {
    type: number
    hidden: yes
    sql: ${TABLE}.engaged_user ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_url {
    type: string
    sql: ${TABLE}.media_url ;;
    link: {
      label: "Creative Example"
      url:"{{ tsy_weleda_delivery_test.media_url }}"
      icon_url: "https://www.theshipyard.com/libraries/sites/1/assets/logo-on-white.svg"
    }
  }

  # dimension: shortened_path {
  #   type: string
  #   group_label: "Google Analytics Dimensions"
  #   label: "Page Path"
  #   sql: ${TABLE}.shortened_path ;;
  #   link: {
  #     label: "californiagrown.org{{ value }}"
  #     url:"https://californiagrown.org{{ cag_ga_behavior_view.shortened_path }}"
  #     icon_url: "https://californiagrown.org/favicon.ico"
  #   }
  # }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: purchase {
    type: number
    hidden: yes
    sql: ${TABLE}.purchase ;;
  }

  dimension: site_visit {
    type: number
    hidden: yes
    sql: ${TABLE}.site_visit ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: tactic {
    type: string
    sql: ${TABLE}.tactic ;;
  }

  dimension: template {
    type: string
    sql: ${TABLE}.template ;;
  }

  dimension: truncated_copy {
    type: string
    sql: ${TABLE}.truncated_copy ;;
  }

  ## Measures Below ##

  measure: total_impressions {
    label: "Impressions"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    label: "Spend"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:${spend} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    type: number
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_site_visits {
    label: "Site Visits"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${site_visit} ;;
  }

  measure: total_engaged_users {
    label: "Engaged Users"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${engaged_user} ;;
  }

  measure: total_purchases {
    label: "Purchases"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${purchase} ;;
  }



  measure: count {
    type: count
    drill_fields: [id, creative_name]
  }
}
