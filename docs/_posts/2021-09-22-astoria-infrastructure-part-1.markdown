---
layout: post
title: "Astoria Infrastructure Part 1"
date: 2021-09-22 22:05:31 -0400
categories: infrastructure
---
For this post, several factors regarding infrastructure in Astoria, New York will be explored. This type of post will be expanded to look at other areas of New York City, but first the focus will be on Astoria.

## Crashes

One of the first things to look at when it comes to analyzing urban infrastructure is problem areas. Cars lead to many different problem, but let's start with the biggest one: death due to collisions. We can observe crash data at [NYC Crash Mapper](https://crashmapper.org/#/), and they also allow for filters to be implemented and the data to be downloaded as a CSV, GeoJSON, Shapefile, or KML file. First, let's focus on fatal crashes so far in 2021 (data from January to August). There have been three fatal crashes in Astoria in 2021, two occuring only blocks away from each other.

![Fatal Crash Map 2021 Jan - 2021 Aug]({{ site.baseurl }}/assets/images/FatalCrashMap202101-202108.png)

## Traffic Calming

Next, let's take a look at any traffic calming measures that the city has implemented in those areas. A very nice thing that New York City does is provide data as part of its Vision Zero initiative. Data can be found at [vzv.nyc](https://vzv.nyc/). There are some good data sources for *some* traffic calming measures, but there are some for which data is missing, such as lane width and specific implements such as pinchpoints and chicanes.

Let's take a look at what traffic calming measures data currently exists for and what they mean. Then we can take a look at what's missing and would be nice to see added.

Currently filters available and their definitions per the Department of Transportation:
1. **Leading pedestrian intervals** - Intersections where DOT installs signals that show a walk sign for pedestrians before showing a green light to vehicle traffic. The goal of these signals is to improve street safety by giving pedestrians a chance to establish their presence in the crosswalk before vehicles make turns across that crosswalk. 
2. **Major Safety Projects** - Safety-oriented engineering improvements that use multiple treatments (signals, markings, concrete etc) on both corridors and intersections. Improvements are generally aimed at better organizing traffic, improving travel times, creating shorter, safer pedestrian crossings, and safe routes for bicycle travel. The map displays operational (non-capital) projects from the start of Vision Zero onward: 2014 to present.
3. **Arterial Slow Zones** - The Arterial Slow Zone program uses a combination of a lower speed limit, signal timing changes, distinctive signs and increased enforcement to improve safety on some of New York City's most high-crash corridors. 
4. **Speed Humps** - Speed Humps are a raised area of a roadway designed to reduce vehicle speeds. Dates reflect the first time a speed hump was installed at a location, subsequent removals and/or re-installations are not included. 
5. **Safe Streets For Seniors** - The Safe Streets for Seniors program is an initiative aimed at increasing safety for older New Yorkers. Based on factors such as senior population density, injury crashes, and senior trip generators, DOT has selected and studied 25 Senior Pedestrian Focus Areas. Within these areas, DOT evaluates potential safety improvements and also conducts education outreach to senior centers.
6. **Neighborhood Slow Zones** - The Neighborhood Slow Zone program is an application based program which takes a neighborhood area and reduces the speed limit to 20 mph. Areas are chosen based on crashes, presence of schools and other neighborhood amenities, and community support. The treatments include a mixture of markings, signage, and speed humps. 
7. **25MPH Signal Retiming** - Priority Corridors where the signal progression has been changed to match the 25 MPH speed limit. 
8. **Turn Traffic Calming** - Intersections where DOT installs traffic calming measures that guide drivers to turn left or right at a safer speed and angle, as well as increase visibility for pedestrians in the crosswalk. 
9. **Enhanced Crossings** - Enhanced Crossings are marked high-visibility crosswalks on calm streets with low vehicle volumes and a strong pedestrian desire to cross. Standard DOT toolbox treatments are used (ADA pedestrian ramps, pedestrian warning signs and high-visibility crosswalk markings) to improve the mobility and accessibility of pedestrians. 
10. **Priority Intersections** - The intersections with the highest number of pedestrian KSI (killed and severely injured) that cumulatively account for 15% of the borough’s total pedestrian KSI. Developed as part of the Borough Pedestrian Safety Action Plans. 
11. **Priority Corridors** - All corridors in each borough were ranked on a pedestrian KSI (killed and severely injured) per-mile basis. Corridors were selected from the top of this list until the cumulative number of KSI reached half of the borough’s total. Developed as part of the Borough Pedestrian Safety Action Plans. 
12. **Priority Areas** - Areas in each borough were ranked on a pedestrian KSI density basis. Areas were selected from most dense to least, such that, when combined, account for half of all of pedestrian KSI in the borough. Developed as part of the Borough Pedestrian Safety Action Plans. 
13. **Bike Priority Areas** - Priority Bicycle Districts are neighborhoods with comparatively high numbers of cyclist KSI and few dedicated bicycle facilities. These districts, seven in Brooklyn and three in Queens, represent 14% of the City’s bicycle lane network and 23% of cyclist KSI. NYC DOT identified these areas in the 2017 report “Safer Cycling: Bicycle Ridership and Safety in New York City.” The agency has prioritized these areas for bicycle network expansion. 

Several of these categories do not represent safety measures that have been implemented. The safety measures that will be looked at are:
1. Leading Pedestrian Intervals
2. Arterial Slow Zones
3. Speed Humps
4. Neighborhood Slow Zones
5. 25MPH Signal Retiming
6. Turn Traffic Calming
7. Enhanced Crossings

**Major Safety Projects** is a set of multiple safety measures that may have been implemented, but since it does not specify what measures have been implemented, will not be used in this brief analysis. 

## Analysis

Specific datasets for these different measures can be downloaded at 
[data.cityofnewyork.us](https://data.cityofnewyork.us/browse?q=VZV&sortBy=relevance)

For this, GeoJSON files were downloaded for each of the above 7 measures, as well as a GeoJSON file for the borough boundaries [found here](https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm) and a GeoJSON for speed limits, [found here](https://data.cityofnewyork.us/Transportation/VZV_Speed-Limits/7n5j-865y).

Using QGIS, the above data were mapped. Let's focus on the areas of the fatal crashes. 

### Fatal Crash \#1

The first fatal crash occurred at the intersection of 31st Street and 35th Avenue and 1 motorist killed and 1 motorist injured. According to a [News Report](https://www.qgazette.com/articles/crash-kills-astoria-man-62/), the crash was between a vehicle driving eastbound on 35th Avenue and a vehicle driving southbound on 31st Street. The speed limit of both streets at the intersection is 25 MPH, but the road is not designed to cause drivers to stay at that speed limit. 

The news report states that the driver driving southbound on 31st street was speeding. According to Crash Mappers, a contributing factor was "Traffic Control Disregarded". Ideally, there would be road infrastructure that would prevent the driver from speeding, of which there are currently none on 31st Street between 35th Avenue and 34th Avenue. 

Solutions:
- **Road narrowing** - [narrowing roads causes individuals to drive slower](https://journals.sagepub.com/doi/abs/10.3141/1751-03?journalCode=trra). NYC Planning provides information regarding street widths (unfortunately including sidewalks), and shows that 31st Street between 35th Avenue and 34th Avenue to be 100 feet wide. Part of that is due to the sidwewalks, parking, and poles from the el, but the streets are also wide enough that they do not deter drivers from speeding. (Ideally in the future we can also see lane widths, but for now, if that data is publicly available, I do not know where) 
- **Speed Humps** - [Simply adding speed humps will prevent drivers from speeding as much.](https://scholarworks.sjsu.edu/cgi/viewcontent.cgi?article=1424&context=etd_projects)
- **Speed Table** - At the intersection, the addition of a speed table would serve a similar purpose, and help prevent motorists from speeding through intersections. 

These factors are not perfect, but would have lessened the likelihood that a fatal accident like this would occur. 

![Fatal Crash Map 2021 Jan - 2021 Aug]({{ site.baseurl }}/assets/images/crash1image1.png)

The brighter green dot in the above image represents the location of the crash. The yellow lines indicate streets with a speed limit of 25 MPH. Other colored lines and dots represent specific road calming techniques. Removing the lines to show streets / speed limits gives the following:

![Fatal Crash Map 2021 Jan - 2021 Aug]({{ site.baseurl }}/assets/images/crash1image2.png)

This allows us to see that there are no road calming techniques present where the crash occurred. 

We can also see this directly from [Vision Zero](https://vzv.nyc/), where the below screenshot was taken:

![Fatal Crash Map 2021 Jan - 2021 Aug]({{ site.baseurl }}/assets/images/crash1image3.png)

### Fatal Crash \#2

The second fatal crash occurred near the intersection of 35th Street and Ditmars Boulevard. The death was a pedestrian death, that of a delivery driver who was in the bicycle lane. New York City provides a map that shows all bicycle lanes by type [here](https://www1.nyc.gov/html/dot/downloads/pdf/nyc-bike-map-2021.pdf). The driver and pedestrian were on 35th Street, which has a conventional bicycle lane, but not a protected bicycle lane. The driver was able to drive in the bicycle lane, which she did, when she struck him. The driver was also speeding at double the speed limit, per [streetsblog](https://nyc.streetsblog.org/2021/05/04/is-road-rage-a-medical-episode-nypd-says-fatal-crash-in-queens-is-still-under-investigation/).

Solutions:
- **Protected bicycle lane** - A protected bicycle lane would have prevented the driver from entering the bicycle lane, where she struck the pedestrian.
- **Lane Narrowing** - The protected bicycle lane could have been built in such a way that the car lane would be narrowed. 
- **Speed Humps** - Adequate speed humps would have prevented the driver from being able to accelerate to 50 MPH.
- **Road Texture** - Changing road textures, as described by [Global Designing Cities](https://globaldesigningcities.org/publication/global-street-design-guide/designing-streets-people/designing-for-motorists/traffic-calming-strategies/), could potentially decrease driver speed and increase driver awareness.

### Fatal Crash \#3

The third fatal crash occurred when an e-bike rider crashed into a pedestrian at the intersection of 31st Street and 21st Avenue. First, e-bikes belong in bicycle lanes and mopeds belong in vehicle lanes as per [nyc.gov](https://www1.nyc.gov/html/dot/html/bicyclists/ebikes.shtml). This case involved an e-bike per [QNS](https://qns.com/2021/06/e-bike-rider-fatally-strikes-woman-in-astoria-nypd/). 

Solutions:
- **Adding a (protected) bicycle lane** - Adding a conventional bicycle lane would have helped prevent the cyclist - pedestrian collision, but creating a protected bicycle lane would be ideal
- **Adding a pedestrian island between the bicycle lane and street** - The protected bike lane could be coupled with an island where pedestrians cross the street. 
- **Traffic signal prioritization** - Traffic signal prioritization can be used to minimize conflict between cars, cyclists, and pedestrians, while also minimizing wait times. There are different methods for detecting different vehicles, such as using GPS tracking in busses and line-of-sight detection to count the number of vehicles, cyclists, and pedestrians and change signals accordingly. By optimizing traffic signals, we can decrease wait times and increase the likelihood that individuals, whether it be drivers, cyclists, or pedestrians, will follow the traffic signals. We can see the positive impact it has in places like ’s-Hertogenbosch, as described by [Bicycle Dutch](https://bicycledutch.wordpress.com/2016/06/21/traffic-lights-in-s-hertogenbosch-an-interview/) and in this video by [Not Just Bikes](https://www.youtube.com/watch?v=knbVWXzL4-4). 

## Summary

These changes - adding speed humps, speed tables, protected bicycle lanes, pedestrian islands, lane narrowing, and traffic signal prioritization - are all methods of traffic calming that would help reduce fatalities, as well as injuries. These consequences are preventable if a greater focus is placed on improving road safety through some of the many methods available and hopefully, as Vision Zero continues, more will be implemented to help make the city a safer place. The city should also focus on preventative measures, and not only react to deaths. Every injury should be inspected and measures should be implemented to prevent them from repeating.