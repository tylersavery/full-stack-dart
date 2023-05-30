--
-- Class Category as table category
--

CREATE TABLE "category" (
  "id" serial,
  "name" text NOT NULL
);

ALTER TABLE ONLY "category"
  ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Class Ingredient as table ingredient
--

CREATE TABLE "ingredient" (
  "id" serial,
  "userId" integer NOT NULL,
  "name" text NOT NULL,
  "categoryId" integer NOT NULL,
  "isChecked" boolean NOT NULL
);

ALTER TABLE ONLY "ingredient"
  ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "ingredient"
  ADD CONSTRAINT ingredient_fk_0
    FOREIGN KEY("categoryId")
      REFERENCES category(id)
        ON DELETE CASCADE;

--
-- Class Profile as table profile
--

CREATE TABLE "profile" (
  "id" serial,
  "userId" integer NOT NULL,
  "avatarUrl" text NOT NULL,
  "bio" text NOT NULL
);

ALTER TABLE ONLY "profile"
  ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


