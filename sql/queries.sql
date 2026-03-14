-- ======================================================
-- Querys em SQL utilizadas para preparação e extração dos dados
-- Projeto: Análise de Vendas Automotivas
-- Objetivo: criar views analíticas para o modelo no Power BI
-- ======================================================

-- =======================
-- FATO_VENDAS
-- ======================
create view FATO_VENDAS as  
select
	visit_id, 
	paid_date,
	fun.product_id,
	store_id,
	customer_id,
	(pro.price * (1+fun.discount)) as valor_venda
from
	sales.funnel as fun
left join
	sales.products as pro
		on fun.product_id = pro.product_id
where
	paid_date is not null
  
-- =======================
-- DIM_MARCA
-- =======================
create view DIM_MARCA as
select product_id, brand, model
from sales.products

-- =======================
-- DIM_ESTADO
-- =======================
create view DIM_ESTADO as 
select 
	customer_id, 
	state
from 
	sales.customers
where 
	state is not null

---- =======================
-- DIM_TEMPO
---- =======================
create view DIM_TEMPO as

with nomeacao_calendario as (
	
	select
		paid_date,
		case
			when extract ('month' from paid_date) = 1 then 'Janeiro'
			when extract ('month' from paid_date) = 2 then 'Fevereiro'
			when extract ('month' from paid_date) = 3 then 'Março'
			when extract ('month' from paid_date) = 4 then 'Abril'
			when extract ('month' from paid_date) = 5 then 'Maio'
			when extract ('month' from paid_date) = 6 then 'Junho'
			when extract ('month' from paid_date) = 7 then 'Julho'
			when extract ('month' from paid_date) = 8 then 'Agosto'
			when extract ('month' from paid_date) = 9 then 'Setembro'
			when extract ('month' from paid_date) = 10 then 'Outubro'
			when extract ('month' from paid_date) = 11 then 'Novembro'
			else 'Dezembro'
		end as nome_mes
	from FATO_VENDAS
		
)

select distinct
	NOM.paid_date,
	extract ('year' from FAT.paid_date) as ano,
	extract ('month' from FAT.paid_date) as mes,
	NOM.nome_mes
from 
	FATO_VENDAS as FAT
left join 
	nomeacao_calendario as NOM
		on FAT.paid_date = NOM.paid_date
order by 
	NOM.paid_date
