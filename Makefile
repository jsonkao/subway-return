turnstile_data.csv: cb_2018_36_tract_500k download Makefile
	mapshaper $(word 2,$^)/body.csv \
		-points x=gtfs_longitude y=gtfs_latitude \
		-join $</$<.shp \
		-filter 'GEOID !== null' \
		-filter-fields date,entries,exits,GEOID \
		-o format=csv $@

download:
	curl -L https://qri.cloud/nyc-transit-data/turnstile_daily_counts_2020/$@ -o $@.zip
	unzip -d $@ $@.zip

cb_2018_36_tract_500k:
	curl -LO https://www2.census.gov/geo/tiger/GENZ2018/shp/$@.zip
	unzip -d $@ $@.zip