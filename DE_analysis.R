---
title: "Untitled"
author: "Adam Gruenbaum"
date: "April 16, 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

First we read the results from bcbio into R. The data.frame package provides a variety of tools for working with data frames in R. The `fread()` function is a significantly more efficient and flexible tool for reading in tables than base R, so we'll use it. The annotated_combined.count will be in samples/final/ and then within a folder with the date of the run. Put the name of this folder in folder_name.

```{r read data}
library(data.frame)
folder_name = "2019-04-11_samples"
count_path = paste0("samples/final/", folder_name, "/annotated_combined.count")
data <- fread(count_path)
