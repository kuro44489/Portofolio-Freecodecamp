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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_million_years integer,
    is_spherical boolean,
    description text NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    has_life boolean,
    age_in_million_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    description text,
    average_temperature_celcius integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    has_life boolean,
    age_in_million_years integer,
    is_spherical boolean,
    description text,
    number_of_moon integer,
    distance_from_earth numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    has_life boolean,
    age_in_million_years integer,
    is_spherical boolean,
    distance_from_earth numeric,
    description text NOT NULL,
    number_planet integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Bima Sakti', true, 13600, false, 'Galaksi Spiral berpalang tempat tata surya kita berada.', 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 10000, false, 'Galaksi spiral terdekat dari bima sakti yang diperkirakan akan bertabrakan miliaran tahun lagi.', 2.5);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 12000, false, 'Galaxy spiral murni yang terletak di sari bintang Triangulum', 2.7);
INSERT INTO public.galaxy VALUES (4, 'Large magellanic cloud', false, 13000, false, 'galaxy satellit kata yang mengorbit bumi', 0.16);
INSERT INTO public.galaxy VALUES (5, 'Small magellanic cloud', false, 12000, false, 'galaxy satellit katai yang tidak beraturan yang mengitari bima sakti', 0.2);
INSERT INTO public.galaxy VALUES (6, 'Whirpool', false, 400, false, 'Galaksi spiral interaksi yang terkenal dengan struktur lengan spiralnya yang sangat jelas', 23.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, 4530, true, 0.38, 'Satelit alami satu-satunya milik Bumi.', -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 4500, false, 77.8, 'Bulan terbesar Mars yang bentuknya tidak beraturan.', -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 4500, false, 78.2, 'Bulan terkecil Mars, berjarak sangat dekat dengan planetnya.', -40);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, 4500, true, 628, 'Bulan Jupiter yang paling aktif secara vulkanik di Tata Surya.', -140);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 4500, true, 628, 'Bulan Jupiter yang memiliki samudra air di bawah lapisan esnya.', -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 4500, true, 628, 'Bulan terbesar di Tata Surya, bahkan lebih besar dari Merkurius.', -160);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, 4500, true, 628, 'Salah satu objek dengan kawah terbanyak di Tata Surya.', -139);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 4500, false, 628, 'Bulan Jupiter berbentuk seperti kentang yang berwarna kemerahan.', -150);
INSERT INTO public.moon VALUES (9, 'Titan', 6, false, 4500, true, 1275, 'Bulan Saturnus yang memiliki atmosfer tebal dan danau metana.', -179);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, false, 4500, true, 1275, 'Bulan Saturnus yang memancarkan geyser air dari kutub selatannya.', -198);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, false, 4500, true, 1275, 'Bulan Saturnus yang terkenal karena kawah raksasanya.', -200);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, false, 4500, true, 1275, 'Bulan es Saturnus yang berwarna terang.', -220);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, false, 4500, true, 1275, 'Bulan Saturnus dengan dua warna berbeda (terang dan gelap).', -143);
INSERT INTO public.moon VALUES (14, 'Dione', 6, false, 4500, true, 1275, 'Bulan Saturnus yang memiliki jaringan tebing es yang curam.', -186);
INSERT INTO public.moon VALUES (15, 'Titania', 7, false, 4500, true, 2723, 'Bulan terbesar Uranus yang dipenuhi ngarai raksasa.', -203);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, false, 4500, true, 2723, 'Bulan terluar Uranus dengan permukaan tua dan berkawah.', -203);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, false, 4500, true, 2723, 'Bulan Uranus yang memiliki formasi geologis unik.', -187);
INSERT INTO public.moon VALUES (18, 'Triton', 8, false, 4500, true, 4351, 'Bulan Neptunus yang mengorbit ke arah berlawanan (retrograde).', -235);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, false, 4500, false, 4351, 'Salah satu bulan dengan orbit paling eksentrik di Tata Surya.', -220);
INSERT INTO public.moon VALUES (20, 'Charon', 9, false, 4500, true, 5900, 'Bulan terbesar Pluto, sering disebut sebagai planet katai kembar.', -220);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Merkurius', 1, false, 4500, true, 'Planet terkecil di Tata Surya dan yang paling dekat dengan Matahari.', 0, 91.6);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 4500, true, 'Planet terpanas karena efek rumah kaca yang sangat ekstrem.', 0, 41.4);
INSERT INTO public.planet VALUES (3, 'Bumi', 1, true, 4540, true, 'Satu-satunya planet yang diketahui memiliki kehidupan dan air cair.', 1, 0.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 4600, true, 'Dikenal sebagai Planet Merah karena permukaannya kaya akan besi oksida.', 2, 78.3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 4600, true, 'Planet terbesar di Tata Surya yang terdiri dari gas raksasa.', 95, 628.7);
INSERT INTO public.planet VALUES (6, 'Saturnus', 1, false, 4500, true, 'Planet gas raksasa yang terkenal dengan sistem cincinnya yang indah.', 146, 1275);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 4500, true, 'Planet es raksasa yang berputar miring pada porosnya.', 27, 2723);
INSERT INTO public.planet VALUES (8, 'Neptunus', 1, false, 4500, true, 'Planet terjauh dari Matahari dengan angin tercepat di Tata Surya.', 14, 4351);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 4600, true, 'Planet katai yang dulunya dianggap sebagai planet kesembilan.', 5, 5900);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, false, 4500, true, 'Planet katai terkecil yang terletak di sabuk asteroid utama.', 0, 413);
INSERT INTO public.planet VALUES (11, 'Eris', 1, false, 4500, true, 'Planet katai masif yang terletak di sabuk Kuiper.', 1, 10100);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, false, 4500, false, 'Planet katai dengan bentuk lonjong (tidak bulat sempurna) akibat rotasi cepat.', 2, 7700);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Matahari', 1, true, 4600, true, 0.000015, 'intang pusat Tata Surya dan sumber energi utama bagi kehidupan di Bumi.', 8);
INSERT INTO public.star VALUES (2, 'Sirius', 1, false, 242, true, 8.6, 'Bintang paling terang yang terlihat di langit malam dari Bumi', 0);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, false, 88990, true, 10.6, 'Bintang paling terang di rasi Andromeda, merupakan bintang ganda spektroskopik', 9);
INSERT INTO public.star VALUES (4, 'Mirach', 2, true, 70000, true, 9.8, 'Raksasa merah yang dikenal memiliki planet atau katai coklat yang mengorbitnya', 5);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 3, false, 92839, true, 2.4, 'Bintang paling terang di rasi Triangulum dengan magnitudo 3.00', 6);
INSERT INTO public.star VALUES (6, 'Alpha Trianguli', 3, true, 87283, false, 9.3, 'Bintang raksasa oranye yang menjadi salah satu titik sudut utama rasi Triangulum', 4);
INSERT INTO public.star VALUES (7, 'HD 34661', 4, true, 9482, true, 6.3, 'Bintang terang yang terletak di Awan Magellan Besar.', 5);
INSERT INTO public.star VALUES (8, 'SK 108', 5, false, 92749, true, 3.7, 'Bintang super raksasa biru yang terletak di Awan Magellan Kecil.', 3);
INSERT INTO public.star VALUES (9, 'M51', 6, true, 93829, false, 6.6, 'memiliki miliaran bintang, dan belum ada nama individual yang menonjol dalam data pengamatan amatir', 7);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

