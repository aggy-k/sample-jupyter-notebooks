FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install pandas numpy datetime seaborn sklearn jupyter-offlinenotebook

RUN mkdir data
# COPY --chown=1000:100 data/country_vaccinations.csv data
COPY --chown=1000:100 data/ecommerce.csv data
# COPY --chown=1000:100 ["./excel.ipynb", "."]
COPY --chown=1000:100 ["./workshop.ipynb", "."]
COPY --chown=1000:100 ["./workshop_today.ipynb", "."]
# COPY --chown=1000:100 ["./workshop_test_run.ipynb", "."]

# ./work is found inside official jupyter images, we avoid unnecessary nesting
RUN rm -rf ./work
# moving this line to the bottom to avoid MyBinder build crashing
