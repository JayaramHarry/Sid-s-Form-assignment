SELECT 
    r.Vehicle_id,
    o.Product_Name,
    SUM(o.Quantity) AS Total_Quantity
FROM 
    Orders o
JOIN 
    Customers c ON o.Customer_id = c.Customer_id
JOIN 
    Routes r ON c.Route_id = r.Route_id
JOIN 
    Vehicles v ON r.Vehicle_id = v.Vehicle_id
WHERE 
    o.Order_status = 'confirmed'
    AND o.Delivery_date BETWEEN '@start_date' AND '@end_date' -- specify your date range here
GROUP BY 
    r.Vehicle_id,
    o.Product_Name
ORDER BY 
    r.Vehicle_id,
    o.Product_Name;
