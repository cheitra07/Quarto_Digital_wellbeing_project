# DEPLOY NOW — Quarto Version 1

This is the same project content. Only deployment compatibility has been improved.

## A. Update Quarto on Windows

Install the current Quarto release from the official Quarto website:
https://quarto.org/docs/get-started/

Then restart RStudio.

Check:

```bash
quarto --version
quarto check
```

## B. Install the R packages used by the project

In the RStudio Console:

```r
install.packages(c("readxl", "dplyr", "ggplot2", "scales", "rsconnect"))
```

## C. Render locally

Open the project folder in RStudio Terminal:

```bash
quarto render
```

You must see:

```text
Output created: _site/index.html
```

## D. Create the Posit Connect Cloud manifest

In the RStudio Console, while the working directory is the project root:

```r
rsconnect::writeManifest(contentCategory = "site")
```

Check that the file exists:

```bash
ls -la manifest.json
```

## E. GitHub

```bash
git add .
git commit -m "Deployable Quarto version 1"
git push origin main
```

## F. Posit Connect Cloud

Publish the GitHub repository as a Quarto website. Keep `_quarto.yml` in the repository root and keep `manifest.json` in the same root.

## G. Netlify — easiest backup

After `quarto render`, the `_site` folder is a normal static website. You can deploy the `_site` folder to Netlify without running R on Netlify.

## Important

Do not upload `_site` as the source for Posit Connect Cloud if you want Posit to render the Quarto/R project. For Posit, use the source project plus `manifest.json`.

Do not use a Shiny deployment method for this Quarto website. It is a Quarto website, not a Shiny app.
