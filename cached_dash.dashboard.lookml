- dashboard: cached_dash
  title: Cached dash
  layout: newspaper
  load_configuration: prefetch_cache_run
  elements:
  - name: Test look
    title: 'test'
    model: ryans_model
    explore: order_items
    type: table
    fields:
    - order_items.returned_time
    - order_items.order_id
    sorts:
    - order_items.returned_time desc
    limit: 4
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hide_legend: false
    x_axis_label: Orders made
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_labels:
      order_items.order_id: Other label
    title_hidden: true
