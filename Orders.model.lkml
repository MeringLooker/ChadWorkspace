connection: "mc_panoply"
# include: "*.view.lkml"

# explore: orderitems {
#   group_label: "Workspace"
#   label: "Order Items"

#   join: orders {
#     type: left_outer
#     sql_on: ${orders.order_num}=${orderitems.order_num} ;;
#     relationship:many_to_one
#   }

#   join: products {
#     type:  left_outer
#     sql_on: ${products.prod_id} = ${orderitems.prod_id} ;;
#     relationship: many_to_one
#   }
#   }
