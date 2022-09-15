import pandas as pd
from sqlalchemy import create_engine
from fastapi import FastAPI



df = pd.read_csv('circuits.csv')
#df.head(5)
freq = df['name'].value_counts()
#print(freq)
#df.shape
#df.info()

df2 = pd.read_csv('constructors.csv')
#df2.shape
#df2.head(5)
#df2 = df2.drop(['constructorRef'], axis=1)
#df2.to_csv('constructores.csv')
#df2.head(3)
#df2.info()

df3 = pd.read_csv('drivers.csv')
#df3.shape
#df3.head(20)
#df3=df3.drop(['driverRef'], axis=1)
#df3.head(5)
#df3.to_csv('drivers2.csv')
freq = df3['code'].value_counts()
#print(freq)
#df3=df3.drop(['number'], axis=1)
#df3.info()


df4 = pd.read_csv('pit_stops.csv')
#df4.shape
#df4.head(5)
#df4=df4.drop(['duration'], axis=1)
#df4.head(5)
freq = df4['driverId'].value_counts()
#print(freq)
#df4.to_csv('pit_stops2.csv')
#df4.info()
#df4.describe()


df5 = pd.read_csv('races.csv')
#df5.shape
#df5.head(2)
#df5.info()
freq5 = df5['year'].value_counts()
anmc=freq5.reset_index()
#print(freq5)
anmc=freq5.reset_index()
anniomascarreras=2021
print(anniomascarreras)
freq55 = df5['circuitId'].value_counts()
#print(freq55)
circuito_mas_carreras=freq55.reset_index()
cmc=circuito_mas_carreras.iloc[0,0]
#cmc
circmascarreras=df.iloc[cmc-1,2]
print(circmascarreras)



df6 = pd.read_csv('results.csv')
#df6.head(5)
pos1 = df6['positionOrder'] == 1
#pos1

df7 = df6[pos1]
#df7
#df7.shape
#df6.shape
freq = df6['driverId'].value_counts()
#print(freq)
freq7 = df7['driverId'].value_counts()
#print(freq7)
#type(freq7)
data_triunfos=freq7.reset_index()
mastriunfos=data_triunfos.iloc[0,0]
#mastriunfos

nompilmasganador=df3.iloc[mastriunfos-1, 4]
#nompilmasganador

apepilmasganador=df3.iloc[mastriunfos-1, 5]
#apepilmasganador

#df6.info()

agrupado = df6.groupby(['driverId']).agg(
                                  {'points': 'sum',
                              }).reset_index()

agrupado2 = agrupado.sort_values(by = 'points', ascending=False)
#agrupado2.head(10)

pilmaspuntos=agrupado2.iloc[7,0]
#pilmaspuntos

nompilmaspuntos=df3.iloc[pilmaspuntos-1, 4]
#nompilmaspuntos

apepilmaspuntos=df3.iloc[pilmaspuntos-1, 5]
#apepilmaspuntos


app=FastAPI()

@app.get("/pregunta1")
def read_root():

    return {"El año con mas carreras es", anniomascarreras }

@app.get("/pregunta2")
def read_root():

    return {"El piloto con mas primeros puestos es",nompilmasganador,apepilmasganador}

@app.get("/pregunta3")
def read_root():

    return {circmascarreras,"El circuito mas corrido es"}

@app.get("/pregunta4")
def read_root():

    return {"El piloto con mayor cantidad de puntos es",nompilmaspuntos,apepilmaspuntos}
