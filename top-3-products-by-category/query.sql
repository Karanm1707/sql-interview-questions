with cte as (
select p.product_id, category, product_name, sum(o.revenue) as total_revenue,
rank() over(partition by category order by sum(o.revenue) desc) as rnkk
from products p join orders o on
p.product_id = o.product_id
group by p.product_id, category, product_name
)

select product_id, category, product_name, total_revenue from cte
where rnkk <=3
