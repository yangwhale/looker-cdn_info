view: requests {
  sql_table_name: `ds_us.requests`
    ;;

  dimension: http_request {
    hidden: yes
    sql: ${TABLE}.httpRequest ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: jsonpayload_type_loadbalancerlogentry {
    hidden: yes
    sql: ${TABLE}.jsonpayload_type_loadbalancerlogentry ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  dimension: operation {
    hidden: yes
    sql: ${TABLE}.operation ;;
  }

  dimension_group: receive_timestamp {
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
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: source_location {
    hidden: yes
    sql: ${TABLE}.sourceLocation ;;
  }

  dimension: span_id {
    type: string
    sql: ${TABLE}.spanId ;;
  }

  dimension: text_payload {
    type: string
    sql: ${TABLE}.textPayload ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trace {
    type: string
    sql: ${TABLE}.trace ;;
  }

  dimension: trace_sampled {
    type: yesno
    sql: ${TABLE}.traceSampled ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}

view: requests__resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: requests__resource__labels {
  dimension: backend_service_name {
    type: string
    sql: ${TABLE}.backend_service_name ;;
  }

  dimension: forwarding_rule_name {
    type: string
    sql: ${TABLE}.forwarding_rule_name ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: target_proxy_name {
    type: string
    sql: ${TABLE}.target_proxy_name ;;
  }

  dimension: url_map_name {
    type: string
    sql: ${TABLE}.url_map_name ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }
}

view: requests__jsonpayload_type_loadbalancerlogentry {
  dimension: _type {
    type: string
    sql: ${TABLE}._type ;;
  }

  dimension: cacheid {
    type: string
    sql: ${TABLE}.cacheid ;;
  }

  dimension: parentinsertid {
    type: string
    sql: ${TABLE}.parentinsertid ;;
  }

  dimension: statusdetails {
    type: string
    sql: ${TABLE}.statusdetails ;;
  }
}

view: requests__http_request {
  dimension: cache_fill_bytes {
    type: number
    sql: ${TABLE}.cacheFillBytes ;;
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cacheHit ;;
  }

  dimension: cache_lookup {
    type: yesno
    sql: ${TABLE}.cacheLookup ;;
  }

  dimension: cache_validated_with_origin_server {
    type: yesno
    sql: ${TABLE}.cacheValidatedWithOriginServer ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: request_method {
    type: string
    sql: ${TABLE}.requestMethod ;;
  }

  dimension: request_size {
    type: number
    sql: ${TABLE}.requestSize ;;
  }

  dimension: request_url {
    type: string
    sql: ${TABLE}.requestUrl ;;
  }

  dimension: response_size {
    type: number
    sql: ${TABLE}.responseSize ;;
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.serverIp ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }

  measure: total_egress_bytes {
    hidden: yes
    label: "Total Egress Bytes"
    group_label: "CDN Information"
    description: "Total Network Egress Bytes"
    type: sum
    sql: ${response_size};;
    value_format_name: decimal_2
  }

  measure: total_cache_fill_bytes {
    hidden: yes
    label: "Total Cache Fill Bytes"
    group_label: "CDN Information"
    description: "Total Cache Fill Bytes"
    type: sum
    sql: ${cache_fill_bytes};;
    value_format_name: decimal_2
  }

  measure: total_egress_GB {
    label: "Total Egress GB"
    group_label: "CDN Information"
    description: "Total Network Egress GB"
    type: number
    sql: 1.0 * ${total_egress_bytes} /1024 /1024 /1024;;
    value_format_name: decimal_2
    drill_fields: [cache_fill_bytes,cache_hit,cache_lookup,protocol,remote_ip,request_size,request_url,total_egress_bytes,user_agent,status]
  }

  measure: total_cache_fill_GB {
    label: "Total Cache Fill GB"
    group_label: "CDN Information"
    description: "Total Cache Fill GB"
    type: number
    sql: 1.0 * ${total_cache_fill_bytes} /1024 /1024 /1024;;
    value_format_name: decimal_2
    drill_fields: [cache_fill_bytes,cache_hit,cache_lookup,protocol,remote_ip,request_size,request_url,total_egress_bytes,user_agent,status]
  }

  measure: hit_count {
    hidden: yes
    type: count
    filters: {
      field: cache_hit
      value: "Yes"
    }
  }

  measure: error_count {
    hidden: yes
    type: count
    filters: {
      field: status
      value: ">=400"
    }
  }

  measure: total_count {
    hidden: yes
    type: count
  }
  measure: hit_rate {
    label: "Hit Rate"
    group_label: "CDN Information"
    description: "CDN Hit Rate"
    type: number
    sql: ${hit_count}/${total_count};;
    value_format_name: percent_2
    drill_fields: [cache_fill_bytes,cache_hit,cache_lookup,protocol,remote_ip,request_size,request_url,total_egress_bytes,user_agent,status]
  }

  measure: error_rate {
    label: "Error Rate"
    group_label: "CDN Information"
    description: "CDN Error Rate"
    type: number
    sql: ${error_count}/${total_count};;
    value_format_name: percent_2
    drill_fields: [cache_fill_bytes,cache_hit,cache_lookup,protocol,remote_ip,request_size,request_url,total_egress_bytes,user_agent,status]
  }
}

view: requests__source_location {
  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: function {
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }
}

view: requests__operation {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first {
    type: yesno
    sql: ${TABLE}.first ;;
  }

  dimension: last {
    type: yesno
    sql: ${TABLE}.last ;;
  }

  dimension: producer {
    type: string
    sql: ${TABLE}.producer ;;
  }
}
