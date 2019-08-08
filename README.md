# R markdown template for scientific papers

This template and example include:

- Common order for scientific papers (i.e., main text, references, tables and figures).
- Page breaks for both word and pdf documents
- Table and figure captions for main text and supporting information.


`r page_break()` will add page break for word and pdf documents. `r page_break("Figures")` will add page break and a new page starts with section "Figures".

References:

- https://gist.github.com/benmarwick/f3e0cafe668f3d6ff6e5

- https://daijiang.name/en/2017/04/05/writing-academic-papers-with-rmarkdown/

- http://svmiller.com/blog/2016/02/svm-r-markdown-manuscript/

- https://github.com/svmiller/svm-r-markdown-templates

## Rendering

```{r}
# rendering to PDF
render("main_text.rmd", "bookdown::pdf_document2")

# rendering to docx
render("main_text.rmd", "bookdown::word_document2")

```

## Example for main text

```{r caching, include=FALSE}
library(methods)
library(knitr)
library(kableExtra)
library(png)
library(grid)
library(pander)
source("rmd_func.r")
```


**Title: Title of your manuscript**

$$ $$

First Author^1,2^ Second Author^2^, and Third Author^3^

$$ $$

^1^ First Affiliation

^2^ Second Affiliation

^3^ Third Affiliation


`r page_break("Abstract")`

Your abstract.

# Introduction

Your introduction [@Wright2004a]. Some more text [@Kraft2008]. More text [@Hubbell2001].

# Material and Methods

Your Material and Methods. We fitted XXXX:

\begin{equation}
N_{ij} \sim NB(\mu_{ij}, \phi)
(\#eq:NB)
\end{equation}

where $\mu_{ij}$ is xxxxxx, xxxxxxxx,

\begin{equation}
\mu_{ij} \times v_i = exp(\Sigma \beta_{jk} z_{ik})
(\#eq:mu)
\end{equation}

where $\beta_{jk}$ is xxxxxx. Prior for $\phi$ in Eq. \@ref(eq:NB) was specified as xxxxx.

We found XXX (Fig. \@ref(fig:scatplt) and Table \@ref(tab:tblm)). We also found xxx (Fig. \@ref(fig:boxplt)) yay!

# Discussion

Some texts.

# References

<div id="refs"></div>


`r page_break()`


Table: (\#tab:tblm). Summary of the regression model.

```{r tblm, echo = FALSE}
fit <- lm(mpg ~ wt * cyl, data = mtcars)
tb1 <- pander(fit, caption = "")
tb1
```

`r page_break()`

```{r tblm2, echo = FALSE}
tb2 <- head(mtcars)
kable(tb2, caption = "Some datasets.")

```

`r page_break("Figures")`

```{r scatplt, echo = F, dpi = 300, fig.width = 5, fig.height = 5, fig.cap = "Scatter plot of XXX. Each point indicates XXXX."}

img <- readPNG("scat.png", native = TRUE, info = TRUE)
grid.raster(img, interpolate=F)

```

`r page_break()`

```{r boxplt, echo = F, dpi = 300, fig.width = 5, fig.height = 5, fig.cap = "Boxplot of XXXX."}

img <- readPNG("boxp.png", native = TRUE, info = TRUE)
grid.raster(img, interpolate=F)

```

## Example for Supporting information

# Supporting Information

```{r stab, anchor = "table", tab.cap = "Dataset", echo = FALSE}
knitr::kable(mtcars)
```

`r page_break()`

```{r bar, anchor = "figure", echo = F, dpi = 300, fig.width = 5, fig.height = 5, fig.cap = "Bar plot of XXX."}
grid.raster(img, interpolate=F)

```
