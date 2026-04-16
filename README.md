# Fraud Detection & Risk Scoring System

## Project Overview

This project focuses on detecting fraudulent transactions using both **machine learning models** and a **rule-based fraud scoring system**.

The goal is not only to predict fraud, but also to:

* Understand **fraud patterns**
* Build an **interpretable scoring system**
* Balance **fraud detection (recall)** and **false positives (precision)**

---

## Dataset

The dataset contains transactional, behavioral, and customer-related features such as:

* Financial data (e.g., `credit_risk_score`, `intended_balcon_amount`)
* Customer attributes (e.g., `income`, `housing_status`)
* Behavioral signals (e.g., `foreign_request`, `device_os`)
* Identity indicators (e.g., `email_is_free`, `phone_home_valid`)

 The dataset is **synthetic and privacy-preserving**, but maintains realistic fraud patterns.

---

## Approach

### 1. Exploratory Data Analysis (EDA)

* Identified key differences between fraudulent and non-fraudulent transactions
* Selected features based on statistical significance and business relevance

---

### 2. Machine Learning Models

Three models were evaluated:

* Logistic Regression
* Gradient Boosting
* Random Forest

Models were compared using:

* ROC-AUC
* Precision-Recall tradeoff
* Interpretability

 **Random Forest was discarded** due to lower ROC-AUC performance.

---

### 3. Threshold Optimization

Instead of using a default threshold (0.5), thresholds were tuned using the **precision-recall curve**.

Goal:

* Achieve **high recall (~70%)**
* Maintain acceptable precision

---

### 4. Final Model Selection

Two models were compared:

| Model               | Recall | Precision | Threshold |
| ------------------- | ------ | --------- | --------- |
| Logistic Regression | ~0.70  | ~0.057    | 0.617     |
| Gradient Boosting   | ~0.70  | ~0.066    | 0.018     |

 **Gradient Boosting was selected** due to higher precision at the same recall level.

---

## Model Performance

* **Recall (~70%)** → The model detects most fraudulent transactions
* **Precision (~6–7%)** → Many flagged transactions are false positives

### Confusion Matrix Insights

* High number of **false positives**
* Relatively low number of **missed fraud cases**

 This trade-off is **expected and acceptable** in fraud detection.

---

## Business Interpretation

* The model successfully identifies the majority of fraud cases
* However, many legitimate transactions are flagged
* This is acceptable because:

  * Fraud is costly
  * Missing fraud is worse than investigating false alerts

 The system is suitable for:

* **Fraud alert prioritization**
* **Risk-based transaction review**

---

## Fraud Score (Machine Learning)

A continuous fraud score was created using:

```python
fraud_score_ml = model.predict_proba(X)[:, 1]
```

### Key characteristics:

* Values range between **0 and 1**
* Most scores are **low** due to class imbalance
* Fraudulent transactions tend to have **relatively higher scores**

 This enables:

* Risk ranking
* Flexible threshold tuning
* Business-driven decision making

---

## Model Limitations

* Dataset is synthetic (not real-world scale behavior)
* Rule-based scoring relies on manual weights
* Some features capture correlation, not causation
* Precision remains low due to extreme class imbalance

---

## Key Insights

* Fraud detection requires prioritizing **recall over precision**
* Threshold tuning is critical for real-world performance
* Model probabilities are more useful than binary predictions
* Combining ML with rule-based scoring improves interpretability

---

## Conclusion

This project demonstrates how to build a **practical fraud detection system** that balances performance and interpretability.

By combining:

* Machine learning models
* Threshold optimization
* Business-driven evaluation

we can effectively identify high-risk transactions and support fraud prevention strategies.

---

## Tech Stack

* Python
* Pandas / NumPy
* Scikit-learn
* Matplotlib / Seaborn
* Tableau (for dashboard visualization)

---

## Future Improvements

* Cost-sensitive learning (optimize business impact)
* Real-time fraud detection pipeline
* Advanced models (XGBoost, LightGBM)
* Feature engineering (behavioral sequences, time-based features)
* Model monitoring and drift detection
