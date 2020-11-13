
import pandas as pd

inat = pd.read_csv('C:/Users/jesse/iCloudDrive/SDSU Courses/594 Big Data/iNat_data/gbif-observations-dwca/observations.csv')


print(len(inat))
print(list(inat.columns))
print(inat.head(10))
