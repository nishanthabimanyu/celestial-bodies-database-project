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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_mly numeric(10,4),
    has_life boolean DEFAULT false NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet_km integer,
    description text,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 13600, 0.0000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The closest large spiral galaxy to the Milky Way.', 10000, 2.5370, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy in the Local Group, third largest.', 5000, 3.0000, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'A grand design spiral galaxy in the constellation Ursa Major.', 13300, 12.0000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic interacting grand-design spiral galaxy.', 400, 23.0000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'An unbarred spiral galaxy in the constellation Virgo.', 13250, 29.3000, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Galaxies characterized by a flattened, rotating disk with spiral arms.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Galaxies with an elliptical shape and a generally uniform distribution of stars.');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Galaxies that do not have a distinct regular shape.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', true, 384400, 'Earth''s only natural satellite.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 9377, 'Larger of Mars'' two moons.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 23460, 'Smaller of Mars'' two moons.', 2);
INSERT INTO public.moon VALUES (4, 'Io', true, 421700, 'Volcanically active moon of Jupiter.', 3);
INSERT INTO public.moon VALUES (5, 'Europa', true, 670900, 'Jupiter moon with a subsurface ocean.', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1070400, 'Largest moon in the solar system, orbiting Jupiter.', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1882700, 'Jupiter moon, heavily cratered.', 3);
INSERT INTO public.moon VALUES (8, 'Titan', true, 1221870, 'Saturn''s largest moon, with a thick atmosphere.', 4);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 527040, 'Second largest moon of Saturn.', 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', true, 3561300, 'Saturnian moon with two-tone coloration.', 4);
INSERT INTO public.moon VALUES (11, 'Dione', true, 377420, 'Saturnian moon with a trailing hemisphere of bright ice cliffs.', 4);
INSERT INTO public.moon VALUES (12, 'Enceladus', true, 238040, 'Saturnian moon with cryovolcanoes.', 4);
INSERT INTO public.moon VALUES (13, 'Mimas', true, 185540, 'Saturnian moon known for its large Herschel Crater.', 4);
INSERT INTO public.moon VALUES (14, 'Hyperion', false, 1481100, 'Spongy-looking moon of Saturn.', 4);
INSERT INTO public.moon VALUES (15, 'Phoebe', false, 12952000, 'Irregular moon of Saturn, likely a captured object.', 4);
INSERT INTO public.moon VALUES (16, 'Charon', true, 19571, 'Largest moon of dwarf planet Pluto (if you added it).', 7);
INSERT INTO public.moon VALUES (17, 'Titania', true, 435900, 'Largest moon of Uranus (if you added Uranus as a planet).', 10);
INSERT INTO public.moon VALUES (18, 'Oberon', true, 583500, 'Second largest moon of Uranus.', 10);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, 266300, 'Uranian moon, dark and heavily cratered.', 10);
INSERT INTO public.moon VALUES (20, 'Ariel', true, 191000, 'Uranian moon, tectonically active.', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'Our home planet, third from the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 'The Red Planet, fourth from the Sun.', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, true, 'The largest planet in our solar system, a gas giant.', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', false, true, 'Known for its prominent rings, a gas giant.', 1);
INSERT INTO public.planet VALUES (5, 'Kepler-186f', false, true, 'An exoplanet in the habitable zone of its star.', 2);
INSERT INTO public.planet VALUES (6, 'Gliese 581g', false, true, 'A super-Earth exoplanet, potentially habitable.', 2);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', false, true, 'An exoplanet orbiting Proxima Centauri, potentially rocky.', 3);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri d', false, true, 'A super-Earth exoplanet orbiting Proxima Centauri.', 3);
INSERT INTO public.planet VALUES (9, 'HD 219134 b', false, true, 'A super-Earth exoplanet, one of the closest discovered.', 4);
INSERT INTO public.planet VALUES (10, 'WASP-12b', false, true, 'A hot Jupiter exoplanet, one of the hottest known.', 5);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1b', false, true, 'One of several terrestrial planets orbiting TRAPPIST-1.', 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1c', false, true, 'Another rocky exoplanet in the TRAPPIST-1 system.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 4600, 'Our home star, a yellow dwarf.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 240, 'The brightest star in the night sky, in Canis Major.', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', true, 4850, 'A red dwarf star, closest to the Sun.', 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', true, 60, 'The brightest star in the Andromeda constellation.', 2);
INSERT INTO public.star VALUES (5, 'Mirach', true, 200, 'A red giant in the constellation Andromeda.', 2);
INSERT INTO public.star VALUES (6, 'R136a1', true, 1, 'One of the most massive and luminous stars known, in the Large Magellanic Cloud.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

