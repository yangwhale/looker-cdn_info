- dashboard: cdn_information
  title: cdn_information
  layout: newspaper
  elements:
  - title: Egress GB
    name: Egress GB
    model: chris_lookml_project
    explore: requests
    type: looker_column
    fields: [requests__http_request.total_cache_fill_GB, requests.timestamp_date,
      requests__http_request.total_egress_GB]
    pivots: [requests.timestamp_date]
    fill_fields: [requests.timestamp_date]
    filters: {}
    sorts: [requests.timestamp_date]
    limit: 500
    dynamic_fields: [{measure: sum_of_cache_fill_bytes, based_on: requests__http_request.cache_fill_bytes,
        type: sum, label: Sum of Cache Fill Bytes, expression: !!null '', value_format: '0.000,,,
          "GB"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number},
      {measure: sum_of_response_size, based_on: requests__http_request.response_size,
        type: sum, label: Sum of Response Size, expression: !!null '', value_format: '0.000,,,
          "GB"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Date: requests.timestamp_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Hit Rate
    name: Hit Rate
    model: chris_lookml_project
    explore: requests
    type: looker_column
    fields: [requests.timestamp_date, requests__http_request.hit_rate]
    fill_fields: [requests.timestamp_date]
    filters: {}
    sorts: [requests.timestamp_date]
    limit: 500
    dynamic_fields: [{measure: count_of_status, based_on: requests__http_request.status,
        expression: '', label: Count of Status, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_status_2, based_on: requests__http_request.status,
        expression: '', label: Count of Status, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    series_colors:
      requests__http_request.hit_rate: "#B1399E"
    series_labels: {}
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_null_points: true
    interpolation: linear
    listen:
      Date: requests.timestamp_date
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Error Rate
    name: Error Rate
    model: chris_lookml_project
    explore: requests
    type: looker_column
    fields: [requests.timestamp_date, requests__http_request.error_rate]
    fill_fields: [requests.timestamp_date]
    filters: {}
    sorts: [requests.timestamp_date]
    limit: 500
    dynamic_fields: [{measure: count_of_status, based_on: requests__http_request.status,
        expression: '', label: Count of Status, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_status_2, based_on: requests__http_request.status,
        expression: '', label: Count of Status, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    series_colors:
      requests__http_request.hit_rate: "#B1399E"
    series_labels: {}
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_null_points: true
    interpolation: linear
    listen:
      Date: requests.timestamp_date
    row: 0
    col: 16
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
