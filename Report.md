# 2020 Drastically Increased the Number of People on the Ontario Sunshine List

## An analysis of Ontario Public Sector’s “Highest” Earners

## Summary

-   The 2020 Ontario Sunshine List was released on March 19th 2021. It
    reported a total of 205,470 members, out of which 38,512 were new,
    or an increase of 23%.

-   While the list has expanded every year, this year’s growth was
    significantly larger than what the trend predicted.

-   Led by nurses and teachers, the higher-than-expected increase can be
    explained by a major compensation agreement in early 2020 and the
    government’s efforts to combat the pandemic.

## This Report

What follows is a descriptive analysis of the Ontario Sunshine List. The
main section is my attempt to shed some light on the effects of 2020 on
Ontario’s high earners. Appendix A considers what would happen if the
list’s cut-off salary was adjusted for inflation and Appendix B includes
other descriptive statistics that were not relevant to the research
question. The project is intended to be fully reproducible. If you’re
interested in replicating or improving this analysis see the README file
to get started.

## What is the OSL

A *sunshine list* is the name commonly given to the public disclosure of
employee compensation. In 1996, then premier Mike Harris, introduced the
first [Ontario Sunshine
List](https://www.ontario.ca/page/public-sector-salary-disclosure-2020-all-sectors-and-seconded-employees),
intending to disclose the salaries and benefits of all employees on the
provincial government payroll who were considered high earners. Setting
the floor at a salary of $100,000, the province reported 4,501 high
earners that year, with an average salary of $121,495.2. Dictated by the
[Public Sector Salary Disclosure
Act](https://www.ontario.ca/laws/statute/96p01a) (1996), the government
has required ever since that organizations that receive public funding
from the Province of Ontario disclose by March 31 the names, positions,
salaries and total taxable benefits of employees paid $100,000 or more
in a calendar year.

### Uninterrupted Growth

The number of people in the Ontario Sunshine List has increased with
every release since its conception 25 years ago. It was twice as big by
2000, ten times by 2008, and today the list is 45 times larger than in
1996. Regardless, the yearly average earnings have remained mostly
constant around $127,372, likely because increasing existing salaries
are compensated by new additions to the list, most of which earn a
salary close to the floor.

![Long Summary](plots/p_longsum_grid.png)

### Recorded by Government Sector

The data provided is categorized by government sector. While these
sectors change slightly year-to-year as a result of administrative
changes and operational restructuring (See Appendix B for a full list),
we can functionally group all employees reported in 9 independent
sectors. The following figure shows the number of people in the list
through time divided by sector.

While the size of sectors vary, Municipalities, School Boards,
Hospitals, and Universities, have captured the lion share of high
earners for most of the lists existence.

![Long Summary by Sector](plots/p_longsecsum.png)

## 2020 in Review

The last release of the OSL reported an increase in members by a total
of 38,512 members and a reduction in the average salary of $1,523.196.

### Municipalities, School-Boards and Hospitals

Municipalities, School-Boards, and Hospitals, top the share of high
earners in 2020 by a significant margin, making-up almost two thirds of
the total.

![Waffle Chart of OLS 2020](plots/waffle.png)

**Municipalities**

-   Police constables ($118k), managers ($129), and firefighters
    ($117k), made up almost a third of the job titles in Municipalities
    in 2020.

-   The average salary was $123,291.5. The highest paid positions were
    Chief of Police ($481k), Chief of Police ($436k), and City Planner
    ($387k).

All sectors saw the number of people making over $100k increase, but it
was School Boards and Hospitals that saw the biggest change.

**School Boards**

-   Teachers ($103k) dominated the School Board sector in 2020, making
    up 97% of jobs in the list.

-   The average salary was $109,083.8. The highest paid positions were
    Legal Counsel ($382k), Director ($334k), and Director ($316k).

**Hospitals**

-   The list was topped by Nurses ($110k), followed by Managers ($116) ,
    and Directors ($148k)

-   The average salary was $120,083.3. The highest paid positions were
    President and CEO ($845k), President and CEO ($776k), and President
    and CEO ($733k).

![Percent Change in Quantity](plots/p_change_1920.png)

### Job Titles

Teachers and nurses were by far the most popular jobs in the Ontario
Sunshine List of 2020. The best paying jobs in contrast went mostly to
Ontario Power Sector with President and CEO ($1.22M), President Nuclear
($1.13M), and CEO/Chief Nuclear Officer ($901k) as the top 3.

![Top 5 Job Titles](tables/top_5_table.png)

## Modeling Growth

Using a generalized additive model (GAM) with a Poisson distribution, I
forecast what growth in the list could have looked like **if** the
number of people in the list increased according to the observed trend
leading to 2020.

### Overall growth higher than expected

This model concludes that the increase in the number of people in the
OSL in 2020 was much higher than expected. While it predicted that only
175,511 public sector workers would earn more than $100k, or an increase
of 18%. Instead, the list featured 205,470 members (23%), surpassing
expectations by 29,959 employees.

![Predicted values](plots/p_longsum_pred.png)

This fact alone may raise some eyebrows but it is important to
investigate the sources of such increase before reaching any
conclusions.

### The Culprits

We can apply the same technique for individual sectors in the list. This
allows us to identify the individual impact of 2020 on each sector and
attempt to determine where the above-expectations growth is coming from.

![Predicted values by sector](plots/p_longsum_pred_sec.png)

While earlier we learned that municipalities make up the largest share
of the list and saw one of the biggest increases of 2020, we can see
that its count is mostly in line with our model’s predictions. Instead,
when accounting for the expected trend, Crown Agencies join School
Boards and Hospitals, in the list of sectors which growth exceeded
expectations.

#### Crown Agencies

While Crown Agencies make a smaller share of the list, its
higher-than-predicted growth warrants a closer look.

-   The model predicted 8,351 members but the data reported 9,332 - a
    difference of 981

-   About 40% of the growth can be explained by increases in Managers,
    Case Managers, and Specialist, return to work program.

-   The difference is likely a result of the various agencies’ efforts
    to operate during the COVID-19 pandemic.

    -   The government has engaged on several
        [rounds](https://news.ontario.ca/en/release/58807/ontario-hiring-hundreds-more-contact-tracers-and-case-managers)
        of hiring surges of Case Managers and Contact Tracers intending
        to “to help track, trace and isolate new cases of COVID-19”. By
        [January
        2021](https://news.ontario.ca/en/release/59964/ontario-expands-case-and-contact-management-workforce),
        the government reported 5,600 case and contact tracers in the
        province.

    -   Specialist, return to work program, are employees in Ontario’s
        [Workplace Safety & Insurance
        Board](http://www.owa.gov.on.ca/en/returningtowork/Pages/Early-and-Safe-Return-to-Work.aspx)
        that are tasked with helping injured workers that have had
        difficulties returning to work.

    -   While I found no evidence to confirm this, I presume part of the
        increase in Managers and Specialists, happened because of a need
        for increased logistics and planning, and the hazardous nature
        of the pandemic on workplaces, respectively.

![Crown Job Change](tables/crown_change.png)

#### School Boards

-   The model predicted 34,019 members but the data reported 43,805 - a
    difference of 9,786

-   Virtually all growth came from Teachers new to the list (a shocking
    ~40% of the total increase in 2020).

-   As front-line workers, teachers in Ontario have been fully exposed
    to the dangers and impacts of the pandemic. While increased working
    hours from the pandemic help explain this growth, it was a major
    compensation agreement in early 2020 that was likely the main
    source.

    -   The 2019-2020 school year was a contract negotiation year for
        all unionized workers in School Boards in Ontario. The
        government ratified agreements with the various teacher unions
        throughout spring of 2020.

    -   The collective agreements included raises in compensation and
        benefits (given retroactively) and were negotiated with all five
        relevant [teacher
        boards](https://news.ontario.ca/en/backgrounder/56838/ocew-central-agreement-now-ratified)
        Ontario Council of Educational Workers (OCEW), (Canadian Union
        of Public Employees (CUPE), Education Workers’ Alliance of
        Ontario (EWAO), Ontario English Catholic Teachers’ Association
        (OECTA), and the Elementary Teachers’ Federation of Ontario
        (ETFO).

    -   Apart from the raise, it is likely that overtime and teachers
        filling in in administrative positions also contributed to the
        increase in teachers in the 2020 OSL. Also notable, the pandemic
        led to a significant rise in the number of social workers (in
        all three sectors).

![School Job Change](tables/school_change.png)

#### Hospitals

-   The model predicted 26,312 members but the data reported 33,928 - a
    difference of 7,616
-   Similar to School Boards, the distribution of job titles in
    Hospitals and Boards of Public Health is skewed towards one
    profession. Nurses made up more than 90% of the sector increase in
    2020 and almost a quarter of the total growth.
-   The provincial government has been expanding their nurse staff since
    [mid
    2020](https://news.ontario.ca/en/release/58580/ontario-investing-525-million-to-recruit-retain-and-support-more-health-care-workers).
    Alongside it, a [pandemic pay
    bump](https://www.ontario.ca/page/covid-19-temporary-pandemic-pay)
    applied to health care workers in the fall, as well as overtime
    hours in dealing with the pandemic explain the drastic increase.
-   Also notable, we saw in increase in social workers similar than the
    one seen in School Boards and, in line with the health implications
    of COVID-19, we see the number of Respiratory Therapists on the list
    increase by 300%.

![Hosp Job Change](tables/hosp_change.png)

## Conclusion

There is only so much we can extrapolate from this limited information.
While we can conclude that the increase observed was higher than normal,
and this was due to very large increases in the number of teachers and
nurses, it is impossible to determine whether the decisions behind such
changes were appropriate, successful, or efficient.

Many argue that the list’s floor should be raised according to inflation
(see Appendix A), whereas other countries like
[Norway](https://www.bbc.com/news/magazine-40669239) have opted for full
transparency in the public sector. It is clear that the cut-off, as it
exists now, does more to confuse than clarify. $100k dollars, while far
from the median ($37,500 as of
[2019](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1110023901&pickMembers%5B0%5D=1.8&pickMembers%5B1%5D=2.1&pickMembers%5B2%5D=3.1&pickMembers%5B3%5D=4.1&cubeTimeFrame.startYear=2000&cubeTimeFrame.endYear=2019&referencePeriods=20000101%2C20190101)),
covers too broad of a stroke to facilitate insights on the highest
earners, but too narrow to attempt to investigate broad changes in the
public sector. In fact, most of the reporting that follows the list’s
release, focuses seldomly on the individuals earning the highest
salaries. This is important information, but one that fails to give us
any valuable big-picture insights.

Further analysis on the OSL is welcomed, with interesting research
questions like contrasting trends through time with electoral cycles or
economic fluctuations. Earnings trends across sectors and job titles,
could also reach useful insights about the income distribution of
Ontario’s public sector.

------------------------------------------------------------------------

------------------------------------------------------------------------

# Appendix A - Adjusting for Inflation

The OSL is criticized for using the same cut-off at $100K that it began
with, instead of adjusting for inflation. Any analysis that intends to
learn more about Ontario’s highest earners, needs to account for the
difference in purchasing power between 1996 and 2020. If we were to
adjust for inflation, the floor today should sit at BLAH.

### Only 8% Remain

By adjusting all salaries to 1996 dollars, we can identify how the list
would have changed in the presence of a moving floor. While the list
containing all years available houses BLAH recorded salaries, when
adjusting for inflation only BLAH remain, or the equivalent to BLAH.

![Violin Chart of OLS adjusted for Inflation](plots/p_violins.png)

### Universities, Universities, Universities

The 2020 list shrinks by BLAH when adjusting for inflation, totaling
only BLAH members.

This analysis shows that at the higher cut-off, universities dominate
the list and have done so for quite some time. This is likely due to the
nature of the sector, where the majority of its members are professors.
The average salary of an Ontario Professor is BLAH compared to nurses at
BLAH and teachers at BLAH.

![Sector Summary 2020 Adjusted for Inflation](plots/p_secsum_20_adj.png)

### Modeling the List of Really High Earners

![Predicted values](plots/p_longsum_pred_adj.png)

![Adjusted modeling by sector](plots/p_longsum_pred_sec_adj.png)

------------------------------------------------------------------------

------------------------------------------------------------------------

# Appendix B - Supplemental Information

<!-- Fig 3 shows how average earnings by sector differ from the average trend observed above. While most sectors seem to remain mostly constant between \$100K and \$150K, Universities and Ontario Power Generation have seen a generally upward sloping trend and Hospitals avg salaries have been decreasing. -->
