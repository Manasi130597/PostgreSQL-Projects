--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text NOT NULL,
    size integer NOT NULL,
    has_life boolean NOT NULL,
    is_active boolean,
    age_in_million_years integer DEFAULT 10000 NOT NULL,
    mass numeric DEFAULT 1.0 NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    orbit_period integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    has_atmosphere boolean,
    gravity numeric DEFAULT 1.0 NOT NULL,
    terrain_type text DEFAULT 'unknown'::text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    mass numeric NOT NULL,
    radius integer NOT NULL,
    has_rings boolean NOT NULL,
    is_habitable boolean,
    planet_type text DEFAULT 'unknown'::text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    population bigint NOT NULL,
    intelligence_level text NOT NULL,
    is_sentient boolean NOT NULL,
    is_extinct boolean,
    avg_height numeric DEFAULT 1.5 NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    luminosity numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    is_binary boolean,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, true, 13600, 1500000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 110000, false, true, 10000, 1230000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, false, true, 9200, 500000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76000, false, true, 11000, 1400000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000, false, false, 9000, 850000000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 30000, false, true, 13000, 10000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, 27, false, false, 1.62, 'rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0, false, false, 0.0057, 'rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1, false, false, 0.003, 'rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, 4, true, false, 1.31, 'icy');
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, 7, false, true, 1.43, 'icy');
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4820, 17, false, false, 1.24, 'icy');
INSERT INTO public.moon VALUES (7, 'Io', 3, 3643, 2, true, false, 1.79, 'volcanic');
INSERT INTO public.moon VALUES (8, 'Titan', 3, 5150, 16, false, true, 1.35, 'icy');
INSERT INTO public.moon VALUES (9, 'Rhea', 3, 1528, 5, false, false, 0.26, 'icy');
INSERT INTO public.moon VALUES (10, 'Triton', 3, 2706, 6, true, true, 0.78, 'icy');
INSERT INTO public.moon VALUES (11, 'Oberon', 3, 1523, 14, false, false, 0.35, 'rocky');
INSERT INTO public.moon VALUES (12, 'Ariel', 3, 1157, 3, false, false, 0.27, 'rocky');
INSERT INTO public.moon VALUES (13, 'Pandora Moon', 11, 4000, 10, true, true, 1.1, 'forest');
INSERT INTO public.moon VALUES (14, 'Zebes Alpha', 10, 3000, 12, true, false, 1.2, 'volcanic');
INSERT INTO public.moon VALUES (15, 'LV-426a', 12, 1000, 3, false, false, 0.9, 'desert');
INSERT INTO public.moon VALUES (16, 'LV-426b', 12, 1100, 3, false, false, 0.95, 'desert');
INSERT INTO public.moon VALUES (17, 'Prox-Moon 1', 5, 1200, 3, false, false, 0.6, 'rocky');
INSERT INTO public.moon VALUES (18, 'Prox-Moon 2', 5, 800, 2, false, false, 0.3, 'icy');
INSERT INTO public.moon VALUES (19, 'Kepler Moon', 6, 1500, 4, false, true, 0.7, 'mountainous');
INSERT INTO public.moon VALUES (20, 'Gliese Moon', 7, 1700, 3, false, true, 0.75, 'rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0, 6371, false, true, 'terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, 3390, false, false, 'terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.8, 69911, true, false, 'gas giant');
INSERT INTO public.planet VALUES (4, 'Venus', 1, 0.815, 6051, false, false, 'terrestrial');
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 1.27, 7160, false, true, 'terrestrial');
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 3, 2.4, 9200, false, true, 'super-Earth');
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 2, 3.1, 11000, false, true, 'super-Earth');
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 3, 220, 130000, true, false, 'hot Jupiter');
INSERT INTO public.planet VALUES (9, 'Planet X', 4, 15.0, 30000, true, false, 'ice giant');
INSERT INTO public.planet VALUES (10, 'Zebes', 5, 0.9, 6400, false, true, 'terrestrial');
INSERT INTO public.planet VALUES (11, 'Pandora', 6, 1.2, 7800, true, true, 'exomoon');
INSERT INTO public.planet VALUES (12, 'LV-426', 6, 1.1, 6700, false, false, 'rocky');


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Humans', 1, 8000000000, 'High', true, false, 1.7);
INSERT INTO public.species VALUES (2, 'Martians', 2, 0, 'Medium', true, true, 1.5);
INSERT INTO public.species VALUES (3, 'Vi', 11, 1000000, 'High', true, false, 3.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.0, true, false, 'The Sun is the closest star to Earth and supports all life.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 0.0017, true, false, 'A red dwarf in the Alpha Centauri system.');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 25.4, true, true, 'The brightest star in the night sky, part of a binary system.');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 12100, 120000, false, true, 'A blue supergiant in the Orion constellation.');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 5790, 1.5, true, true, 'One of the closest stars to Earth, part of a triple system.');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 3500, 126000, false, false, 'A massive red supergiant expected to go supernova.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

