-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para apirest
CREATE DATABASE IF NOT EXISTS `apirest` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `apirest`;

-- Volcando estructura para tabla apirest.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` mediumtext NOT NULL,
  `apellido` mediumtext NOT NULL,
  `email` text NOT NULL,
  `id_cliente` text NOT NULL,
  `llave_secreta` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla apirest.clientes: ~2 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `email`, `id_cliente`, `llave_secreta`, `created_at`, `updated_at`) VALUES
	(3, 'Maximo', 'Apaza', 'maximopeoficiales@gmail.com', 'a2ya10a5QmTE6B3nWZlgoGSpDKmDOrz6Dt21dD2akYICjiNFCrcCiDJ0kfcS', 'o2yo10oRGAYzQfeJnqLzJX0hozhHONxp/MgCmu43iMC4mzD5zdld2TCOba9i', '2020-08-18 15:10:55', '2020-08-18 15:10:55'),
	(4, 'Leonardo', 'Chicho', 'leonardo@gmail.com', 'a2ya10axbm90/vmlvr9cT05Aw4Z1eJxRRQUSwbCUkJIUtjpmLS.l9qLXnuie', 'o2yo10oQOHeFoP2vA0GtOtvx2P1/Ohh9hwiitcu8sywKYGk6OfKmkrECcJVa', '2020-08-18 20:54:38', '2020-08-18 20:54:38');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `instructor` text NOT NULL,
  `imagen` text NOT NULL,
  `precio` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla apirest.cursos: ~61 rows (aproximadamente)
DELETE FROM `cursos`;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `titulo`, `descripcion`, `instructor`, `imagen`, `precio`, `created_at`, `updated_at`, `id_cliente`) VALUES
	(1, 'Angular: De cero a experto creando aplicaciones (Angular 8+)', 'Todo lo que necesitas saber de angular utilizando TypeScript y buenas prácticas ofrecidas por el equipo de angular.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1075334_8b5f_4.jpg', 199.99, NULL, NULL, 3),
	(2, 'Desarrollo Web Completo con HTML5, CSS3, JS AJAX PHP y MySQL', 'Aprende Desarrollo Web con este curso 100% práctico, paso a paso y sin conocimientos previos, INCLUYE PROYECTO FINAL', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/980450_7fc0_3.jpg', 199.99, NULL, NULL, 3),
	(3, 'Programación de Android desde Cero +35 horas Curso COMPLETO', 'Aprender a programar aplicaciones y juegos para Android de forma profesional y desde cero.', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/957106_270f_6.jpg', 199.99, NULL, NULL, 3),
	(4, 'Universidad Java: De Cero a Master +82 hrs (JDK 13 update)!', 'El mejor curso para aprender Java, POO, JDBC, Servlets, JSPs, Java EE, Web Services, JSF, EJB, JPA, PrimeFaces y JAX-RS!', 'Global Mentoring', 'https://i.udemycdn.com/course/480x270/1265942_7e2f_9.jpg', 199.99, NULL, NULL, 3),
	(5, 'Curso Maestro de Python 3: Aprende Desde Cero', 'Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python', 'Héctor Costa Guzmán', 'https://i.udemycdn.com/course/480x270/882422_0549_9.jpg', 199.99, NULL, NULL, 3),
	(6, 'Master en JavaScript: Aprender JS, jQuery, Angular 8, NodeJS', 'Master en JavaScript: Aprender JS, jQuery, Angular 8, NodeJS', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1337000_0d99.jpg', 199.99, NULL, NULL, 3),
	(7, 'Master en Programación de Videojuegos con Unity® 2019 y C#', 'Aprende a programar videojuegos desde cero a nivel AVANZADO y profesional con Unity® 2019', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/371090_f92b_6.jpg', 199.99, NULL, NULL, 3),
	(8, 'Diseño Web Desde Cero a Avanzado 45h Curso COMPLETO', 'Aprende a Diseñar Páginas Web Responsive Design, atractivas, de forma profesional y sin dificultad con HTML5 y CSS3', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/809410_4666_6.jpg', 199.99, NULL, NULL, 3),
	(9, 'Diseño Web Profesional El Curso Completo, Práctico y desde 0', 'HTML5, CSS3, Responsive Design, Adobe XD, SASS, JavaScript, jQuery, Bootstrap 4, WordPress, Git, GitHub', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/782428_b5cf_4.jpg', 199.99, NULL, NULL, 3),
	(10, 'PHP 7 y MYSQL: El Curso Completo, Práctico y Desde Cero !', 'HTML5, CSS3, Responsive Design, Adobe XD, SASS, JavaScript, jQuery, Bootstrap 4, WordPress, Git, GitHub', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/672600_1def_7.jpg', 199.99, NULL, NULL, 3),
	(11, 'Curso de C++: Básico a Avanzado', 'Curso diseñado para principiantes o estudiantes universitarios sin conocimientos previos del lenguaje', 'Gianmarco Tantaruna', 'https://i.udemycdn.com/course/480x270/763172_d61c_4.jpg', 199.99, NULL, NULL, 3),
	(12, 'Node: De cero a experto', 'Curso diseñado para principiantes o estudiantes universitarios sin conocimientos previos del lenguaje', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1562070_d426.jpg', 199.99, NULL, NULL, 3),
	(13, 'Master en PHP, SQL, POO, MVC, Laravel, Symfony, WordPress +', 'Aprende PHP desde cero, bases de datos, SQL, MySQL, POO, MVC, Librerías, Laravel 5 y 6, Symfony 4 y 5, WordPress +56h', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1438222_0ec3_4.jpg', 199.99, NULL, NULL, 3),
	(14, 'Aprende Programación en C desde cero', 'Metodología, Algoritmos, Estructura de Datos y Organización de Archivos', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/728634_9428_7.jpg', 199.99, NULL, NULL, 3),
	(15, 'ionic 2 y ionic 3: Crea apps para Android e iOS desde cero.', 'Creemos apps para nuestros dispositivos móviles con el conocimiento que tenemos de Angular, HTML, CSS y JavaScript', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1145678_760a_6.jpg', 199.99, NULL, NULL, 3),
	(16, 'JavaScript: de cero hasta los detalles', 'En este poderoso lenguaje de programación web cada día más utilizado', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/751768_27d8.jpg', 199.99, NULL, NULL, 3),
	(17, 'Curso de Angular 8 - Desde cero hasta profesional', 'Aprende a desarrollar aplicaciones web modernas de forma práctica y desde cero con Angular 4, 5, 6, 7 y 8 (Angular 2+)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1156926_b2c4_6.jpg', 199.99, NULL, NULL, 3),
	(18, 'Curso completo de Machine Learning: Data Science en Python', 'Aprende los algoritmos de Machine Learning con Python para convertirte en un Data Science con todo el código para usar', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/1606018_069c.jpg', 199.99, NULL, NULL, 3),
	(19, 'Flutter: Tu guía completa de desarrollo para IOS y Android', 'Push, Cámara, Mapas, REST API, SQLite, CRUD, Tokens, Storage, Preferencias de usuario, PlayStore, AppStore, Bloc y más!', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/2306140_8181.jpg', 199.99, NULL, NULL, 3),
	(20, 'Angular Avanzado: Lleva tus bases al siguiente nivel - MEAN', 'MEAN, Google Signin, JWT, carga de archivos, lazyload, optimizaciones, Git, GitHub, panel administrativo y mucho más.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1420028_b32f.jpg', 199.99, NULL, NULL, 3),
	(21, 'React JS + Redux + ES6. Completo ¡De 0 a experto! (español)', 'El curso de React en español más elegido. Desarrollo en forma práctica, ejemplos, fundamentos y herramientas útiles', 'Ing. Emiliano Ocariz', 'https://i.udemycdn.com/course/480x270/1374394_f1a8_2.jpg', 199.99, NULL, NULL, 3),
	(22, 'Spring Framework 5: Creando webapp de cero a experto (2019)', 'Construye aplicaciones web reales con Spring Framework 5 & Spring Boot: Thymeleaf, JPA, Security, REST, Angular, WebFlux', 'Andrés José Guzmán', 'https://i.udemycdn.com/course/480x270/1388250_e9ac_6.jpg', 199.99, NULL, NULL, 3),
	(23, 'GIT+GitHub: Todo un sistema de control de versiones de cero', 'No vuelvas a perder tu trabajo por cualquier tipo de problema, aprende a trabajar de una forma segura y en equipo', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1235212_3204_2.jpg', 199.99, NULL, NULL, 3),
	(24, 'Curso de TypeScript - El lenguaje utilizado por Angular 2', 'Aprende JavaScript orientado a objetos con TypeScript el lenguaje usado en Angular 2 (nuevo y mejorado AngularJS)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/914024_9850.jpg', 199.99, NULL, NULL, 3),
	(25, 'Crea sistemas POS Inventarios y ventas con PHP 7 y AdminLTE', 'Aprende JavaScript orientado a objetos con TypeScript el lenguaje usado en Angular 2 (nuevo y mejorado AngularJS)', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/1467412_94b5_11.jpg', 199.99, NULL, NULL, 3),
	(26, 'Curso de Desarrollo Web Completo 2.0', '¡Aprende haciendo! HTML5, CSS3, Javascript, jQuery, Bootstrap 4, WordPress, PHP, MySQL, APIs, apps móviles y Python', 'Jose Luis Núñez Montes', 'https://i.udemycdn.com/course/480x270/834866_4564_2.jpg', 199.99, NULL, NULL, 3),
	(27, 'Aprende Programación C# con Visual Studio desde cero.', 'Aprende una sólida base de programación con Visual Studio, C# y el Framework .NET', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/797188_b203_5.jpg', 199.99, NULL, NULL, 3),
	(28, 'Bootstrap 4: El Curso Completo, Práctico y Desde Cero', 'Aprende a crear cualquier sitio web adaptable a dispositivos móviles con Boostrap 4, el mejor framework de diseño web', 'Carlos Arturo Esparza', 'https://i.udemycdn.com/course/480x270/1245130_efdb_5.jpg', 199.99, NULL, NULL, 3),
	(29, 'Desarrollo Web con Spring Boot - De Cero a Ninja', 'El curso definitivo de Spring Framework 4.3 desde cero: Spring Boot + Rest + MVC + Security + Data JPA + Thymeleaf', 'Miguel A. M.', 'https://i.udemycdn.com/course/480x270/984636_5a01_8.jpg', 199.99, NULL, NULL, 3),
	(30, 'iOS y Swift : Curso Completo de Cero a Profesional', 'Aprende a Desarrollar Apps Móviles para iPhone y iPad en Swift Desde Cero con el Mejor Curso de iOS y Swift en Español.', 'Juan Villalvazo', 'https://i.udemycdn.com/course/480x270/1242552_1235_4.jpg', 199.99, NULL, NULL, 3),
	(31, 'Crea sistemas Ecommerce con PHP 7 con pagos de PAYPAL y PAYU', 'Aprende a crear tu propio ecosistema de comercio electrónico con PHP 7 usando AdminLTE y recibe pagos con PAYPAL y PAYU', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/1322574_f1bd_10.jpg', 199.99, NULL, NULL, 3),
	(32, 'Fundamentos de Programación', 'Aprende las Bases de la Programación en 9 lenguajes a la vez: Java, Python, Go, C++, PHP, Ruby, C#, JavaScript y C', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/1192848_e63a.jpg', 199.99, NULL, NULL, 3),
	(33, 'ionic 5: Crear aplicaciones IOS, Android y PWAs con Angular', 'Google Play Store, Apple App Store, PWAs, Push Notifications, despliegues en la web, tabletas y mucho más', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/2088520_5480.jpg', 199.99, NULL, NULL, 3),
	(34, 'Curso Completo de iOS 10 y Swift 3: de Cero a Experto con JB', 'El Curso más actualizado de iOS 10 y Swift 3 en español. Desarrollo completo de apps móviles para iPhone y iPad en Swift', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/883176_ad3a_4.jpg', 199.99, NULL, NULL, 3),
	(35, 'Desarrollo de sistemas web en PHP 7 POO, MySQL, Jquery Ajax', 'Diseña sistemas web en PHP Orientado Objetos, MariaDB (MySql), Jquery Ajax, HTML5 CSS3 Bootstrap INCLUYE PROYECTO FINAL', 'Juan Carlos Arcila Díaz', 'https://i.udemycdn.com/course/480x270/1149390_0753_5.jpg', 199.99, NULL, NULL, 3),
	(36, 'Desarrollo web con JavaScript, Angular, NodeJS y MongoDB', 'Aprende a desarrollar una webapp como Spotify usando el MEAN Stack (Node, MongoDB, Express, JWT y Angular 4, 5, 6, 7, 8)', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/1023976_d8a0_9.jpg', 199.99, NULL, NULL, 3),
	(37, 'Dominando Laravel - De principiante a experto', 'Aprende a crear aplicaciones robustas y escalables con el framework más popular de PHP, Laravel', 'Jorge García', 'https://i.udemycdn.com/course/480x270/1126742_f0d3_3.jpg', 199.99, NULL, NULL, 3),
	(38, 'Aprender a programar con Java. De cero hasta hacer sistemas', '¡Ahora con JavaFX! Aprende conceptos básicos de programación hasta el desarrollo de un sistema completo con Java.', 'Javier Arturo Vázquez Olivares', 'https://i.udemycdn.com/course/480x270/908106_359a_2.jpg', 199.99, NULL, NULL, 3),
	(39, 'Java y BlueJ | Introducción a las Bases de la Programación', 'Curso Básico introductorio del lenguaje Java para personas que no saben programar aún.', 'Javier Arturo Vázquez Olivares', 'https://i.udemycdn.com/course/480x270/948840_f991.jpg', 199.99, NULL, NULL, 3),
	(40, 'Crea tu Tienda Online Sin Inventario y Aprende Dropshipping', 'Aprende Dropshipping, Crea tu Tienda Online, Lanzate al mercado y obtén tus primeras ventas sin Comprar inventario!', 'Rodrigo Martinez Blanco', 'https://i.udemycdn.com/course/480x270/546338_4f43_3.jpg', 199.99, NULL, NULL, 3),
	(41, 'Aprende Programación en C++ (Básico - Intermedio - Avanzado)', 'Si eres un apasionado de la programación, este curso te interesa. aprenderás desde las bases hasta lo avanzado en C++', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/484388_ab1c_2.jpg', 199.99, NULL, NULL, 3),
	(42, 'Curso Completo de Desarrollo ASP.NET MVC', 'Crea aplicaciones web fácilmente con .Net Framework', 'Ángel Arias', 'https://i.udemycdn.com/course/480x270/1209326_ca41_6.jpg', 199.99, NULL, NULL, 3),
	(43, 'Git y GitHub Completo Desde Cero', 'Aprende Git y GitHub de forma completa y desde cero. Con ejemplos prácticos. Sé un profesional del control de versiones.', 'Jose Javier Villena', 'https://i.udemycdn.com/course/480x270/940740_4db9_4.jpg', 199.99, NULL, NULL, 3),
	(44, 'Curso Completo Python 3 - Desde las Bases hasta Django', 'Django,Flask,Bases del lenguaje, Programación Orientada a Objetos, Lectura y Escritura de Archivos y Bases de Datos', 'Aldo Olivares', 'https://i.udemycdn.com/course/480x270/1114896_e264_3.jpg', 199.99, NULL, NULL, 3),
	(45, 'React - La Guía Completa - Hooks Redux Context +15 Proyectos', 'Incluye React Hooks, Cloud Firestore, Redux, React Router, NextJS, Axios, REST API\'s, Seguridad, Autenticación y CRUDS!', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/1756340_0543_4.jpg', 199.99, NULL, NULL, 3),
	(46, 'Curso completo de Machine Learning: Data Science con Rstudio', 'Aprende a analizar datos estadísticos con los trucos de Juan Gabriel Gomila, prof. de Universidad de las Islas Baleares', 'Juan Gabriel Gomila Salas', 'https://i.udemycdn.com/course/480x270/1483710_7395_2.jpg', 199.99, NULL, NULL, 3),
	(47, 'Desarrollo Profesional de Temas y Plugins de WordPress', 'Aprende a crear Temas, Plugins y Bloques de Gutenberg con este curso práctico CREA SITIOS 100% DINAMICOS en WordPress', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/378726_c37d_5.jpg', 199.99, NULL, NULL, 3),
	(48, 'Máster en PHP 7+, POO, MVC, MySQL, Laravel 6+, CodeIgniter 4', '¡Aprende PHP y MySQL desde cero y crea tu propio CMS y API REST, usando los Framework de Laravel 6+ y CodeIgniter 4!', 'Juan Fernando Urrego', 'https://i.udemycdn.com/course/480x270/970528_f38a_3.jpg', 199.99, NULL, NULL, 3),
	(49, 'Desarrollo de Aplicaciones móviles Android con App Inventor', '¡Crea increíbles aplicaciones móviles para Android sin programar utilizando App Inventor! 33 apps paso a paso', 'Jose Luis Núñez Montes', 'https://i.udemycdn.com/course/480x270/486808_1e8f_2.jpg', 199.99, NULL, NULL, 3),
	(50, 'SQL. Curso completo de SQL. Aprende desde cero.', 'Aprende SQL desde cero para saber manejar cualquier base de datos', 'Redait Media', 'https://i.udemycdn.com/course/480x270/2137076_bbdf_4.jpg', 199.99, NULL, NULL, 3),
	(51, 'AngularJS - Desde Hola Mundo hasta una Aplicación', 'Aprende como crear aplicaciones web con esta increíble herramienta de desarrollo potenciada por Google, AngularJS.', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/467470_b749_3.jpg', 199.99, NULL, NULL, 3),
	(52, 'Aprende Programación en Java (de Básico a Avanzado)', 'En este curso Aprenderás a programar en el lenguaje de programación Java, con un curso 30% teórico, 70% practico.', 'Alejandro Miguel Taboada Sanchez', 'https://i.udemycdn.com/course/480x270/802946_e81d.jpg', 199.99, NULL, NULL, 3),
	(53, 'Curso Práctico de Django: Aprende Creando 3 Webs', 'Curso Práctico de Django: Aprende Creando 3 Webs', 'Héctor Costa Guzmán', 'https://i.udemycdn.com/course/480x270/1444542_d3b8_3.jpg', 199.99, NULL, NULL, 3),
	(54, 'Master Unreal Engine 4 Desarrollo Videojuegos con Blueprints', 'Aprende a crear Videojuegos AAA DESDE CERO, desarrollo y programación completo con Blueprints y Unreal Engine 4', 'Mariano Rivas', 'https://i.udemycdn.com/course/480x270/1223302_ae33.jpg', 199.99, NULL, NULL, 3),
	(55, 'Curso de Angular 2 en Español - Crea webapps desde cero', 'Aprende a desarrollar aplicaciones web modernas de forma práctica y desde cero con Angular 2, el sucesor de AngularJS', 'Víctor Robles', 'https://i.udemycdn.com/course/480x270/707908_13d1_3.jpg', 199.99, NULL, NULL, 3),
	(56, 'Crea sistemas web ASP. Net Core 3.0 MVC, Entity Framework', 'Diseña aplicaciones web en ASP. Net Core 3 MVC y Entity Framework Core, utilizando jquery, AJAX - INCLUYE PROYECTO FINAL', 'Juan Carlos Arcila Díaz', 'https://i.udemycdn.com/course/480x270/1319300_052f_4.jpg', 199.99, NULL, NULL, 3),
	(57, 'JavaScript Moderno Guía Definitiva Construye +15 Proyectos', 'Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express', 'Juan Pablo De la torre Valdez', 'https://i.udemycdn.com/course/480x270/1509816_dff8.jpg', 199.99, NULL, NULL, 3),
	(58, 'Angular: El mejor curso de Angular. De Cero a Experto!', 'Domina Angular 2 (Angular 8) y crea aplicaciones web del mundo real con TypeScript, Firebase, Cloud Firestore, JWT y más', 'Global Mentoring', 'https://i.udemycdn.com/course/480x270/2105384_9a0f_8.jpg', 199.99, NULL, NULL, 3),
	(59, 'PWA - Aplicaciones Web Progresivas: De cero a experto', 'Notificaciones PUSH, sincronización sin conexión, modos offline, instalaciones, indexedDB, push server, share y más', 'Fernando Herrera', 'https://i.udemycdn.com/course/480x270/1894936_31a7.jpg', 199.99, NULL, NULL, 3),
	(60, 'Aprende a crear tu primer sitio web con Laravel 5.4', 'Curso introductorio a Laravel PHP', 'Jorge García', 'https://i.udemycdn.com/course/480x270/1104380_304c_5.jpg', 199.99, NULL, NULL, 3),
	(62, '1WordPress Avanzado Bloques Gutenberg Post Types y Taxonomías', '1¿Estás listo para sacar el máximo provecho a WordPress? Crea 7 Plugins de WordPress en este curso 100% práctico', 'Juan Pablo De la torre Valdez4', 'https://tutorialesatualcance.com/img/portadas/api-restful.jpg', 23, '2020-08-18 17:14:29', '2020-08-18 20:04:41', 3);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
