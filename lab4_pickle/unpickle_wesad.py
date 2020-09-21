import pickle
import pandas as pd

subjects = ["S10","S11"] #,"S13","S14","S15","S16","S17","S2","S3","S4","S5","S6","S7","S8","S9"]
for sub in subjects:
    b = open("/hpc/group/sta440-f20/WESAD/WESAD/" + sub + "/" + sub +  ".pkl", "rb")
    sdat = pickle.load(b)
    sdat_temp = sdat['signal']['chest']['Temp'].tolist()
    sdat_temp = [item for sublist in sdat_temp for item in sublist] ## flatten list of lists
    sdat_wrist_temp = sdat['signal']['wrist']['TEMP'].tolist()
    sdat_wrist_temp = [item for sublist in sdat_wrist_temp for item in sublist]
    sdat_label = sdat['label'].tolist()
    sdf = pd.DataFrame()
    sdf['Ctemp'] = sdat_temp
    sdf['Condition'] = sdat_label
    sdf = sdf[sdf.index % 175 == 0]
    sdf['Wtemp'] = sdat_wrist_temp # sampled at lower frequency (4Hz vs 700Hz)
    sdf.to_csv("/work/dab118/WESAD/" + sub  + ".csv")
    
