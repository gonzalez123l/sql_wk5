-- 1.
CREATE seven_day_late_fee()
LANGUAGE PLPGSQL
AS $$
DECLARE
  late_fee NUMERIC(10, 2);
BEGIN
    UPDATE payment
    SET amount = amount + late_fee(20)
    FROM rental
    WHERE AGE(return_date, rental_date) > '7 days' AND payment.rental_id = rental.rental_id;
    COMMIT;
END;
$$;

--2.
ALTER TABLE customer
ADD COLUMN platinum_member BOOLEAN DEFAULT FALSE;

CREATE platinum_status()
AS $$
BEGIN
    UPDATE customer
    SET platinum = EXISTS (
        SELECT 1
        FROM payment
        WHERE payment.customer_id = customer.customer_id
        AND payment.amount > 200
    );
    COMMIT;
END;
$$
LANGUAGE PLPGSQL;
CALL platinum_status();