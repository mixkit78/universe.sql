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
    type text NOT NULL,
    star_amount_in_billions integer,
    size_in_kpc numeric(6,3),
    satellite boolean DEFAULT false NOT NULL
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
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    eccentricity numeric,
    speed numeric
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    inhabited boolean NOT NULL,
    mean_radius numeric(10,4),
    mass_of_earth numeric(10,4),
    num_of_moons integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class text,
    magnitude numeric(8,4),
    solar_mass numeric(8,4)
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
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_group_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb', 400, 26.800, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA(s)b', 1000, 46.560, false);
INSERT INTO public.galaxy VALUES (3, 'Messier 32', 'cE2', NULL, NULL, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 110', 'E5', NULL, NULL, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'SA(s)cd', 40, 18.740, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 61', 'SAB(rs)bc', NULL, NULL, true);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (2, 'Stephan''s Quintet', NULL);
INSERT INTO public.galaxy_group VALUES (1, 'Local Group', 5);
INSERT INTO public.galaxy_group VALUES (3, 'Robert''s Quartet', 0);
INSERT INTO public.galaxy_group VALUES (4, 'Bullet Group', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Europe', 5, 0.009, 13743.36);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 0.0074, 8.204);
INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.0549, 1.022);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, 0.0013, 10.880);
INSERT INTO public.moon VALUES (5, 'IO', 5, 0.0041, 17.334);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, 0.0032, 26.57);
INSERT INTO public.moon VALUES (7, 'Metis', 5, 0.0002, 31.501);
INSERT INTO public.moon VALUES (8, 'Thebe', 5, 0.0175, 23.92);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 0.288, 5.57);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 0.0013, 8.48);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 0.0286, 3.26);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 0.0196, 14.28);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 0.0001, 11.35);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 0.0011, 3.64);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 0.0014, 3.15);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 0.0039, 4.67);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 0.0012, 5.51);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 0.0013, 6.66);
INSERT INTO public.moon VALUES (19, 'Puck', 7, 0.00012, 8.21);
INSERT INTO public.moon VALUES (20, 'Triton', 6, 0.000016, 4.39);
INSERT INTO public.moon VALUES (21, 'Proteus', 6, 0.0005, 7.623);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 2439.7000, 0.0550, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 6051.8000, 0.8150, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 6371.0000, 1.0000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 3389.5000, 0.1070, 2);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri d', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri c', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Lalande 21185 c', 7, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Lalande 21185 b', 7, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Lalande 21185 d', 7, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Jupiter', 1, false, 69911.0000, 317.8000, 80);
INSERT INTO public.planet VALUES (12, 'Saturn', 1, false, 58232.0000, 95.1590, 83);
INSERT INTO public.planet VALUES (13, 'Uranus', 1, false, 25362.0000, 14.5360, 27);
INSERT INTO public.planet VALUES (14, 'Neptune', 1, false, 24622.0000, 17.1270, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', -26.7400, 1.0000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5Ve', 10.4300, 0.1200);
INSERT INTO public.star VALUES (3, 'Beta Pictoris', 1, 'A6V', 3.8610, 1.7500);
INSERT INTO public.star VALUES (4, 'Gamma Virginis', 1, 'F0 V/F0 V', 2.7400, 1.5600);
INSERT INTO public.star VALUES (5, 'Eta Arietis', 1, 'F5 V', 5.2300, 1.2100);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 1, 'G0 V', 4.2600, 1.1500);
INSERT INTO public.star VALUES (7, 'Lalande 21185 c', 1, 'M2V', 7.5200, 0.8900);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_group_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy_group galaxy_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


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

