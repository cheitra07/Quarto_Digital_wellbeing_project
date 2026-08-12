# Quarto Digital Well-being Project

## What this project contains

A complete Quarto website based on the 38-student, 25-question survey:

- Home
- Survey Results
- Charts & Reports
- Healthy Habits
- Parent Awareness
- Child Awareness
- Evidence-based Recommendations

The project reads `data/survey_data.xlsx` and creates seven charts in R.

## How to run in RStudio

1. Install **R** and **RStudio**.
2. Install Quarto if it is not already available in RStudio.
3. Open this project folder in RStudio.
4. Open `_quarto.yml`.
5. Install the required R packages once:

```r
install.packages(c("readxl", "dplyr", "ggplot2", "scales"))
```

6. Open `index.qmd`.
7. Click **Render** / **Render Website**.

The generated website will be placed in `_site/`.

## Important

The Excel file is the real survey data used for this project. Keep a backup of the original.

Q13 contains one response recorded as `S` rather than A–D. The chart excludes that invalid entry rather than guessing its meaning.

## Replacing the sample illustrations

The website currently includes simple local SVG illustrations so it runs immediately.

You can later replace them with your own suitable images while keeping the same filenames, for example:

- `images/outdoor_play.svg`
- `images/healthy_sleep.svg`
- `images/focused_study.svg`
- `images/family_time.svg`
- `images/hobbies.svg`
- `images/parent_guidance.svg`
- `images/child_balance.svg`
- `images/phone_free_time.svg`

For Google image searches, use terms such as:

- school children outdoor play healthy habits
- child healthy sleep bedtime
- child studying without phone
- family talking children no phones
- children learning music dance sports
- parents guiding children's screen use

Check image licensing before publishing a public website.
