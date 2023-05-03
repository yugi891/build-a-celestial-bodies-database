--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_types character varying(20) NOT NULL,
    diameter_in_light_year integer,
    supercluster_id integer,
    age_in_millions_of_years integer
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
    name character varying(20) NOT NULL,
    diameter_in_km numeric(6,2),
    albedo numeric(4,1),
    planet_id integer
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
    name character varying(20) NOT NULL,
    distance_from_earth_in_millions_km integer,
    has_life boolean,
    star_id integer,
    diameter_in_km numeric(7,1),
    is_spherical boolean
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
    name character varying(20) NOT NULL,
    surface_temperature_in_k integer,
    galaxy_id integer,
    diameter_in_solar_diameter numeric(6,2),
    distance_from_earth_in_ly numeric(6,2),
    mass_in_millions_solar_mass numeric(6,2)
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
-- Name: supercluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supercluster (
    supercluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.supercluster OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supercluster_supercluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supercluster_supercluster_id_seq OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supercluster_supercluster_id_seq OWNED BY public.supercluster.supercluster_id;


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
-- Name: supercluster supercluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster ALTER COLUMN supercluster_id SET DEFAULT nextval('public.supercluster_supercluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Sprial', 20000, 1, 10000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Sprial', 220000, 1, 7000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic clouds', 'Irregular', 1000, 1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 32', 'Eclipse', 8000, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulumn Galaxy', 'Sprial', 60000, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sunflower Galaxy', 'Sprial', 100000, 1, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3476.28, 58.0, 1);
INSERT INTO public.moon VALUES (2, 'Mimas', 397.20, 70.0, 6);
INSERT INTO public.moon VALUES (4, 'Tethys', 1062.00, 122.9, 6);
INSERT INTO public.moon VALUES (3, 'Enceladus', 505.00, 137.5, 6);
INSERT INTO public.moon VALUES (5, 'Dione', 118.00, 55.0, 6);
INSERT INTO public.moon VALUES (6, 'Rthea', 1528.00, 94.9, 6);
INSERT INTO public.moon VALUES (7, 'Hyperion', 276.00, 30.0, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 1469.00, 50.0, 6);
INSERT INTO public.moon VALUES (9, 'Phoebe', 110.00, 8.0, 6);
INSERT INTO public.moon VALUES (10, 'Io', 3643.00, 62.0, 4);
INSERT INTO public.moon VALUES (11, 'Europa', 3122.00, 68.0, 4);
INSERT INTO public.moon VALUES (12, 'Cianymede', 5262.00, 44.0, 4);
INSERT INTO public.moon VALUES (13, 'Callisto', 4821.00, 19.0, 4);
INSERT INTO public.moon VALUES (14, 'Triton', 2706.80, 76.0, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 577.90, 39.0, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 584.70, 21.0, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 788.90, 27.0, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 7614.00, 23.0, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 234.20, 32.0, 7);
INSERT INTO public.moon VALUES (20, 'Titan', 5150.00, 0.3, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0, true, 1, 12742.0, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 150, false, 1, 4880.0, true);
INSERT INTO public.planet VALUES (3, 'Venus', 41, false, 1, 12103.6, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 591, false, 1, 142987.0, true);
INSERT INTO public.planet VALUES (5, 'Mars', NULL, false, 1, 6779.0, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, false, 1, 49244.0, true);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, false, 1, 2376.6, true);
INSERT INTO public.planet VALUES (10, 'Ceres', NULL, false, 1, NULL, true);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, false, 1, NULL, true);
INSERT INTO public.planet VALUES (12, 'MakeMake', NULL, false, 1, NULL, true);
INSERT INTO public.planet VALUES (6, 'Saturm', 1500, false, 1, 11646.0, true);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, false, 1, 50724.0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'UY Scuti', 3365, 1, 1708.00, 9500.00, 10.00);
INSERT INTO public.star VALUES (1, 'Sun', 6000, 1, 1.00, 0.00, 0.00);
INSERT INTO public.star VALUES (3, 'VY Canis Majoris', 3490, 1, 2069.00, 3820.00, 17.00);
INSERT INTO public.star VALUES (4, 'Antares', 3570, 1, 800.00, 550.00, 12.00);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3590, 1, 955.00, 640.00, 11.60);
INSERT INTO public.star VALUES (6, 'Rigel', 12100, 1, 74.00, 860.00, 21.00);
INSERT INTO public.star VALUES (7, 'Alodebaran', 3900, 1, 88.26, 65.30, 1.16);
INSERT INTO public.star VALUES (8, 'Arcturus', 4286, 1, 50.80, 36.70, 1.08);
INSERT INTO public.star VALUES (9, 'Pollux', 4470, 1, 9.00, 33.87, 1.86);
INSERT INTO public.star VALUES (10, 'Sirius', 9940, 1, 1.70, 860.00, 2.06);


--
-- Data for Name: supercluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supercluster VALUES (1, 'Virgo Supercluster', 'Our local supercluster spans 10 times the diameter of the Local Group');
INSERT INTO public.supercluster VALUES (2, 'Perseus-Pisces Supercluster', 'The most obvious supercluster in the sky.');
INSERT INTO public.supercluster VALUES (3, 'Shapley Supercluster', 'A famous supercluster,first noticed by Harlow Shapley in 1930');


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supercluster_supercluster_id_seq', 4, true);


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
-- Name: supercluster supercluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_pkey PRIMARY KEY (supercluster_id);


--
-- Name: supercluster supercluster_supercluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_supercluster_id_key UNIQUE (supercluster_id);


--
-- Name: galaxy galaxy_supercluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_supercluster_id_fkey FOREIGN KEY (supercluster_id) REFERENCES public.supercluster(supercluster_id);


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

