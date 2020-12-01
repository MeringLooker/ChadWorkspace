connection: "mc_panoply"

include: "/TSY_Weleda/*.view"

datagroup: tsy_default_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## Attribtution Data ##

explore: weleda_attribution_extended {
  persist_with: tsy_default_datagroup
  extends: [weleda_attribution]
  hidden: no
}

## Delivery Data ##

explore: weleda_delivery_extended {
  persist_with: tsy_default_datagroup
  extends: [weleda_delivery]
  hidden: no
}
