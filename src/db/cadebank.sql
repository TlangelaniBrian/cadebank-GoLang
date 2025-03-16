CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "username" varchar NOT NULL,
  "role" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner_id" bigserial,
  "owner" varchar NOT NULL,
  "balance" money NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now()),
  "country_code" int
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigserial,
  "amount" money NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigserial,
  "to_account_id" bigserial,
  "amount" money NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "accounts"."balance" IS 'it can be positive or negative';

COMMENT ON COLUMN "transfers"."amount" IS 'it must be positive';

ALTER TABLE "accounts" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
