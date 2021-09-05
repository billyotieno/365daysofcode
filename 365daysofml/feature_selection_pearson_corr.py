from sklearn.datasets import load_boston
import pandas as pd
from sklearn.model_selection import train_test_split


# Load boston data, seperate features and target variable
data = load_boston()
df = pd.DataFrame(data.data, columns=data.feature_names)
df['MEDV'] = data.target


X_train, X_test, y_train, y_test = train_test_split(
    df.drop('MEDV', axis=1),
    df['MEDV'],
    test_size=0.28,
    random_state=0
)

print(X_train.shape, X_test.shape)


def correlation(dataset, threshold):
    """Function takes a dataset (DataFrame) and a
    correlation threshold as input and returns columns
    that meet correlation > threshold

    Args:
        dataset ([DataFrame]): [description]
        threshold ([Int/Float]): [description]

    Returns:
        [set]: [A set of correlated features]
    """
    col_corr = set()
    corr_matrix = dataset.corr()
    for i in range(len(corr_matrix.columns)):
        for j in range(i):
            if abs(corr_matrix.iloc[i, j]) > threshold:
                colname = corr_matrix.columns[i]
                col_corr.add(colname)
    return col_corr


corr_features = correlation(X_train, 0.65)
len(set(corr_features))

# A set of all features that need to be dropped
print(corr_features) 

# Drop the feature that don't meet threshold both from
# (X_train and X_test)
X_train.drop(corr_features, axis=1)
X_test.drop(corr_features, axis=1)



Daniel 
 - Schools offering Data Analytics
 - Business Intelligence and Data Analytics (5 days) - 50,000 ksh
 - 3 Months - [60,000 ksh] - Data Analytics & Business Intelligence (Visualizations)