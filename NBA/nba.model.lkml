connection: "chad_workspace"

include: "/NBA/**/*.view.lkml"              # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: nba_players {
  view_name: nba_players
  group_label: "NBA"
  label: "NBA Players"
   }

explore: nba_rannking {
  view_name: nba_rannking
  group_label: "NBA"
  label: "NBA Ranking"
}
