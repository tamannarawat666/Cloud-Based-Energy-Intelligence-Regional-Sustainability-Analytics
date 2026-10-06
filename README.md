# 🌱 Cloud-Based Energy Intelligence & Regional Sustainability Analytics

## 📌 Project Overview

This project analyzes **Google Cloud's carbon-free energy (CFE) and grid carbon intensity data** to evaluate regional sustainability performance and identify regions with cleaner energy profiles.

The project uses **Google BigQuery** for cloud-based data preparation and SQL analysis, **Python** for statistical analysis and correlation studies, and **Looker Studio** to build an interactive sustainability analytics dashboard.

The goal is to transform raw cloud-energy data into **clear, data-driven insights that can support sustainability and cloud infrastructure decisions**.

---

## 🎯 Business Problem

As cloud infrastructure continues to grow, organizations need to understand the environmental impact of the regions where their workloads operate.

Simply looking at energy consumption is not enough. The sustainability of a region can also depend on:

* Availability of carbon-free energy
* Grid carbon intensity
* Regional differences in energy sources
* Changes in clean-energy availability over time

This project addresses the following questions:

1. Which regions have the highest sustainability scores?
2. How does Carbon-Free Energy (CFE) vary across regions?
3. Which regions have lower grid carbon intensity?
4. Is there a relationship between CFE and grid carbon intensity?
5. Which regions appear more suitable from a sustainability perspective?

---

## 🏗️ Project Architecture

```text
Google Cloud / BigQuery Data
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
            ├──────────────► Python Analysis
            │
            ▼
       Looker Studio
            │
            ▼
Regional Sustainability
       Dashboard
```

---

## 🛠️ Technology Stack

| Technology                | Purpose                                             |
| ------------------------- | --------------------------------------------------- |
| **Google Cloud BigQuery** | Cloud-based data storage and SQL analysis           |
| **SQL**                   | Data cleaning, transformation and regional analysis |
| **Python**                | Statistical analysis and correlation analysis       |
| **Pandas / NumPy**        | Data manipulation and numerical analysis            |
| **Looker Studio**         | Interactive dashboard and data visualization        |
| **Jupyter Notebook**      | Python-based analysis                               |
| **GitHub**                | Version control and project documentation           |

---

## 📊 Dataset

The project uses Google Cloud carbon-free energy and grid carbon-intensity data.

### Important fields

| Field                   | Description                              |
| ----------------------- | ---------------------------------------- |
| `year`                  | Year of observation                      |
| `cfe_region`            | Carbon-free energy region                |
| `zone_id`               | Geographic/energy zone identifier        |
| `cloud_region`          | Cloud infrastructure region              |
| `location`              | Geographic location                      |
| `google_cfe`            | Carbon-free energy percentage            |
| `grid_carbon_intensity` | Carbon intensity of the electricity grid |

The dataset contains regional observations across **2019–2024**.

---

# ☁️ BigQuery Data Processing

The project uses three BigQuery tables:

### 1. `energy_clean`

The cleaned base dataset used for downstream analysis.

```text
Raw Data
   ↓
energy_clean
```

---

### 2. `regional_sustaninability_analysis`

This table contains the regional-level analysis derived from the cleaned energy data.

```text
energy_clean
     ↓
regional_sustaninability_analysis
```

The analysis focuses on regional CFE and grid carbon-intensity characteristics.

---

### 3. `regional_sstainability_score`

This table contains the calculated regional sustainability scores used for ranking and dashboard visualization.

```text
regional_sustaninability_analysis
              ↓
regional_sstainability_score
```

> Note: The table names above intentionally match the names used in the BigQuery project.

---

# 🐍 Python Analysis

Python was used to perform additional analysis after the BigQuery transformations.

Key analysis included:

* Regional sustainability comparison
* Yearly CFE analysis
* Regional ranking analysis
* CFE vs. grid carbon intensity analysis
* Correlation analysis
* Data preparation for visualization

### Example finding

The correlation between CFE and grid carbon intensity was approximately:

```text
-0.78
```

This indicates a **strong negative relationship** in the analyzed data: regions with higher carbon-free energy availability generally tend to have lower grid carbon intensity.

---

# 📈 Key Findings

### 1. Sustainability varies significantly by region

The sustainability score differs considerably across regions, showing that cloud infrastructure location can have an important environmental dimension.

### 2. CFE improved over time

The average CFE percentage across the available data was approximately:

| Year | Average CFE |
| ---- | ----------: |
| 2019 |      50.41% |
| 2020 |      52.19% |
| 2021 |      47.74% |
| 2022 |      53.81% |
| 2023 |      54.35% |
| 2024 |      56.92% |

Overall, the data shows an upward trend in average CFE toward 2024, despite year-to-year variation.

### 3. Strong relationship between CFE and grid carbon intensity

The calculated correlation was approximately **-0.78**, indicating that higher CFE is strongly associated with lower grid carbon intensity in the analyzed data.

### 4. Top-performing regions

The 2024 sustainability analysis identified regions such as:

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

The dashboard is designed to make regional sustainability comparisons easier for business and infrastructure decision-making.

### Dashboard Preview

![Looker Studio Dashboard](dashboard/looker_dashboard.png)

### 🔗 Live Dashboard

Add your published Looker Studio dashboard link here:

**[View Interactive Looker Studio Dashboard](YOUR_LOOKER_STUDIO_LINK)**

---

# 💡 Business Insights

The analysis can support organizations when considering the sustainability dimension of cloud-region selection.

Potential applications include:

* Comparing cloud regions based on environmental indicators
* Identifying regions with stronger carbon-free energy availability
* Monitoring changes in regional clean-energy performance
* Supporting sustainability-focused infrastructure decisions
* Providing data for internal carbon and sustainability reporting

The analysis should be treated as **one decision input**, rather than the sole factor for selecting a cloud region, since cost, latency, availability, compliance, security and workload requirements also matter.

---

# 📁 Repository Structure

```text
cloud-energy-intelligence/
│
├── README.md
│
├── bigquery/
│   ├── 01_energy_clean.sql
│   ├── 02_regional_sustainability_analysis.sql
│   └── 03_regional_sustainability_score.sql
│
├── python/
│   └── energy_analysis.ipynb
│
├── dashboard/
│   └── looker_dashboard.png
│
└── docs/
    └── project_architecture.png
```

---

# 🚀 Project Workflow

```text
1. Obtain cloud energy data
          ↓
2. Clean and prepare data in BigQuery
          ↓
3. Perform SQL-based regional analysis
          ↓
4. Calculate sustainability scores
          ↓
5. Export/use analytical data for Python
          ↓
6. Perform statistical and correlation analysis
          ↓
7. Build Looker Studio dashboard
          ↓
8. Generate sustainability insights
```

---

# 🎓 Skills Demonstrated

This project demonstrates practical skills in:

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

# 👩‍💻 Author

**Tamanna Rawat**

Data Analyst | Cloud Analytics | SQL | Python | Power BI | Looker Studio

GitHub: `tamannarawat666`
