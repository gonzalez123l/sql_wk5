CREATE TABLE "Customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email" VARCHAR(50),
  "billing_info" VARCHAR(150),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Movies" (
  "movie_id" SERIAL,
  "film" VARCHAR(50),
  "genre" VARCHAR(50),
  "theatre_id" INTEGER,
  "length_film" TIME,
  PRIMARY KEY ("movie_id")
);

CREATE INDEX "Key" ON  "Movies" ("length_film");

CREATE TABLE "concession" (
  "concession_id" SERIAL,
  "food" VARCHAR(20),
  "beverage" VARCHAR(20),
  "candy" VARCHAR(20),
  "billing_info" serial,
  PRIMARY KEY ("concession_id")
);

CREATE TABLE "Seat" (
  "seat_id" SERIAL,
  "ticket_id" INTEGER,
  PRIMARY KEY ("seat_id")
);

CREATE TABLE "Ticket" (
  "ticket_id" SERIAL,
  "price" NUMERIC(6,2),
  "movie_time" DATE,
  "seat_id" INTEGER,
  "customer_id" Type,
  "movie_id" INTEGER,
  "theatre_id" Type,
  PRIMARY KEY ("ticket_id"),
  CONSTRAINT "FK_Ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "Customer"("customer_id"),
  CONSTRAINT "FK_Ticket.movie_id"
    FOREIGN KEY ("movie_id")
      REFERENCES "Movies"("movie_id"),
  CONSTRAINT "FK_Ticket.seat_id"
    FOREIGN KEY ("seat_id")
      REFERENCES "Seat"("seat_id")
);

CREATE TABLE "Theatre" (
  "theatre_id" INTEGER,
  PRIMARY KEY ("theatre_id"),
  CONSTRAINT "FK_Theatre.theatre_id"
    FOREIGN KEY ("theatre_id")
      REFERENCES "Movies"("theatre_id")
);

