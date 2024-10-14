USE Proyecto_G5_202413;
#----------------------------------------------------------------- CON TABLAS
CREATE TABLE G5_TableroAeropuertos ( 
  Vuelos_totales  INT,
  Sillas INT,
  Carga_Ofrecida DOUBLE,
  Pasajeros INT,
  Carga_abordo DOUBLE,
  Rango_longitud_pista LONGTEXT,
  Rango_ancho_pista LONGTEXT,
  Rango_numero_vuelos_origen LONGTEXT,
  Nombre_clase LONGTEXT,
  Nombre_tipo LONGTEXT,
  Nombre_departamento_origen LONGTEXT, 
  Nombre_departamento_destino LONGTEXT, 
  Nombre_Municipio_origen LONGTEXT, 
  Nombre_Municipio_destino LONGTEXT, 
  Sigla_aeropuerto_origen LONGTEXT, 
  Sigla_aeropuerto_destino LONGTEXT,
  Fecha DATETIME);
  
  
INSERT INTO G5_TableroAeropuertos
(SELECT  
    hechovuelo.vuelosTotales as Vuelos_totales,
	hechovuelo.sillas as Sillas,
	hechovuelo.cargaOfrecida as Carga_Ofrecida,
	hechovuelo.pasajeros as Pasajeros,
	hechovuelo.CargaAbordo as Carga_abordo,
    COALESCE(minidimaeropuerto.rangoLongitudPista, 'missing') as Rango_longitud_pista,
    COALESCE(minidimaeropuerto.rangoAnchoPista, 'missing') as Rango_ancho_pista,
	COALESCE(minidimaeropuerto.rangoNumeroVuelosOrigen, 'missing') as Rango_numero_vuelos_origen,
	COALESCE(minidimaeropuerto.clase, 'missing') as Nombre_clase,
    COALESCE(minidimaeropuerto.tipo, 'missing') as Nombre_tipo,
	aeropuertoorigen.nombreDepartamento as Nombre_departamento_origen,
    aeropuertodestino.nombreDepartamento as Nombre_departamento_destino,
	aeropuertoorigen.nombreMunicipio as Nombre_Municipio_origen,
	aeropuertodestino.nombreMunicipio as Nombre_Municipio_destino,
    aeropuertoorigen.sigla as Sigla_aeropuerto_origen,
	aeropuertodestino.sigla as Sigla_aeropuerto_destino,
	fecha.descripcion as Fecha
  FROM  
    proyecto_sol_test.HechoVuelo AS hechovuelo
  LEFT JOIN
   proyecto_sol_test.Aeropuerto AS aeropuertoorigen ON aeropuertoorigen.idAeropuerto_DWH = hechovuelo.idAeropuertoOrigen_DWH
  LEFT JOIN
   proyecto_sol_test.Aeropuerto AS aeropuertodestino ON aeropuertodestino.idAeropuerto_DWH = hechovuelo.idAeropuertoDestino_DWH  
  LEFT JOIN   
   proyecto_sol_test.MiniDimensionAeropuerto AS minidimaeropuerto ON minidimaeropuerto.idMini_DWH = hechovuelo.miniMomentoDelHechoOrigen_DWH
  LEFT JOIN 
   proyecto_sol_test.Fecha fecha ON fecha.idFecha = hechovuelo.idFecha limit 439461)