# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev\
    libgdal-dev\
    gdal-bin\
    proj-bin\
    libproj-dev\
    libudunits2-dev\
    grass\
    nano

#install GRASS GIS
#RUN apt-get install grass grass-doc    

# install R packages required 
# (change it dependeing on the packages you need)
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
#RUN R -e "devtools::install_github('andrewsali/shinycssloaders')"
#RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('magrittr', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('glue', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('raster', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('sf', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgdal', repos='http://R-Forge.R-project.org/')"
RUN R -e "install.packages('sp', repos='http://R-Forge.R-project.org/')"
RUN R -e "install.packages('mapview', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('leaflet', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RColorBrewer', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('leaflet.extras', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgrass7', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgeos', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyjs', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('htmlwidgets', repos='http://cran.rstudio.com/')"

# copy the app to the image
ADD grassland /srv/shiny-server/grassland
#COPY project.Rproj /srv/shiny-server/
#COPY app.R /srv/shiny-server/
#COPY R /srv/shiny-server/R
#COPY data /srv/shiny-server/data

# select port
EXPOSE 3838

# allow permission
#RUN sudo chown -R shiny:shiny /srv/shiny-server

# run app
#CMD ["/usr/bin/shiny-server.sh"]

