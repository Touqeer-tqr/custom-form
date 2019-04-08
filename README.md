# Custom Range Selector

[![N|Solid](https://raw.githubusercontent.com/Touqeer-tqr/custom-form/master/app/assets/images/range-selector.png)]()

## Details
Sample app about how to create custom input tags for form
custom input tag that adds range slider with selector in which you can also enter text and slider will auto adjust.

## Instructions
```
<%= form_for root_path do |f| %>
  <%= f.range_selector [:min_rank, :max_rank], [0, 100], drop_down_options, type: 'amount' %>
<% end %>
```