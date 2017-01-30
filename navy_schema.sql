CREATE TABLE IF NOT EXISTS fleet(
  fleet_id bigserial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ship(
  ship_id bigserial PRIMARY KEY,
  fleet_id bigserial REFERENCES fleet(fleet_id),
  name varchar NOT NULL,
  date_built timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS duty (
  duty_id bigserial PRIMARY KEY,
  ship_id bigserial REFERENCES ship(ship_id) NOT NULL,
  rank smallint NOT NULL,
  status smallint NOT NULL,
  description varchar(255),
  start_time timestamp,
  end_time timestamp
);

CREATE TABLE IF NOT EXISTS sailor (
  id bigserial PRIMARY KEY,
  name varchar(100),
  dob timestamp,
  duty_id bigserial REFERENCES duty(duty_id)
);
