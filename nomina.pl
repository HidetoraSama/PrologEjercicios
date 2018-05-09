tipoContrato('Esteban','Tiempo Completo').
tipoContrato('Miguel','Medio Tiempo').
tipoContrato('Nicolas','Horas Parcial').
tipoContrato('Andrea','Horas Completo').
tipoContrato('Alejandro','Indefinido').

categoriaContrato('Esteban','Titular').
categoriaContrato('Miguel','Auxiliar').
categoriaContrato('Nicolas','Titular').
categoriaContrato('Andrea','Titular').
categoriaContrato('Alejandro','Auxiliar').

%Tipo de contrato, horas trabajadas a la semana
horasTipoContrato('Tiempo Completo',48).
horasTipoContrato('Medio Tiempo',24).
horasTipoContrato('Horas Parcial',20).
horasTipoContrato('Horas Completo',30).
horasTipoContrato('Indefinido',50).

tipoContratoCategoria('Tiempo Completo','Auxiliar').
tipoContratoCategoria('Tiempo Completo','Titular').
tipoContratoCategoria('Medio Tiempo','Auxiliar').
tipoContratoCategoria('Medio Tiempo','Titular').
tipoContratoCategoria('Horas Parcial','Auxiliar').
tipoContratoCategoria('Horas Parcial','Titular').
tipoContratoCategoria('Horas Completo','Auxiliar').
tipoContratoCategoria('Horas Completo','Titular').
tipoContratoCategoria('Indefinido','Auxiliar').
tipoContratoCategoria('Indefinido','Titular').

%Tipo contrato, categoria del Contrato, valor de la hora
valorHoraCategoria('Tiempo Completo','Auxiliar',6000).
valorHoraCategoria('Tiempo Completo','Titular',10000).
valorHoraCategoria('Medio Tiempo','Auxiliar',9000).
valorHoraCategoria('Medio Tiempo','Titular',12000).
valorHoraCategoria('Horas Parcial','Auxiliar',7000).
valorHoraCategoria('Horas Parcial','Titular',11000).
valorHoraCategoria('Horas Completo','Auxiliar',5000).
valorHoraCategoria('Horas Completo','Titular',8000).
valorHoraCategoria('Indefinido','Auxiliar',13000).
valorHoraCategoria('Indefinido','Titular',15000).

%Tipo semestre, semanas
tipoLiquidacion('Semestral',18).
tipoLiquidacion('Mensual',4).
tipoLiquidacion('Quincenal',2).

%Aumentos legales en horas
bonoMensual('Tiempo Completo',15).
bonoMensual('Horas Completo',12).
bonoMensual('Medio Tiempo',10).
bonoMensual('Horas Parcial',5).
bonoMensual('Indefinido',25).

%Descuentos legales en porcentajes
saludMensual('Tiempo Completo',0.04).
saludMensual('Horas Completo',0.04).
saludMensual('Medio Tiempo',0.04).
saludMensual('Horas Parcial',0.04).
saludMensual('Indefinido',0.04).
pensionMensual('Tiempo Completo',0.04).
pensionMensual('Horas Completo',0.04).
pensionMensual('Medio Tiempo',0.04).
pensionMensual('Horas Parcial',0.04).
pensionMensual('Indefinido',0.04).

%Funcion sumar
sumar([],0).
sumar([ X | Xs ],R) :- sumar(Xs, R1), R is R1 + X.

%Calculo de la nomina de un empleado en un periodo determinado
nominaIndividual(X,Tliq,Persona):-tipoContrato(Persona,TCon),horasTipoContrato(TCon,Horas),
		categoriaContrato(Persona,CCon),valorHoraCategoria(TCon,CCon,Valor),
		bonoMensual(TCon,Bono),tipoLiquidacion(Tliq,Semanas),saludMensual(TCon,Salud),
		pensionMensual(TCon,Pension),
		X is round((((Horas*Valor*Semanas)+(Bono*Valor))*(1-Salud-Pension))).

%Calculo de la nomina general para todos los empleados en diferentes periodos determinados
nominaGeneral(Total, Tliq) :- findall(X, (tipoContrato(Persona,TCon),horasTipoContrato(TCon,Horas),
		categoriaContrato(Persona,CCon),valorHoraCategoria(TCon,CCon,Valor),
		bonoMensual(TCon,Bono),tipoLiquidacion(Tliq,Semanas),saludMensual(TCon,Salud),
		pensionMensual(TCon,Pension),
		X is round((((Horas*Valor*Semanas)+(Bono*Valor))*(1-Salud-Pension)))), Lista), sumar(Lista,Total).