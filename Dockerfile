FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install pandas numpy seaborn sklearn jupyter-offlinenotebook

RUN mkdir clean_data
RUN mkdir raw_data
COPY --chown=1000:100 data/country_vaccinations.csv data
COPY --chown=1000:100 ["./recap.ipynb", "."]

# ./work is found inside official jupyter images, we avoid unnecessary nesting
RUN rm -rf ./work
# moving this line to the bottom to avoid MyBinder build crashing
