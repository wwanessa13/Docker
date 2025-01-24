FROM rstudio/plumber

COPY exemplo_api.R /exemplo_api.R
COPY modelo_rf.rds /modelo_rf.rds

EXPOSE 8000

CMD ["Rscript", "/exemplo_api.R"]