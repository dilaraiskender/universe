--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovered_year integer,
    is_periodic boolean,
    speed_km_per_s numeric,
    comet_code text NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30),
    distance_million_light_years numeric,
    has_life boolean,
    discovered_year integer DEFAULT 0 NOT NULL,
    astronomer text DEFAULT 'unknown'::text NOT NULL,
    galaxy_code text NOT NULL
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
    name character varying(50) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    diameter_km integer,
    moon_code text NOT NULL
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
    name character varying(50) NOT NULL,
    has_life boolean,
    star_id integer,
    radius_km integer,
    planet_code text NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(30),
    galaxy_id integer,
    age_million_years integer,
    star_code text NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, true, 70.6, 'COMET_1');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1995, false, 44.0, 'COMET_2');
INSERT INTO public.comet VALUES (3, 'Encke', 1786, true, 69.9, 'COMET_3');
INSERT INTO public.comet VALUES (4, 'Hyakutake', 1996, false, 58.0, 'COMET_4');
INSERT INTO public.comet VALUES (5, 'Borrelly', 1904, true, 32.0, 'COMET_5');
INSERT INTO public.comet VALUES (6, 'Tempel 1', 1867, true, 40.0, 'COMET_6');
INSERT INTO public.comet VALUES (7, 'Wild 2', 1978, true, 27.0, 'COMET_7');
INSERT INTO public.comet VALUES (8, 'Lovejoy', 2011, false, 46.0, 'COMET_8');
INSERT INTO public.comet VALUES (9, 'McNaught', 2006, false, 41.0, 'COMET_9');
INSERT INTO public.comet VALUES (10, 'ISON', 2012, false, 62.0, 'COMET_10');
INSERT INTO public.comet VALUES (11, 'Swift-Tuttle', 1862, true, 59.4, 'COMET_11');
INSERT INTO public.comet VALUES (12, 'Shoemaker-Levy 9', 1993, false, 60.0, 'COMET_12');
INSERT INTO public.comet VALUES (13, 'Neowise', 2020, false, 42.0, 'COMET_13');
INSERT INTO public.comet VALUES (14, 'Biela', 1826, true, 38.0, 'COMET_14');
INSERT INTO public.comet VALUES (15, 'Churyumov-Gerasimenko', 1969, true, 24.0, 'COMET_15');
INSERT INTO public.comet VALUES (16, 'West', 1975, false, 50.0, 'COMET_16');
INSERT INTO public.comet VALUES (17, 'Kohoutek', 1973, false, 53.0, 'COMET_17');
INSERT INTO public.comet VALUES (18, 'Tuttle', 1790, true, 33.0, 'COMET_18');
INSERT INTO public.comet VALUES (19, 'Machholz', 1986, true, 35.0, 'COMET_19');
INSERT INTO public.comet VALUES (20, 'Pons-Brooks', 1812, true, 41.5, 'COMET_20');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Sombrero', 'Elliptical', 29.3, NULL, 1901, 'unknown', 'GAL_1');
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Spiral', 23.0, NULL, 1902, 'unknown', 'GAL_2');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 53.5, NULL, 1903, 'unknown', 'GAL_3');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'Lenticular', 500.0, NULL, 1904, 'unknown', 'GAL_4');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 21.0, NULL, 1905, 'unknown', 'GAL_5');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', 17.0, NULL, 1906, 'unknown', 'GAL_6');
INSERT INTO public.galaxy VALUES (7, 'Cigar', 'Irregular', 12.0, NULL, 1907, 'unknown', 'GAL_7');
INSERT INTO public.galaxy VALUES (8, 'Tadpole', 'Spiral', 420.0, NULL, 1908, 'unknown', 'GAL_8');
INSERT INTO public.galaxy VALUES (9, 'Sunflower', 'Spiral', 27.0, NULL, 1909, 'unknown', 'GAL_9');
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Elliptical', 13.0, NULL, 1910, 'unknown', 'GAL_10');
INSERT INTO public.galaxy VALUES (11, 'Large Magellanic Cloud', 'Irregular', 0.163, NULL, 1911, 'unknown', 'GAL_11');
INSERT INTO public.galaxy VALUES (12, 'Small Magellanic Cloud', 'Irregular', 0.200, NULL, 1912, 'unknown', 'GAL_12');
INSERT INTO public.galaxy VALUES (13, 'Hoags Object', 'Ring', 600.0, NULL, 1913, 'unknown', 'GAL_13');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, NULL, 'MOON_1');
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, NULL, 'MOON_2');
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, NULL, 'MOON_3');
INSERT INTO public.moon VALUES (4, 'Io', true, 5, NULL, 'MOON_4');
INSERT INTO public.moon VALUES (5, 'Europa', true, 5, NULL, 'MOON_5');
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 5, NULL, 'MOON_6');
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, NULL, 'MOON_7');
INSERT INTO public.moon VALUES (8, 'Titan', true, 6, NULL, 'MOON_8');
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 6, NULL, 'MOON_9');
INSERT INTO public.moon VALUES (10, 'Mimas', true, 6, NULL, 'MOON_10');
INSERT INTO public.moon VALUES (11, 'Triton', true, 8, NULL, 'MOON_11');
INSERT INTO public.moon VALUES (12, 'Oberon', true, 7, NULL, 'MOON_12');
INSERT INTO public.moon VALUES (13, 'Titania', true, 7, NULL, 'MOON_13');
INSERT INTO public.moon VALUES (14, 'Umbriel', true, 7, NULL, 'MOON_14');
INSERT INTO public.moon VALUES (15, 'Ariel', true, 7, NULL, 'MOON_15');
INSERT INTO public.moon VALUES (16, 'Miranda', true, 7, NULL, 'MOON_16');
INSERT INTO public.moon VALUES (17, 'Charon', true, 8, NULL, 'MOON_17');
INSERT INTO public.moon VALUES (18, 'Nereid', false, 8, NULL, 'MOON_18');
INSERT INTO public.moon VALUES (19, 'Hyperion', false, 6, NULL, 'MOON_19');
INSERT INTO public.moon VALUES (20, 'Dione', true, 6, NULL, 'MOON_20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, NULL, 'PLANET_1');
INSERT INTO public.planet VALUES (2, 'Mars', false, 1, NULL, 'PLANET_2');
INSERT INTO public.planet VALUES (3, 'Venus', false, 1, NULL, 'PLANET_3');
INSERT INTO public.planet VALUES (4, 'Mercury', false, 1, NULL, 'PLANET_4');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1, NULL, 'PLANET_5');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1, NULL, 'PLANET_6');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 1, NULL, 'PLANET_7');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 1, NULL, 'PLANET_8');
INSERT INTO public.planet VALUES (9, 'Proxima b', false, 2, NULL, 'PLANET_9');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', false, 3, NULL, 'PLANET_10');
INSERT INTO public.planet VALUES (11, 'Kepler-452b', false, 3, NULL, 'PLANET_11');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', false, 4, NULL, 'PLANET_12');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 1, NULL, 'STAR_1');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 1, NULL, 'STAR_2');
INSERT INTO public.star VALUES (3, 'Sirius', 'A-Type', 2, NULL, 'STAR_3');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 3, NULL, 'STAR_4');
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue Supergiant', 4, NULL, 'STAR_5');
INSERT INTO public.star VALUES (6, 'Vega', 'A-Type', 5, NULL, 'STAR_6');
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 'G-Type', 6, NULL, 'STAR_7');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_code_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_code_unique UNIQUE (comet_code);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_code_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_code_unique UNIQUE (galaxy_code);


--
-- Name: galaxy galaxy_discovered_year_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discovered_year_unique UNIQUE (discovered_year);


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
-- Name: moon moon_code_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_code_unique UNIQUE (moon_code);


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
-- Name: planet planet_code_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_code_unique UNIQUE (planet_code);


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
-- Name: star star_code_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_code_unique UNIQUE (star_code);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

