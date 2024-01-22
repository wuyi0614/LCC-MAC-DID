# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
# packages
import numpy as np
import pandas as pd
from sklearn.impute import KNNImputer
from sklearn.experimental import enable_iterative_imputer
from sklearn.impute import IterativeImputer
from pathlib import Path
from missingpy import MissForest

# # for MissForest
# import sklearn.neighbors._base
# import sys
# sys.modules['sklearn.neighbors.base'] = sklearn.neighbors._base



# import data
datafile = Path('data') / 'raw_data.xlsx'
raw_data = pd.read_excel(datafile)

# calculate missing data rate
print((raw_data.isna().sum()/raw_data.count())*100)

# linear imputation
imputed_data_linear = raw_data.interpolate()

# # Iterative imputation
# num_data = raw_data.drop(columns = ['ctnm','cttyp','prvcnm'])
# imp = IterativeImputer(max_iter=10, random_state=0)
# imputed_data_IterativeImputer = imp.fit(num_data)
# IterativeImputer(random_state=0)

# KNN imputation
num_data = raw_data.drop(columns = ['ctnm','cttyp','prvcnm'])
imputer = KNNImputer(n_neighbors=2)
imputed_data_KNN = imputer.fit_transform(num_data)

# # Missing forest imputation
# imputer = MissForest()
# num_data = raw_data.drop(columns = ['ctnm','cttyp','prvcnm'])
# imputed_data_MissF = imputer.fit_transform(num_data)