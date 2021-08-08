# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.
library(here)

# Knit the HTML version
rmarkdown::render(here("/resume.Rmd"),
                  params = list(pdf_mode = FALSE),
                  output_file = "resume.html")

# Knit the PDF version to temporary html location
# tmp_html_cv_loc <- fs::file_temp(ext = ".html")
# rmarkdown::render("cv.rmd",
#                   params = list(pdf_mode = TRUE),
#                   output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
# if trouble getting the pdf to print the right html - then write an absolute path for cv.html
pagedown::chrome_print(input = "/Users/danielturner/Documents/GitHub/dbturner.github.io/cv/resume.html",
                       output = "/Users/danielturner/Documents/GitHub/dbturner.github.io/cv/resume.pdf")


# Knit the HTML version of abridged resume
rmarkdown::render(here("/cv/cv.Rmd"),
                  params = list(pdf_mode = FALSE),
                  output_file = "cv.html")

pagedown::chrome_print(input = "/Users/danielturner/Documents/GitHub/dbturner.github.io/cv/cv.html",
                       output = "/Users/danielturner/Documents/GitHub/dbturner.github.io/cv/cv.pdf")
