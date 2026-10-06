# 🌱 Cloud-Based Energy Intelligence & Regional Sustainability Analytics

## 📌 Project Overview

This project analyzes **Google Cloud carbon-free energy (CFE) and grid carbon intensity data** to evaluate regional sustainability performance and identify regions with cleaner energy profiles.

The project combines **Google BigQuery, SQL, Python, Pandas, NumPy, and Looker Studio** to transform cloud-energy data into meaningful regional insights and an interactive sustainability dashboard.

The goal is to demonstrate how **cloud analytics and data visualization can support sustainability-focused infrastructure decisions**.

---

## 🎯 Business Problem

As cloud infrastructure continues to expand, organizations increasingly need to consider the environmental impact of the regions in which their workloads operate.

Regional sustainability can be influenced by factors such as:

* Carbon-free energy availability
* Grid carbon intensity
* Regional differences in energy sources
* Changes in clean-energy availability over time

This project explores the following questions:

1. Which regions have the highest sustainability scores?
2. How does Carbon-Free Energy (CFE) vary across regions?
3. Which regions have lower grid carbon intensity?
4. What relationship exists between CFE and grid carbon intensity?
5. Which regions demonstrate stronger sustainability performance?

---

## 🏗️ Project Architecture

```text
Google Cloud Public Dataset
            │
            ▼
        BigQuery
            │
            ▼
      energy_clean
            │
            ▼
regional_sustaninability_analysis
            │
            ▼
regional_sstainability_score
            │
       ┌────┴────┐
       ▼         ▼
    Python    Looker Studio
    Analysis   Dashboard
       │         │
       └────┬────┘
            ▼
   Sustainability Insights
```

---

## 🛠️ Technology Stack

| Technology                | Purpose                                              |
| ------------------------- | ---------------------------------------------------- |
| **Google Cloud BigQuery** | Cloud-based data storage and analysis                |
| **SQL**                   | Data cleaning, transformation, and regional analysis |
| **Python**                | Statistical and exploratory analysis                 |
| **Pandas / NumPy**        | Data manipulation and numerical analysis             |
| **Looker Studio**         | Interactive dashboard and visualization              |
| **Jupyter Notebook**      | Python-based analysis                                |
| **GitHub**                | Project documentation and version control            |

---

## 📊 Dataset

The project uses the **Google Cloud Carbon-Free Energy dataset** available through BigQuery's public datasets.

### Important Fields

| Field                   | Description                              |
| ----------------------- | ---------------------------------------- |
| `year`                  | Year of observation                      |
| `cfe_region`            | Carbon-free energy region                |
| `zone_id`               | Geographic/energy zone identifier        |
| `cloud_region`          | Cloud infrastructure region              |
| `location`              | Geographic location                      |
| `google_cfe`            | Carbon-free energy percentage            |
| `grid_carbon_intensity` | Carbon intensity of the electricity grid |

The dataset contains regional observations covering **2019–2024**.

---

# ☁️ BigQuery Data Processing

The project uses three analytical BigQuery tables.

### 1. `energy_clean`

A cleaned version of the source dataset used for downstream analysis.

```text
Google Cloud Public Dataset
            ↓
       energy_clean
```

The cleaning process also creates data-status fields for CFE and grid-carbon values.

---

### 2. `regional_sustaninability_analysis`

A regional analytical table derived from the cleaned data.

```text
energy_clean
      ↓
regional_sustaninability_analysis
```

This analysis focuses on regional CFE and grid carbon-intensity characteristics.

---

### 3. `regional_sstainability_score`

A regional scoring table used for sustainability ranking and dashboard visualization.

```text
regional_sustaninability_analysis
              ↓
regional_sstainability_score
```

> The table names above match the names used in the BigQuery project.

---

# 🐍 Python Analysis

Python was used for additional analysis and statistical exploration after the BigQuery transformations.

Key analysis included:

* Regional sustainability comparison
* Yearly CFE analysis
* Regional ranking analysis
* CFE vs. grid carbon intensity analysis
* Correlation analysis
* Data preparation for visualization

### Correlation Analysis

The calculated correlation between CFE and grid carbon intensity was approximately:

```text
-0.78
```

This indicates a **strong negative relationship** in the analyzed data: regions with higher carbon-free energy availability generally tend to have lower grid carbon intensity.

---

# 📈 Key Findings

### 1. Regional sustainability varies significantly

The sustainability scores differ across regions, highlighting that cloud-region selection can have an environmental dimension in addition to traditional infrastructure considerations.

### 2. Average CFE increased toward 2024

The calculated average CFE values were:

| Year | Average CFE |
| ---- | ----------: |
| 2019 |      50.41% |
| 2020 |      52.19% |
| 2021 |      47.74% |
| 2022 |      53.81% |
| 2023 |      54.35% |
| 2024 |      56.92% |

Although there is year-to-year variation, the data shows an overall increase in average CFE toward 2024.

### 3. CFE and grid carbon intensity show a strong negative relationship

The correlation of approximately **-0.78** indicates that higher CFE is strongly associated with lower grid carbon intensity in the analyzed dataset.

### 4. High-performing regions

The 2024 sustainability analysis identified regions including:

* Sweden
* Norway
* Switzerland
* Quebec
* France
* Finland

among the highest-scoring regions.

---

# 📊 Looker Studio Dashboard

The final dashboard provides an interactive view of regional sustainability performance.

### Dashboard Components

#### KPI Cards

* Average Sustainability Score
* Average CFE %
* Average Grid Carbon Intensity
* Regions Analyzed

#### Visualizations

* **Top 10 Sustainable Regions**
* **CFE vs Grid Carbon Intensity by Region**
* **Regional Sustainability Performance**
* **CFE vs Grid Carbon Intensity correlation analysis**

### Dashboard Preview

![Cloud-Based Energy Intelligence Dashboard](Cloud%20Project/cloud%20dashboard.png)

The dashboard enables users to compare regional sustainability performance and identify patterns between carbon-free energy availability and grid carbon intensity.

---

# 💡 Business Insights

The analysis can support organizations when considering the sustainability dimension of cloud-region selection.

Potential applications include:

* Comparing cloud regions using environmental indicators
* Identifying regions with stronger carbon-free energy availability
* Monitoring changes in regional clean-energy performance
* Supporting sustainability-focused infrastructure decisions
* Providing data for internal sustainability reporting

Sustainability should be considered alongside other cloud-region selection factors such as **cost, latency, availability, compliance, security, and workload requirements**.

---

# 🚀 Project Workflow

```text
1. Access Google Cloud public energy data
              ↓
2. Explore and validate the dataset
              ↓
3. Clean and prepare data in BigQuery
              ↓
4. Perform SQL-based regional analysis
              ↓
5. Calculate regional sustainability scores
              ↓
6. Analyze results using Python
              ↓
7. Perform correlation analysis
              ↓
8. Build Looker Studio dashboard
              ↓
9. Generate business insights
```

---


# 🎓 Skills Demonstrated

* Cloud Analytics
* Google Cloud Platform
* BigQuery
* SQL
* Data Cleaning
* Data Transformation
* Exploratory Data Analysis
* Python
* Pandas
* NumPy
* Statistical Analysis
* Correlation Analysis
* Data Visualization
* Looker Studio
* Dashboard Development
* Data Storytelling
* Sustainability Analytics

---


