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
    name character varying(30) NOT NULL,
    black_hole_name text NOT NULL,
    black_hole_mass_in_million_solar_mass numeric(6,1),
    distance_from_earth_ly integer
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
    name character varying(30) NOT NULL,
    ocean_present boolean,
    volcanic boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_galaxy_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    has_moons boolean,
    life_present boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age numeric(4,1),
    class character(1),
    num_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.star_id;


--
-- Name: supernovae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernovae (
    supernovae_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.supernovae OWNER TO freecodecamp;

--
-- Name: supernovae_supernovae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supernovae_supernovae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supernovae_supernovae_id_seq OWNER TO freecodecamp;

--
-- Name: supernovae_supernovae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supernovae_supernovae_id_seq OWNED BY public.supernovae.supernovae_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Name: supernovae supernovae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernovae ALTER COLUMN supernovae_id SET DEFAULT nextval('public.supernovae_supernovae_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius A*', 4.3, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'M31*', 2.3, 3);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'M104', 1000.0, 30);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'NGC 5128', 55.0, 13);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'M81', 70.0, 12);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'M87*', 6.5, 53);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, false, 5);
INSERT INTO public.moon VALUES (9, 'Titan', true, false, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, false, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', true, false, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', false, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', true, false, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', false, false, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', false, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', false, false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', false, false, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', false, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', true, true, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', false, false, 8);
INSERT INTO public.moon VALUES (21, 'Nereid', false, false, 8);
INSERT INTO public.moon VALUES (22, 'Larissa', false, false, 8);
INSERT INTO public.moon VALUES (23, 'Galatea', false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Gas', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Gas', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Rocky', false, false, 3);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Rocky', false, false, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'Rocky', false, false, 3);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'Gas', false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.6, 'G', 8, 1);
INSERT INTO public.star VALUES (2, 'Mirach', 3.0, 'M', 0, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.8, 'M', 3, 1);
INSERT INTO public.star VALUES (4, '51 Pegasi', 6.1, 'G', 1, 1);
INSERT INTO public.star VALUES (5, 'Kepler-452', 6.0, 'G', 1, 1);
INSERT INTO public.star VALUES (6, 'Andromeda Variable 1', 0.1, 'G', 0, 2);
INSERT INTO public.star VALUES (7, 'LBV 1806-20', 0.1, 'O', 0, 2);


--
-- Data for Name: supernovae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernovae VALUES (1, 1, 'SN 1006');
INSERT INTO public.supernovae VALUES (2, 1, 'SN 1604');
INSERT INTO public.supernovae VALUES (3, 2, 'S Andromedae');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_galaxy_id_seq', 23, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 12, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 7, true);


--
-- Name: supernovae_supernovae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supernovae_supernovae_id_seq', 3, true);


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
-- Name: supernovae supernovae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernovae
    ADD CONSTRAINT supernovae_name_key UNIQUE (name);


--
-- Name: supernovae supernovae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernovae
    ADD CONSTRAINT supernovae_pkey PRIMARY KEY (supernovae_id);


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

