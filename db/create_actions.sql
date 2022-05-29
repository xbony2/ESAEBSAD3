CREATE TYPE public.action_type AS ENUM
    ('create', 'edit', 'delete');

ALTER TYPE public.action_type
    OWNER TO postgres;

-- Table: public.actions

-- DROP TABLE IF EXISTS public.actions;

CREATE TABLE IF NOT EXISTS public.actions
(
    id integer NOT NULL,
    groupid integer NOT NULL,
    wikitext_before text COLLATE pg_catalog."default",
    wikitext_after text COLLATE pg_catalog."default",
    type action_type NOT NULL,
    CONSTRAINT actions_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.actions
    OWNER to postgres;
