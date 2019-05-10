# Escriba su código aquí
cut -d";" -f1-4 data.csv  > out.1                                              # Extrae sólo las 4 primeras columnas del archivo data.csv
sed 's|[a-z]|\U&|g' out.1  > out.2                                             # Transforma en mayúsculas todas las letras que encuentre en minúsculas
sed 's|;\(N\)|;\\N|g' out.2 > out.3                                            # Reemplaza los campos que traes sólo "N" por "\N"
sed 's|\(;;\)|;\\N;|'g  out.3 > out.4                                          # Reemplaza campos vacíos entre filas por "\N"
sed 's|\(;$\)|;\\N|g' out.4 > out.5                                            # Reemplaza campos vacíos del final de las líneas por "\N"
sed 's|\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)|\3/\2/\1|' out.5 > out.6   # Cambia el orden de la fecha de DD/MM/YY a YY/MM/DD
sed 's|\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)|20\1/\2/\3|' out.6 > out.7 # Adiciona el "20" al año
sed 's|/|-|g' out.7 > out.8                                                    # Reemplaza el símbolo "/" por "-"
sed 's|,|.|g' out.8 > out.9                                                    # Reemplaza el separador de decimales de "," por "."
sed 's|;|,|g' out.9 > out.10                                                   # Reemplaza el separador ";" por ","
sed 's|,\([0-9]\)\([0-9]\)\([0-9]\)$|,\1\2\3.0|'g  out.10 > out.11             # Adiciona el decimal a los números que no lo tienen
sed '/N/d' out.11 > solución.csv                                              # Elimina los registros que no tienen campos nulos 
rm out.*                                                                       # Borra los datos temporales que se crearon en el proceso