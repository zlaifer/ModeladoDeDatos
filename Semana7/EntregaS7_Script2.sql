---------------------------------
USE Proyecto_G5_202413;
---------------------------------
CREATE VIEW Proyecto_G5_202413.G5_TableroControl_2 AS (
Select
hv.pasajeros,
hv.vuelosTotales,
hv.cargaOfrecida,
hv.sillas,
hv.cargaAbordo,
f.descripcion as fecha,
f.anio,
f.mes,
f.dia,
tv.nombreTipo,
tv.tipoEquipo,
tf.nombreTrafico,
ao.sigla as sigla_aeropuerto_origen,
ao.iata as iata_aeropuerto_origen,
ao.nombre as nombre_aeropuerto_origen,
ao.elevacion as elevacion_aeropuerto_origen,
ao.nombreMunicipio as nombre_municipio_aeropuerto_origen,
ao.nombreDepartamento as nombre_departament_aeropuerto_origen,
ad.sigla as sigla_aeropuerto_destino,
ad.iata as iata_aeropuerto_destino,
ad.nombre as nombre_aeropuerto_destino,
ad.elevacion as elevacion_aeropuerto_destino,
ad.nombreMunicipio as nombre_municipio_aeropuerto_destino,
ad.nombreDepartamento as nombre_departament_aeropuerto_destino

FROM proyecto_sol_test.HechoVuelo hv
JOIN proyecto_sol_test.Fecha f ON hv.idFecha = f.idFecha
JOIN proyecto_sol_test.TipoVuelo tv ON hv.idTipoVuelo_DWH = tv.idTipoVuelo_DWH
JOIN proyecto_sol_test.Trafico tf ON hv.idTrafico_DWH = tf.idTrafico_DWH
JOIN proyecto_sol_test.Aeropuerto ao ON hv.idAeropuertoOrigen_DWH = ao.idAeropuerto_DWH
JOIN proyecto_sol_test.Aeropuerto ad ON hv.idAeropuertoDestino_DWH = ad.idAeropuerto_DWH
);