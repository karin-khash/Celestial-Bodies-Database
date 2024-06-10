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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    size_in_km numeric(10,3),
    average_orbital_speed_in_km_s numeric(10,2)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(60),
    app_size_in_kpc numeric(10,2),
    black_hole boolean
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
    name character varying(255) NOT NULL,
    size_in_diameter integer,
    average_orbital_speed_in_km_s numeric(10,2),
    description text,
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
    name character varying(255) NOT NULL,
    planet_type character varying(60),
    has_life boolean,
    description text,
    star_id integer
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
    type character varying(60),
    size_in_solar_radius numeric(10,2),
    temperature_in_kelvin integer,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Carbonaceous', 939.000, 17.88);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Vestoid', 525.000, 19.34);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Carbonaceous', 512.000, 17.65);
INSERT INTO public.asteroid VALUES (4, 'Eros', 'Silicaceous', 34.400, 24.36);
INSERT INTO public.asteroid VALUES (5, 'Itokawa', 'Silicaceous', 0.330, 31.77);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 26.80, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60.00, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Dwarf Irregular', 14.00, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 50.00, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 60.00, true);
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 'Spiral', 110.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 1.02, 'Earth only natural satellite, heavily cratered and affecting tides.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 2.14, 'The larger and innermost moon of Mars, with a grooved surface.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 1.35, 'The smaller and outer moon of Mars, smoother than Phobos.', 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 10.88, 'Largest moon in the Solar System, has a magnetic field.', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 13.74, 'Icy surface with potential subsurface ocean.', 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 4821, 8.20, 'Heavily cratered and ancient surface.', 3);
INSERT INTO public.moon VALUES (7, 'Io', 3643, 17.34, 'Io is the most volcanically active body in the Solar System, with over 400 active volcanoes. Its surface is dotted with lava lakes and covered in sulfur, giving it a colorful, mottled appearance.', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 5152, 5.57, 'Titan is Saturn largest moon and the second-largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen, with methane and hydrogen. Titan surface features liquid methane and ethane lakes and rivers, along with vast dunes of hydrocarbon sand. Its subsurface ocean of water and ammonia is a subject of interest in the search for life.', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 12.64, 'Enceladus is known for its icy surface and geysers that eject water vapor and organic molecules from its subsurface ocean. These plumes make Enceladus a prime candidate in the search for extraterrestrial life. The moon surface features a variety of terrains, from heavily cratered regions to smooth plains with fractures and ridges.', 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 1527, 8.48, 'Rhea is Saturn second-largest moon and has a surface composed mostly of water ice, with a rocky core. It is heavily cratered, indicating an ancient surface. Rhea may also have a tenuous atmosphere made up of oxygen and carbon dioxide.', 4);
INSERT INTO public.moon VALUES (11, 'Dione', 1123, 10.03, 'Dione has a thick ice crust with bright, wispy streaks that are thought to be ice cliffs created by tectonic fractures. Its surface shows a mix of heavily cratered regions and smoother plains, suggesting a complex geological history.', 4);
INSERT INTO public.moon VALUES (12, 'Mimas', 396, 14.28, 'Mimas is known for its large impact crater, Herschel, which gives it a resemblance to the Death Star from Star Wars. Its surface is heavily cratered and composed mostly of water ice.', 4);
INSERT INTO public.moon VALUES (13, 'Iapetus', 1469, 3.26, 'Iapetus is notable for its two-tone coloration, with one hemisphere being much darker than the other. It also has a prominent equatorial ridge, giving it a walnut-like appearance.', 4);
INSERT INTO public.moon VALUES (14, 'Hyperion', 270, 5.64, 'Hyperion has an irregular shape and a chaotic rotation. Its surface is covered with deep, sharp-edged craters, and it has a low density, suggesting a porous, sponge-like interior.', 4);
INSERT INTO public.moon VALUES (15, 'Triton', 2706, 4.39, 'Triton is the largest moon of Neptune and is unique for its retrograde orbit, meaning it orbits Neptune in the opposite direction of the planet rotation. It has geysers that eject nitrogen gas, indicating internal geological activity.', 7);
INSERT INTO public.moon VALUES (16, 'Nereid', 340, 1.12, 'Nereid is Neptune third-largest moon and has one of the most eccentric orbits of any moon in the Solar System. Its surface is likely composed of water ice mixed with some rock. Due to its distance and eccentric orbit, not much detailed information is available about Nereid.', 7);
INSERT INTO public.moon VALUES (17, 'Titania', 1578, 3.64, 'Titania is the largest moon of Uranus and has a surface composed mainly of water ice and rock. It features large canyons and fault valleys, indicating tectonic activity. The surface also has a mix of old, heavily cratered regions and younger, less cratered areas.', 8);
INSERT INTO public.moon VALUES (18, 'Oberon', 1523, 3.15, 'Oberon is the second-largest moon of Uranus. It has a heavily cratered icy surface with many large impact craters. Some of these craters have dark material on their floors, which could be the result of cryovolcanic processes.', 8);
INSERT INTO public.moon VALUES (19, 'Miranda', 472, 6.66, 'Miranda is known for its extreme geological features, including large canyons, cliffs, and a mix of old and young surfaces. Its unique terrain suggests that it has undergone intense geological activity in the past, possibly due to tidal heating from Uranus.', 8);
INSERT INTO public.moon VALUES (20, 'Charon', 1212, 0.21, 'Charon is the largest moon of Pluto and is nearly half the size of Pluto itself. It features a diverse landscape with canyons, mountains, and regions with different surface compositions. Charon and Pluto are tidally locked, always showing the same face to each other.', 9);
INSERT INTO public.moon VALUES (21, 'Nix', 50, 0.34, ' Nix is one of the smaller moons of Pluto, discovered along with Hydra in 2005. It has an irregular shape and orbits Pluto in a complex, chaotic pattern.', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 'Earth is the third planet from the Sun and the only known astronomical object to harbor life. It has a diverse range of ecosystems, from deep ocean trenches to high mountain peaks, supporting a wide variety of life forms. Earth atmosphere is composed primarily of nitrogen and oxygen, with traces of other gases. The presence of liquid water on its surface is a key factor in sustaining life. Earth has a single moon, known as Luna or simply "the Moon," and it experiences a dynamic climate system driven by the Sun energy. The planet biosphere has significantly alteredits atmosphere and other abiotic conditions, enabling the evolution of millions of species, including humans.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, 'Mars is the fourth planet from the Sun, often called the "Red Planet" due to its reddish appearance, which is the result of iron oxide (rust) on its surface. It has a thin atmosphere composed mostly of carbon dioxide, with traces of nitrogen and argon. Mars features the largest volcano in the Solar System, Olympus Mons, and a vast canyon system, Valles Marineris. The planet has polar ice caps that contain water and carbon dioxide. Mars is a prime candidate in the search for past life due to evidence of ancient river valleys and lake beds, indicating that liquid water once existed on its surface. The planet has two small moons, Phobos and Deimos.', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is primarily composed of hydrogen and helium, with a small rocky core. Jupiter is known for its prominent bands of clouds and the Great Red Spot, a massive storm system larger than Earth. The planet has a strong magnetic field and at least 79 moons, including the four large Galilean moons: Io, Europa, Ganymede, and Callisto. Europa, with its subsurface ocean, is of particular interest in the search for extraterrestrial life. Jupiter immense gravity also influences many of the objects in the Solar System.', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant', false, 'Saturn is the sixth planet from the Sun, distinguished by its extensive and complex ring system composed of ice and rock particles. It is the second-largest planet in the Solar System and, like Jupiter, is mainly made up of hydrogen and helium. Saturn has at least 83 moons, with Titan being the largest. Titan is notable for its thick atmosphere and surface lakes of liquid methane and ethane. Another moon, Enceladus, has geysers that emit water vapor and organic molecules, suggesting a subsurface ocean that could potentially harbor life.', 1);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Terrestrial', false, 'Mercury is the closest planet to the Sun, with a surface temperature that varies greatly due to its lack of atmosphere and proximity to the Sun. It is a rocky planet with extreme temperature variations between its day and night sides.', 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Terrestrial', false, 'Venus is the second planet from the Sun and is often referred to as Earth "sister planet" due to their similar size and composition. However, Venus has a thick atmosphere of carbon dioxide, making it extremely hot with surface temperatures high enough to melt lead. The extreme greenhouse effect on Venus makes it inhospitable to life as we know it.', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice giant', false, 'Neptune is the eighth and farthest known planet from the Sun in the Solar System. It is an ice giant, meaning it has a composition primarily of hydrogen, helium, and ices such as water, ammonia, and methane. The presence of methane gives Neptune its characteristic blue color. Neptune has a very dynamic atmosphere with the fastest winds in the Solar System, reaching speeds of up to 2,100 km/h (1,300 mph). The planet has a faint ring system and 14 known moons, with Triton being the largest. Triton has geysers that suggest subsurface activity, making it a subject of interest in the search for potential habitable environments.', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant', false, 'Uranus is the seventh planet from the Sun and is classified as an ice giant. It has a unique blue-green color due to the presence of methane in its atmosphere. Uranus is unique among the planets in that it rotates on its side, with an axial tilt of about 98 degrees. This extreme tilt causes unusual seasonal variations. The planet has a complex ring system and 27 known moons, with Titania being the largest. Uranus atmosphere is composed mainly of hydrogen and helium, with significant amounts of water, ammonia, and methane. The planet also has a relatively featureless appearance compared to Neptune.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet', false, 'Pluto is a dwarf planet located in the Kuiper Belt, a region of the Solar System beyond the orbit of Neptune. It was reclassified from a planet to a dwarf planet in 2006 by the International Astronomical Union. Pluto has a complex surface with mountains, plains, and possibly subsurface oceans. Its atmosphere is thin and primarily composed of nitrogen, with traces of methane and carbon monoxide. Pluto has five known moons, with Charon being the largest. Charon is so large relative to Pluto that they are often considered a binary system.', 1);
INSERT INTO public.planet VALUES (10, 'Upsilon Andromedae b', 'Gas Giant', false, 'Upsilon Andromedae b is a hot Jupiter located about 44 light-years away from Earth. It orbits very close to its parent star, Upsilon Andromedae, completing an orbit in just 4.6 days. Due to its proximity to the star, it has extremely high temperatures and no potential for life as we know it.', 2);
INSERT INTO public.planet VALUES (11, 'Upsilon Andromedae d', 'Gas Giant', false, 'Upsilon Andromedae d is another gas giant in the same system, orbiting farther from the star than Upsilon Andromedae b. It has an eccentric orbit, meaning its distance from the star varies significantly. This planet also does not have the conditions necessary for life.', 2);
INSERT INTO public.planet VALUES (12, 'Kepler-16b', 'Gas Giant', false, 'Kepler-16b orbits around two stars in a binary system, making it a circumbinary planet. This gas giant is located about 200 light-years from Earth and has a temperature that is too low to support life. Its orbit around two stars provides interesting dynamics for the planet seasons and climate.', 3);
INSERT INTO public.planet VALUES (13, 'Kepler-47c', 'Gas Giant', false, 'Kepler-47c is part of a multi-planet system orbiting a pair of stars. It is a gas giant with an orbit that places it in the habitable zone, but its gaseous composition makes it unlikely to support life. This planet demonstrates the diversity of exoplanetary systems.', 3);
INSERT INTO public.planet VALUES (14, 'PSR B1257+12 b (Draugr)', 'Pulsar Planet (Rocky)', false, 'Draugr orbits a pulsar, PSR B1257+12. It is one of the first exoplanets ever discovered and is extremely unlikely to support life due to the high levels of radiation emitted by the pulsar. It is a rocky planet with a mass less than that of the Moon.', 4);
INSERT INTO public.planet VALUES (15, 'PSR B1257+12 c (Poltergeist)', 'Pulsar Planet (Rocky)', false, 'Poltergeist is another rocky planet in the same system. Like Draugr, it is subject to intense radiation from the pulsar, making it an inhospitable environment for life. These planets are notable for being among the first detected exoplanets.', 4);
INSERT INTO public.planet VALUES (16, 'Vega b (Hypothetical)', 'Hypothetical Terrestrial Planet', NULL, 'A hypothetical terrestrial planet that could orbit Vega. Vega is a bright, young star located about 25 light-years from Earth. While no planets have been confirmed around Vega, its prominence in the sky makes it a target for future planet searches.', 5);
INSERT INTO public.planet VALUES (17, 'Vega c (Hypothetical)', 'Hypothetical Gas Giant', NULL, 'Another hypothetical planet, this time a gas giant. If such a planet exists, it would not support life due to its gaseous nature. Observations and missions aimed at Vega could potentially discover such planets in the future.', 5);
INSERT INTO public.planet VALUES (18, 'HIP 11952 b', 'Gas Giant', false, 'HIP 11952 b is a gas giant orbiting the ancient star HIP 11952, which is located about 375 light-years away. This planet has a short orbital period and is not in the habitable zone, thus it cannot support life.', 6);
INSERT INTO public.planet VALUES (19, 'HIP 11952 c', 'Gas Giant', false, 'Another gas giant in the same system, HIP 11952 c has a longer orbital period than HIP 11952 b. It is also inhospitable to life due to its gaseous composition and distance from the star.', 6);
INSERT INTO public.planet VALUES (20, 'Proxima Centauri b', 'Terrestrial', NULL, 'Proxima Centauri b is a terrestrial planet orbiting within the habitable zone of the star Proxima Centauri, which is the closest star to the Sun. This planet is a candidate for the potential existence of life due to its location in the habitable zone, though its actual habitability is still under study.', 7);
INSERT INTO public.planet VALUES (21, 'Proxima Centauri c', 'Super-Earth', false, 'Proxima Centauri c is a super-Earth orbiting farther out from Proxima Centauri. It is likely too cold to support life as we know it. Its large size and mass categorize it as a super-Earth, a class of exoplanets larger than Earth but smaller than Neptune.', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.00, 5778, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'B8IVp', 3.40, 13000, 2);
INSERT INTO public.star VALUES (3, 'M33-V1', 'Cepheid', 30.00, 6000, 3);
INSERT INTO public.star VALUES (4, 'R136a1', 'Wolf-Rayet', 35.40, 53000, 4);
INSERT INTO public.star VALUES (5, 'HD 109527', 'G8III', 10.40, 5000, 5);
INSERT INTO public.star VALUES (6, 'SN 1994I', 'Type Ic Supernova', NULL, 20000, 6);
INSERT INTO public.star VALUES (7, 'HD 104304', 'G8-K0', 1.70, 5100, 7);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
