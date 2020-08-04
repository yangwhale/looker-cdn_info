connection: "chris_demo_cdn_bq_log"

# include all the views
include: "/views/**/*.view"

datagroup: chris_lkml_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: chris_lkml_project_default_datagroup

explore: requests {
  join: requests__resource {
    view_label: "Requests: Resource"
    sql: LEFT JOIN UNNEST([${requests.resource}]) as requests__resource ;;
    relationship: one_to_one
  }

  join: requests__resource__labels {
    view_label: "Requests: Resource Labels"
    sql: LEFT JOIN UNNEST([${requests__resource.labels}]) as requests__resource__labels ;;
    relationship: one_to_one
  }

  join: requests__jsonpayload_type_loadbalancerlogentry {
    view_label: "Requests: Jsonpayload Type Loadbalancerlogentry"
    sql: LEFT JOIN UNNEST([${requests.jsonpayload_type_loadbalancerlogentry}]) as requests__jsonpayload_type_loadbalancerlogentry ;;
    relationship: one_to_one
  }

  join: requests__http_request {
    view_label: "Requests: Httprequest"
    sql: LEFT JOIN UNNEST([${requests.http_request}]) as requests__http_request ;;
    relationship: one_to_one
  }

  join: requests__source_location {
    view_label: "Requests: Sourcelocation"
    sql: LEFT JOIN UNNEST([${requests.source_location}]) as requests__source_location ;;
    relationship: one_to_one
  }

  join: requests__operation {
    view_label: "Requests: Operation"
    sql: LEFT JOIN UNNEST([${requests.operation}]) as requests__operation ;;
    relationship: one_to_one
  }
}
