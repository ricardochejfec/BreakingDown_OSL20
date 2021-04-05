# 2020 Drastically Increased the Number of People on the Ontario Sunshine List

## An analysis of Ontario Public Sector's "Highest" Earners

## Summary (Issue)

-   The 2020 Ontario Sunshine List was released on \_\_\_\_\_. It reported over 200,000 people, out of which $\_\_$ were new, or an increase of $\_\_$.

-   While the list has expanded every year, this year's growth was significantly larger than what the trend predicted.

-   Led by nurses and teachers, the higher-than-expected increase can be explained by a major compensation agreement in early 2020 and the government's efforts to combat the pandemic.

## This Report

What follows is a descriptive analysis of the Ontario Sunshine List. The main section is my attempt to shed some light on the effects of 2020 on Ontario's high earners. Appendix A considers what would happen if the list's cut-off salary was adjusted for inflation and Appendix B includes other descriptive statistics that were not relevant to the research question. The project is intended to be fully reproducible. If you're interested in replicating or improving this analysis see the Read Me file to get started.

## What is the OSL (Background)

A *sunshine list* is the name commonly given to the public disclosure of employee compensation. In 1996, then premier Mike Harris, introduced the first Ontario Sunshine List, intending to disclose the salaries and benefits of all employees on the provincial government payroll who were considered high earners. Setting the floor at a salary of \$100,000, the province reported \_\_\_\_ high earners that year, with an average salary of \_\_\_\_. Dictated by the Public Sector Salary Disclosure Act (1996), the government has required ever since that organizations that receive public funding from the Province of Ontario disclose by March 31 the names, positions, salaries and total taxable benefits of employees paid \$100,000 or more in a calendar year.

### Uninterrupted Growth

The number of people in the Ontario public sector making more than \$100k a year has increased with every release since its conception 25 years ago. It was twice as big by 2000, ten times by 2008, and today the list is 45 times larger than in 1996. Regardless, the yearly average earnings have remained mostly constant around \_\_\_\_\_, likely because increasing existing salaries are compensated by the new additions to the list, most of which earn a salary close to the floor.

![Long Summary](plots/p_longsum_grid.png)

### Recorded by Government Sector

The data provided is categorized by government sector. While these sectors change slightly year-to-year as a result of administrative changes and operational restructuring (See Appendix:\_\_ for a full list), we can functionally group all employees reported in 9 independent sectors. The following figure shows the number of people in the list through time divided by sector.

While the size of sectors vary, Municipalities, School Boards, Hospitals, and Universities, have captured the lion share of high earners for most of the lists existence.

![Long Summary by Sector](plots/p_longsecsum.png)

## 2020 in Review (Context)

The last release of the OSL reported an increase in members by a total of $\_\_$ members ( total) and and reduction in the average salary of $\_\_$ ( total).

### Municipalities, School-Boards and Hospitals

Municipalities, School-Boards, and Hospitals, top the share of high earners in 2020 by a significant margin, making-up almost two thirds of the total.

![Waffle Chart of OLS 202](plots/waffle.png)

All sectors saw the number of people making over \$100k increase, but it was School Boards and Hospitals that saw the biggest change.

**School Boards**

-   The share of teachers in the OLS increased by $\_\_$, leading the sector's increase.

-   All five relevant [unions](link) agreed to new contracts in early spring 2020.

**Hospitals**

-   Similarly, it was an increase in the percentage of nurses ($\_\_$) that can explain that drastic increase in the Hospital sector.

-   While there was no wide changes to compensation agreements, the increase can be explained by the government's response to the COVID-19 pandemic. Facing a health crisis characterized by crowded intensive care units and a need to enforce public health guidelines unto the public, the Ford government engaged in several expended recruitment bouts, attempting to increase the number of health care professionals in hospitals, schools, and long-term care homes. [source](link)

![Percent Change in Quantity](plots/p_change_1920.png)

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rtogvnkbfg .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 50%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rtogvnkbfg .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rtogvnkbfg .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#rtogvnkbfg .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#rtogvnkbfg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rtogvnkbfg .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rtogvnkbfg .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rtogvnkbfg .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rtogvnkbfg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rtogvnkbfg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rtogvnkbfg .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rtogvnkbfg .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#rtogvnkbfg .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rtogvnkbfg .gt_from_md > :first-child {
  margin-top: 0;
}

#rtogvnkbfg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rtogvnkbfg .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rtogvnkbfg .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#rtogvnkbfg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rtogvnkbfg .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#rtogvnkbfg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rtogvnkbfg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rtogvnkbfg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rtogvnkbfg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rtogvnkbfg .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rtogvnkbfg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#rtogvnkbfg .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rtogvnkbfg .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#rtogvnkbfg .gt_left {
  text-align: left;
}

#rtogvnkbfg .gt_center {
  text-align: center;
}

#rtogvnkbfg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rtogvnkbfg .gt_font_normal {
  font-weight: normal;
}

#rtogvnkbfg .gt_font_bold {
  font-weight: bold;
}

#rtogvnkbfg .gt_font_italic {
  font-style: italic;
}

#rtogvnkbfg .gt_super {
  font-size: 65%;
}

#rtogvnkbfg .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
```
::: {#rtogvnkbfg style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"}
<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="3" class="gt_heading gt_title gt_font_normal" style>

The 5 Most Popular Job Titles 2020

</th>

</tr>

<tr>

<th colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Job Title</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Count</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Avg Salary</strong>

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_center">

Teacher

</td>

<td class="gt_row gt_center">

29,877

</td>

<td class="gt_row gt_center">

\$103,428

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Nurse

</td>

<td class="gt_row gt_center">

20,535

</td>

<td class="gt_row gt_center">

\$111,101

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Manager

</td>

<td class="gt_row gt_center">

19,924

</td>

<td class="gt_row gt_center">

\$126,871

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Professor

</td>

<td class="gt_row gt_center">

18,864

</td>

<td class="gt_row gt_center">

\$152,707

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Director

</td>

<td class="gt_row gt_center">

11,256

</td>

<td class="gt_row gt_center">

\$144,903

</td>

</tr>

</tbody>

</table>
:::

### Job Titles

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rqotttfxls .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 50%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rqotttfxls .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rqotttfxls .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#rqotttfxls .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#rqotttfxls .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rqotttfxls .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rqotttfxls .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rqotttfxls .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rqotttfxls .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rqotttfxls .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rqotttfxls .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rqotttfxls .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#rqotttfxls .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rqotttfxls .gt_from_md > :first-child {
  margin-top: 0;
}

#rqotttfxls .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rqotttfxls .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rqotttfxls .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#rqotttfxls .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rqotttfxls .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#rqotttfxls .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rqotttfxls .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rqotttfxls .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rqotttfxls .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rqotttfxls .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rqotttfxls .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#rqotttfxls .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rqotttfxls .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#rqotttfxls .gt_left {
  text-align: left;
}

#rqotttfxls .gt_center {
  text-align: center;
}

#rqotttfxls .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rqotttfxls .gt_font_normal {
  font-weight: normal;
}

#rqotttfxls .gt_font_bold {
  font-weight: bold;
}

#rqotttfxls .gt_font_italic {
  font-style: italic;
}

#rqotttfxls .gt_super {
  font-size: 65%;
}

#rqotttfxls .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
```
::: {#rqotttfxls style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"}
<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="3" class="gt_heading gt_title gt_font_normal" style>

The 5 Most Popular Job Titles 2020

</th>

</tr>

<tr>

<th colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Job Title</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Count</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Avg Salary</strong>

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_center">

Teacher

</td>

<td class="gt_row gt_center">

29,877

</td>

<td class="gt_row gt_center">

\$103,428

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Nurse

</td>

<td class="gt_row gt_center">

20,535

</td>

<td class="gt_row gt_center">

\$111,101

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Manager

</td>

<td class="gt_row gt_center">

19,924

</td>

<td class="gt_row gt_center">

\$126,871

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Professor

</td>

<td class="gt_row gt_center">

18,864

</td>

<td class="gt_row gt_center">

\$152,707

</td>

</tr>

<tr>

<td class="gt_row gt_center">

Director

</td>

<td class="gt_row gt_center">

11,256

</td>

<td class="gt_row gt_center">

\$144,903

</td>

</tr>

</tbody>

</table>
:::

## A Recession with Unparalleled Growth (Analysis)

The absolute number of people in the list coupled with the drastic change from 2019, may raise worries about government spending. In particular amid an economic crisis, a growing OSL illustrates how government employees can get richer while many struggle to keep their jobs. However, it is important to consider the two following questions before using this information to advocate for changes.

-   Was the increase in 2020 in line with the observed growth trend?
-   Where is the increase coming from?

### Overall growth higher than expected

Using a generalized additive model (GAM) w/ poisson we can project what the expected growth in number of people earning more than \\\$100k would have been based solely on the observed trend. As we can see, the total number was expected to be between $\_\_$ and $\_\_$. According to this model, the list saw an increase significantly larger than predicted.

![Predicted values](plots/p_longsum_pred.png)

### The Culprits

However, increased growth alone is not enough to warrant concerns. It is more interesting to look at where this growth is coming from. As discussed above, Hospitals and School Boards led the pack in number of new members joining the list in 2002 but, how did this growth align with the projected trend?

![Predicted values by sector](plots/p_longsum_pred_sec.png)

Nearly all sectors saw increases in line with projections. Crown Agencies, Hospitals, and School Boards, stand out with increases far above expected. Increases in Hospitals and School Boards was led by nurses and teachers respectively. Crown Corporations saw a drastic increase in the number of nurses, bosses (managers and directors), and specialists.

This analysis indicates that the above-projected growth observed, its not the result of broad salary increases or financial mismanagement. Instead it illustrates the strains that 2020 imposed on the Ontario government. Starting in February, the five unions representing the teachers of Ontario negotiated a new compensation agreement with the government. Negotiations went on until April and the result did not come without friction, with teacher strikes and blah blah. Advocates argue that blah blah blah.

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#gvbamywvzf .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 100%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#gvbamywvzf .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gvbamywvzf .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#gvbamywvzf .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#gvbamywvzf .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gvbamywvzf .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gvbamywvzf .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#gvbamywvzf .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#gvbamywvzf .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#gvbamywvzf .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#gvbamywvzf .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#gvbamywvzf .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#gvbamywvzf .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#gvbamywvzf .gt_from_md > :first-child {
  margin-top: 0;
}

#gvbamywvzf .gt_from_md > :last-child {
  margin-bottom: 0;
}

#gvbamywvzf .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#gvbamywvzf .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#gvbamywvzf .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gvbamywvzf .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#gvbamywvzf .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gvbamywvzf .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#gvbamywvzf .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#gvbamywvzf .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gvbamywvzf .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gvbamywvzf .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#gvbamywvzf .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gvbamywvzf .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#gvbamywvzf .gt_left {
  text-align: left;
}

#gvbamywvzf .gt_center {
  text-align: center;
}

#gvbamywvzf .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#gvbamywvzf .gt_font_normal {
  font-weight: normal;
}

#gvbamywvzf .gt_font_bold {
  font-weight: bold;
}

#gvbamywvzf .gt_font_italic {
  font-style: italic;
}

#gvbamywvzf .gt_super {
  font-size: 65%;
}

#gvbamywvzf .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
```
::: {#gvbamywvzf style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"}
<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="5" class="gt_heading gt_title gt_font_normal" style>

Biggest Changes in School Boards

</th>

</tr>

<tr>

<th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

<strong>Job Title</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change %</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Sector Increase</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Total Increase</strong>

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

Teacher

</td>

<td class="gt_row gt_center">

15,149

</td>

<td class="gt_row gt_center">

102.96%

</td>

<td class="gt_row gt_center">

97.07%

</td>

<td class="gt_row gt_center">

39.34%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Management

</td>

<td class="gt_row gt_center">

136

</td>

<td class="gt_row gt_center">

1.44%

</td>

<td class="gt_row gt_center">

0.87%

</td>

<td class="gt_row gt_center">

0.35%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Manager

</td>

<td class="gt_row gt_center">

75

</td>

<td class="gt_row gt_center">

13.18%

</td>

<td class="gt_row gt_center">

0.48%

</td>

<td class="gt_row gt_center">

0.19%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Social worker

</td>

<td class="gt_row gt_center">

63

</td>

<td class="gt_row gt_center">

118.87%

</td>

<td class="gt_row gt_center">

0.40%

</td>

<td class="gt_row gt_center">

0.16%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

School leadership position

</td>

<td class="gt_row gt_center">

44

</td>

<td class="gt_row gt_center">

35.20%

</td>

<td class="gt_row gt_center">

0.28%

</td>

<td class="gt_row gt_center">

0.11%

</td>

</tr>

</tbody>

</table>
:::

By April, Canada had reported \_\_\_ cases and lock-downs in blah and blah had been implemented. As the pandemic grew, the need for more nurses in hospitals and blah blah centers like long term homes was critical, and the government responded accordingly. It is very likely that the trend observed is caused by a combination of new nurses and other strains of the pandemic (increased overtime?).

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pngnmebyeu .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 100%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pngnmebyeu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pngnmebyeu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pngnmebyeu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pngnmebyeu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pngnmebyeu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pngnmebyeu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pngnmebyeu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pngnmebyeu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pngnmebyeu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pngnmebyeu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pngnmebyeu .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pngnmebyeu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pngnmebyeu .gt_from_md > :first-child {
  margin-top: 0;
}

#pngnmebyeu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pngnmebyeu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pngnmebyeu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pngnmebyeu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pngnmebyeu .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pngnmebyeu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pngnmebyeu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pngnmebyeu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pngnmebyeu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pngnmebyeu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pngnmebyeu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pngnmebyeu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pngnmebyeu .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pngnmebyeu .gt_left {
  text-align: left;
}

#pngnmebyeu .gt_center {
  text-align: center;
}

#pngnmebyeu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pngnmebyeu .gt_font_normal {
  font-weight: normal;
}

#pngnmebyeu .gt_font_bold {
  font-weight: bold;
}

#pngnmebyeu .gt_font_italic {
  font-style: italic;
}

#pngnmebyeu .gt_super {
  font-size: 65%;
}

#pngnmebyeu .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
```
::: {#pngnmebyeu style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"}
<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="5" class="gt_heading gt_title gt_font_normal" style>

Biggest Changes in Hospitals And Boards Of Public Health

</th>

</tr>

<tr>

<th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

<strong>Job Title</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change %</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Sector Increase</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Total Increase</strong>

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

Nurse

</td>

<td class="gt_row gt_center">

8,993

</td>

<td class="gt_row gt_center">

93.15%

</td>

<td class="gt_row gt_center">

71.49%

</td>

<td class="gt_row gt_center">

23.35%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Manager

</td>

<td class="gt_row gt_center">

542

</td>

<td class="gt_row gt_center">

17.23%

</td>

<td class="gt_row gt_center">

4.31%

</td>

<td class="gt_row gt_center">

1.41%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Respiratory therapist

</td>

<td class="gt_row gt_center">

286

</td>

<td class="gt_row gt_center">

307.53%

</td>

<td class="gt_row gt_center">

2.27%

</td>

<td class="gt_row gt_center">

0.74%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Social worker

</td>

<td class="gt_row gt_center">

255

</td>

<td class="gt_row gt_center">

531.25%

</td>

<td class="gt_row gt_center">

2.03%

</td>

<td class="gt_row gt_center">

0.66%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Pharmacist

</td>

<td class="gt_row gt_center">

118

</td>

<td class="gt_row gt_center">

14.08%

</td>

<td class="gt_row gt_center">

0.94%

</td>

<td class="gt_row gt_center">

0.31%

</td>

</tr>

</tbody>

</table>
:::

While Crown Agencies make a smaller share of the list, the higher than expected growth warrant a closer look. Most of the growth seen in 2020 came from management positions like *director* and *manager*, as well as new-to-the-list job titles like *specialist, return to work program*. The pandemic has resulted in both a health and economic crises with an increased need for policy and logistics development. The growth seen in Crown Agencies in 2020 is likely a result of more management and analysts, rising to navigate the difficult terrain of operating amid a pandemic.

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#sasjlydeuo .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: 100%;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#sasjlydeuo .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sasjlydeuo .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#sasjlydeuo .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#sasjlydeuo .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sasjlydeuo .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sasjlydeuo .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#sasjlydeuo .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#sasjlydeuo .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#sasjlydeuo .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#sasjlydeuo .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#sasjlydeuo .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#sasjlydeuo .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#sasjlydeuo .gt_from_md > :first-child {
  margin-top: 0;
}

#sasjlydeuo .gt_from_md > :last-child {
  margin-bottom: 0;
}

#sasjlydeuo .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#sasjlydeuo .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#sasjlydeuo .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sasjlydeuo .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#sasjlydeuo .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sasjlydeuo .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#sasjlydeuo .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#sasjlydeuo .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sasjlydeuo .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sasjlydeuo .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#sasjlydeuo .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sasjlydeuo .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#sasjlydeuo .gt_left {
  text-align: left;
}

#sasjlydeuo .gt_center {
  text-align: center;
}

#sasjlydeuo .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#sasjlydeuo .gt_font_normal {
  font-weight: normal;
}

#sasjlydeuo .gt_font_bold {
  font-weight: bold;
}

#sasjlydeuo .gt_font_italic {
  font-style: italic;
}

#sasjlydeuo .gt_super {
  font-size: 65%;
}

#sasjlydeuo .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
```
::: {#sasjlydeuo style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"}
<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="5" class="gt_heading gt_title gt_font_normal" style>

Biggest Changes in Crown Agencies

</th>

</tr>

<tr>

<th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

<strong>Job Title</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Change %</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Sector Increase</strong>

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

<strong>Share of Total Increase</strong>

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

Manager

</td>

<td class="gt_row gt_center">

418

</td>

<td class="gt_row gt_center">

20.05%

</td>

<td class="gt_row gt_center">

18.06%

</td>

<td class="gt_row gt_center">

1.09%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

CM

</td>

<td class="gt_row gt_center">

270

</td>

<td class="gt_row gt_center">

391.30%

</td>

<td class="gt_row gt_center">

11.66%

</td>

<td class="gt_row gt_center">

0.70%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Specialist, return to work program

</td>

<td class="gt_row gt_center">

216

</td>

<td class="gt_row gt_center">

10,800.00%

</td>

<td class="gt_row gt_center">

9.33%

</td>

<td class="gt_row gt_center">

0.56%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

Director

</td>

<td class="gt_row gt_center">

87

</td>

<td class="gt_row gt_center">

7.82%

</td>

<td class="gt_row gt_center">

3.76%

</td>

<td class="gt_row gt_center">

0.23%

</td>

</tr>

<tr>

<td class="gt_row gt_right">

PM

</td>

<td class="gt_row gt_center">

63

</td>

<td class="gt_row gt_center">

31.03%

</td>

<td class="gt_row gt_center">

2.72%

</td>

<td class="gt_row gt_center">

0.16%

</td>

</tr>

</tbody>

<tfoot class="gt_sourcenotes">

<tr>

<td class="gt_sourcenote" colspan="5">

Specialists increased from 2 in 2019 to 216 in 2020.

</td>

</tr>

<tr>

<td class="gt_sourcenote" colspan="5">

CM = Case Manager PM = Project Manger

</td>

</tr>

</tfoot>

</table>
:::

## Conclusion

# Appendix A - Adjusting for Inflation

### Only 8% Remain

![Violin Chart of OLS adjusted for Inflation](plots/p_violins.png)

### Universities, Universities, Universities

![Sector Summary 2020 Adjusted for Inflation](plots/p_secsum_20_adj.png)

### Adjusted for Inflation... things get messy

![Predicted values](plots/p_longsum_pred_adj.png)

# Appendix B - Supplemental Information

Fig 3 shows how average earnings by sector differ from the average trend observed above. While most sectors seem to remain mostly constant between \$100K and \$150K, Universities and Ontario Power Generation have seen a generally upward sloping trend and Hospitals avg salaries have been decreasing. Further investigation is required to learn more about the cause for this trends.

![Long Summary by Sector in dollars](plots/p_longsecsum_d.png)
