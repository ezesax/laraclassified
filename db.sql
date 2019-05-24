-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-04-2019 a las 19:15:41
-- Versión del servidor: 5.7.16-log
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `divisas`
--

DELIMITER $$
--
-- Estructura de tabla para la tabla `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_code_large` text COLLATE utf8_unicode_ci,
  `tracking_code_medium` text COLLATE utf8_unicode_ci,
  `tracking_code_small` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `advertising`
--

INSERT INTO `advertising` (`id`, `slug`, `provider_name`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'top', 'Advert Code', '', '', '', 0),
(2, 'bottom', 'Advert Code', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `active`) VALUES
(77, 'en', 230, 75, 'Escorts - Adult Services', 'escorts-adult-services', NULL, NULL, NULL, 303, 304, 2, NULL, 1),
(78, 'en', 231, 75, 'Women Seeking Women', 'women-seeking-women', NULL, NULL, NULL, 299, 300, 2, NULL, 1),
(79, 'en', 232, 75, 'Women Seeking Men', 'women-seeking-men', NULL, NULL, NULL, 301, 302, 2, NULL, 1),
(80, 'en', 233, 75, 'Men Seeking Women', 'men-seeking-women', NULL, NULL, NULL, 289, 290, 2, NULL, 1),
(81, 'en', 234, 75, 'Men Seeking Men', 'men-seeking-men', NULL, NULL, NULL, 291, 292, 2, NULL, 1),
(82, 'en', 235, 75, 'Massage Services - Relaxation', 'massage-services-relaxation', NULL, NULL, NULL, 293, 294, 2, NULL, 1),
(83, 'en', 236, 75, 'Adults Products - Articles', 'adults-products-articles', NULL, NULL, NULL, 295, 296, 2, NULL, 1),
(84, 'en', 237, 75, 'Casual Encounter', 'casual-encounter', NULL, NULL, NULL, 297, 298, 2, NULL, 1),
(86, 'en', 239, 85, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 197, 198, 2, NULL, 1),
(87, 'en', 240, 85, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 195, 196, 2, NULL, 1),
(88, 'en', 241, 85, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 191, 192, 2, NULL, 1),
(89, 'en', 242, 85, 'Others Jobs Offer', 'others-jobs-offer', NULL, NULL, NULL, 189, 190, 2, NULL, 1),
(90, 'en', 243, 85, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 187, 188, 2, NULL, 1),
(91, 'en', 244, 85, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 185, 186, 2, NULL, 1),
(92, 'en', 245, 85, 'Commercial - Sale Jobs Offer', 'commercial-sale-jobs-offer', NULL, NULL, NULL, 183, 184, 2, NULL, 1),
(93, 'en', 246, 85, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 181, 182, 2, NULL, 1),
(94, 'en', 247, 85, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 221, 222, 2, NULL, 1),
(95, 'en', 248, 85, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 193, 194, 2, NULL, 1),
(96, 'en', 249, 85, 'Public Service Jobs Offer', 'public-service-jobs-offer', NULL, NULL, NULL, 179, 180, 2, NULL, 1),
(97, 'en', 250, 85, 'Real Estate Jobs Offer', 'real-estate-jobs-offer', NULL, NULL, NULL, 207, 208, 2, NULL, 1),
(98, 'en', 251, 85, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 199, 200, 2, NULL, 1),
(99, 'en', 252, 85, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 201, 202, 2, NULL, 1),
(100, 'en', 253, 85, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 219, 220, 2, NULL, 1),
(101, 'en', 254, 85, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 217, 218, 2, NULL, 1),
(102, 'en', 255, 85, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 215, 216, 2, NULL, 1),
(103, 'en', 256, 85, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 213, 214, 2, NULL, 1),
(104, 'en', 257, 85, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 211, 212, 2, NULL, 1),
(105, 'en', 258, 85, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 177, 178, 2, NULL, 1),
(106, 'en', 259, 85, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 209, 210, 2, NULL, 1),
(107, 'en', 260, 85, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 205, 206, 2, NULL, 1),
(108, 'en', 261, 85, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 203, 204, 2, NULL, 1),
(110, 'en', 263, 109, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 129, 130, 2, NULL, 1),
(111, 'en', 264, 109, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 153, 154, 2, NULL, 1),
(112, 'en', 265, 109, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 171, 172, 2, NULL, 1),
(113, 'en', 266, 109, 'Others Jobs Search', 'others-jobs-search', NULL, NULL, NULL, 169, 170, 2, NULL, 1),
(114, 'en', 267, 109, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 165, 166, 2, NULL, 1),
(115, 'en', 268, 109, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 167, 168, 2, NULL, 1),
(116, 'en', 269, 109, 'Commercial - Sale Jobs Search', 'commercial-sale-jobs-search', NULL, NULL, NULL, 163, 164, 2, NULL, 1),
(117, 'en', 270, 109, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 161, 162, 2, NULL, 1),
(118, 'en', 271, 109, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 157, 158, 2, NULL, 1),
(119, 'en', 272, 109, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 155, 156, 2, NULL, 1),
(120, 'en', 273, 109, 'Public Service Jobs Search', 'public-service-jobs-search', NULL, NULL, NULL, 151, 152, 2, NULL, 1),
(121, 'en', 274, 109, 'Real Estate Jobs Search', 'real-estate-jobs-search', NULL, NULL, NULL, 131, 132, 2, NULL, 1),
(122, 'en', 275, 109, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 149, 150, 2, NULL, 1),
(123, 'en', 276, 109, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 147, 148, 2, NULL, 1),
(124, 'en', 277, 109, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 145, 146, 2, NULL, 1),
(125, 'en', 278, 109, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 159, 160, 2, NULL, 1),
(126, 'en', 279, 109, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 143, 144, 2, NULL, 1),
(127, 'en', 280, 109, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 141, 142, 2, NULL, 1),
(128, 'en', 281, 109, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 139, 140, 2, NULL, 1),
(129, 'en', 282, 109, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 137, 138, 2, NULL, 1),
(130, 'en', 283, 109, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 135, 136, 2, NULL, 1),
(131, 'en', 284, 109, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 133, 134, 2, NULL, 1),
(132, 'en', 285, 109, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 173, 174, 2, NULL, 1),
(134, 'en', 287, 133, 'Language Classes', 'language-classes', NULL, NULL, NULL, 263, 264, 2, NULL, 1),
(135, 'en', 288, 133, 'Computer Courses', 'computer-courses', NULL, NULL, NULL, 261, 262, 2, NULL, 1),
(136, 'en', 289, 133, 'Tutoring, Private Lessons', 'tutoring-private-lessons', NULL, NULL, NULL, 257, 258, 2, NULL, 1),
(137, 'en', 290, 133, 'Vocational Training', 'vocational-training', NULL, NULL, NULL, 259, 260, 2, NULL, 1),
(138, 'en', 291, 133, 'Maths, Physics, Chemistry', 'maths-physics-chemistry', NULL, NULL, NULL, 251, 252, 2, NULL, 1),
(139, 'en', 292, 133, 'Music, Theatre, Dance', 'music-theatre-dance', NULL, NULL, NULL, 253, 254, 2, NULL, 1),
(140, 'en', 293, 133, 'School support', 'school-support', NULL, NULL, NULL, 255, 256, 2, NULL, 1),
(142, 'en', 295, 141, 'Concerts & Festivals', 'concerts-festivals', NULL, NULL, NULL, 227, 228, 2, NULL, 1),
(143, 'en', 296, 141, 'Networking & Meetups', 'networking-meetups', NULL, NULL, NULL, 229, 230, 2, NULL, 1),
(144, 'en', 297, 141, 'Sports & Outdoors', 'sports-outdoors', NULL, NULL, NULL, 225, 226, 2, NULL, 1),
(145, 'en', 298, 141, 'Trade Shows & Conventions', 'trade-shows-conventions', NULL, NULL, NULL, 231, 232, 2, NULL, 1),
(146, 'en', 299, 141, 'Training & Seminars', 'training-seminars', NULL, NULL, NULL, 233, 234, 2, NULL, 1),
(147, 'en', 300, 141, 'Ceremonies', 'ceremonies', NULL, NULL, NULL, 235, 236, 2, NULL, 1),
(148, 'en', 301, 141, 'Conferences', 'conferences', NULL, NULL, NULL, 237, 238, 2, NULL, 1),
(149, 'en', 302, 141, 'Weddings', 'weddings', NULL, NULL, NULL, 239, 240, 2, NULL, 1),
(150, 'en', 303, 141, 'Birthdays', 'birthdays', NULL, NULL, NULL, 241, 242, 2, NULL, 1),
(151, 'en', 304, 141, 'Family Events', 'family-events', NULL, NULL, NULL, 243, 244, 2, NULL, 1),
(152, 'en', 305, 141, 'Nightlife', 'nightlife', NULL, NULL, NULL, 245, 246, 2, NULL, 1),
(153, 'en', 306, 141, 'All others events', 'all-others-events', NULL, NULL, NULL, 247, 248, 2, NULL, 1),
(155, 'es', 155, 1, 'Auto Parts, Accessories', 'auto-parts-accessories-es', NULL, NULL, NULL, 29, 30, 2, NULL, 1),
(156, 'es', 156, 1, 'Car, Motorcycle Rental', 'car-motorcycle-rental-es', NULL, NULL, NULL, 27, 28, 2, NULL, 1),
(157, 'es', 157, 1, 'Caravan and Boating', 'caravan-and-boating-es', NULL, NULL, NULL, 31, 32, 2, NULL, 1),
(158, 'es', 158, 1, 'Motorcycle parts, Accessories', 'motorcycle-parts-accessories-es', NULL, NULL, NULL, 33, 34, 2, NULL, 1),
(159, 'es', 159, 1, 'Motorcycles, Scooters, Quads', 'motorcycles-scooters-quads-es', NULL, NULL, NULL, 35, 36, 2, NULL, 1),
(160, 'es', 160, 1, 'Used Cars - New Cars', 'used-cars-new-cars-es', NULL, NULL, NULL, 37, 38, 2, NULL, 1),
(161, 'es', 161, 1, 'Utility Vehicles, Machinery', 'utility-vehicles-machinery-es', NULL, NULL, NULL, 39, 40, 2, NULL, 1),
(163, 'es', 163, 9, 'Commercial Property - Offices - Premises', 'commercial-property-offices-premises-es', NULL, NULL, NULL, 47, 48, 2, NULL, 1),
(164, 'es', 164, 9, 'I\'m looking for', 'im-looking-for-es', NULL, NULL, NULL, 51, 52, 2, NULL, 1),
(165, 'es', 165, 9, 'Roomates', 'roomates-es', NULL, NULL, NULL, 53, 54, 2, NULL, 1),
(166, 'es', 166, 9, 'Accommodation and Hotels', 'accommodation-and-hotels-es', NULL, NULL, NULL, 55, 56, 2, NULL, 1),
(167, 'es', 167, 9, 'Vacation Rental', 'vacation-rental-es', NULL, NULL, NULL, 57, 58, 2, NULL, 1),
(168, 'es', 168, 9, 'Garage, Parking, Farms', 'garage-parking-farms-es', NULL, NULL, NULL, 59, 60, 2, NULL, 1),
(169, 'es', 169, 9, 'Real Estate Services', 'real-estate-services-es', NULL, NULL, NULL, 61, 62, 2, NULL, 1),
(170, 'es', 170, 9, 'Rooms - Studio for Rent', 'rooms-studio-for-rent-es', NULL, NULL, NULL, 63, 64, 2, NULL, 1),
(171, 'es', 171, 9, 'Land for Sale, Rent', 'land-for-sale-rent-es', NULL, NULL, NULL, 49, 50, 2, NULL, 1),
(172, 'es', 172, 9, 'Property for sale', 'property-for-sale-es', NULL, NULL, NULL, 45, 46, 2, NULL, 1),
(173, 'es', 173, 9, 'Rentals', 'rentals-es', NULL, NULL, NULL, 43, 44, 2, NULL, 1),
(175, 'es', 175, 21, 'Other services', 'other-services-es', NULL, NULL, NULL, 111, 112, 2, NULL, 1),
(176, 'es', 176, 21, 'Casting, Model, Photographer', 'casting-model-photographer-es', NULL, NULL, NULL, 123, 124, 2, NULL, 1),
(177, 'es', 177, 21, 'Carpooling', 'carpooling-es', NULL, NULL, NULL, 121, 122, 2, NULL, 1),
(178, 'es', 178, 21, 'Moving, Furniture Guard', 'moving-furniture-guard-es', NULL, NULL, NULL, 119, 120, 2, NULL, 1),
(179, 'es', 179, 21, 'Destocking - Commercial', 'destocking-commercial-es', NULL, NULL, NULL, 117, 118, 2, NULL, 1),
(180, 'es', 180, 21, 'Industrial Equipment', 'industrial-equipment-es', NULL, NULL, NULL, 115, 116, 2, NULL, 1),
(181, 'es', 181, 21, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling-es', NULL, NULL, NULL, 93, 94, 2, NULL, 1),
(182, 'es', 182, 21, 'Horoscope - Tarot - Healers - Spell', 'horoscope-tarot-healers-spell-es', NULL, NULL, NULL, 113, 114, 2, NULL, 1),
(183, 'es', 183, 21, 'Materials and Equipment Pro', 'materials-and-equipment-pro-es', NULL, NULL, NULL, 109, 110, 2, NULL, 1),
(184, 'es', 184, 21, 'Event Organization Services', 'event-organization-services-es', NULL, NULL, NULL, 95, 96, 2, NULL, 1),
(185, 'es', 185, 21, 'Service Provision', 'service-provision-es', NULL, NULL, NULL, 107, 108, 2, NULL, 1),
(186, 'es', 186, 21, 'Health, Beauty', 'health-beauty-es', NULL, NULL, NULL, 105, 106, 2, NULL, 1),
(187, 'es', 187, 21, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman-es', NULL, NULL, NULL, 103, 104, 2, NULL, 1),
(188, 'es', 188, 21, 'Computing Services', 'computing-services-es', NULL, NULL, NULL, 101, 102, 2, NULL, 1),
(189, 'es', 189, 21, 'Tourism and Travel Services', 'tourism-and-travel-services-es', NULL, NULL, NULL, 99, 100, 2, NULL, 1),
(190, 'es', 190, 21, 'Translation, Writing', 'translation-writing-es', NULL, NULL, NULL, 125, 126, 2, NULL, 1),
(191, 'es', 191, 21, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry-es', NULL, NULL, NULL, 97, 98, 2, NULL, 1),
(193, 'es', 193, 39, 'Sporting goods, Exercise', 'sporting-goods-exercise-es', NULL, NULL, NULL, 267, 268, 2, NULL, 1),
(194, 'es', 194, 39, 'Artists, Musicians', 'artists-musicians-es', NULL, NULL, NULL, 269, 270, 2, NULL, 1),
(195, 'es', 195, 39, 'Associations, Voluntary', 'associations-voluntary-es', NULL, NULL, NULL, 271, 272, 2, NULL, 1),
(196, 'es', 196, 39, 'Friendships for Events', 'friendships-for-events-es', NULL, NULL, NULL, 273, 274, 2, NULL, 1),
(197, 'es', 197, 39, 'My neighborhood', 'my-neighborhood-es', NULL, NULL, NULL, 275, 276, 2, NULL, 1),
(198, 'es', 198, 39, 'Nightlife, Restaurant & Bar', 'nightlife-restaurant-bar-es', NULL, NULL, NULL, 277, 278, 2, NULL, 1),
(199, 'es', 199, 39, 'Outings, Entertainment', 'outings-entertainment-es', NULL, NULL, NULL, 279, 280, 2, NULL, 1),
(201, 'es', 201, 47, 'Multimedia & Phones Accessories', 'multimedia-phones-accessories-es', NULL, NULL, NULL, 5, 6, 2, NULL, 1),
(202, 'es', 202, 47, 'CD/DVD - Books - Movies', 'cddvd-books-movies-es', NULL, NULL, NULL, 7, 8, 2, NULL, 1),
(203, 'es', 203, 47, 'Consoles - Video Games', 'consoles-video-games-es', NULL, NULL, NULL, 11, 12, 2, NULL, 1),
(204, 'es', 204, 47, 'Computers - PC - Office Supplies', 'computers-pc-office-supplies-es', NULL, NULL, NULL, 13, 14, 2, NULL, 1),
(205, 'es', 205, 47, 'Wanted', 'wanted-es', NULL, NULL, NULL, 15, 16, 2, NULL, 1),
(206, 'es', 206, 47, 'Tablets - Touchscreens', 'tablets-touchscreens-es', NULL, NULL, NULL, 17, 18, 2, NULL, 1),
(207, 'es', 207, 47, 'Mobiles phones - Smartphones', 'mobiles-phones-smartphones-es', NULL, NULL, NULL, 19, 20, 2, NULL, 1),
(208, 'es', 208, 47, 'TV - Images - Sound', 'tv-images-sound-es', NULL, NULL, NULL, 21, 22, 2, NULL, 1),
(209, 'es', 209, 47, 'Clearance - Commercial', 'clearance-commercial-es', NULL, NULL, NULL, 23, 24, 2, NULL, 1),
(210, 'es', 210, 47, 'Industrial Equipment', 'industrial-equipment-es', NULL, NULL, NULL, 9, 10, 2, NULL, 1),
(211, 'es', 211, 47, 'Materials & Professional equipment', 'materials-professional-equipment-es', NULL, NULL, NULL, 3, 4, 2, NULL, 1),
(213, 'es', 213, 59, 'Furniture - Tableware', 'furniture-tableware-es', NULL, NULL, NULL, 89, 90, 2, NULL, 1),
(214, 'es', 214, 59, 'Antiques - Art - Decoration', 'antiques-art-decoration-es', NULL, NULL, NULL, 69, 70, 2, NULL, 1),
(215, 'es', 215, 59, 'Appliances', 'appliances-es', NULL, NULL, NULL, 71, 72, 2, NULL, 1),
(216, 'es', 216, 59, 'Jewelry - Watches - Luggage', 'jewelry-watches-luggage-es', NULL, NULL, NULL, 73, 74, 2, NULL, 1),
(217, 'es', 217, 59, 'DIY - Gardening', 'diy-gardening-es', NULL, NULL, NULL, 75, 76, 2, NULL, 1),
(218, 'es', 218, 59, 'Various flea markets', 'various-flea-markets-es', NULL, NULL, NULL, 77, 78, 2, NULL, 1),
(219, 'es', 219, 59, 'Shoes', 'shoes-es', NULL, NULL, NULL, 79, 80, 2, NULL, 1),
(220, 'es', 220, 59, 'Toys - Games - Figurines', 'toys-games-figurines-es', NULL, NULL, NULL, 67, 68, 2, NULL, 1),
(221, 'es', 221, 59, 'Clothing, Fashion & Accessories', 'clothing-fashion-accessories-es', NULL, NULL, NULL, 81, 82, 2, NULL, 1),
(222, 'es', 222, 59, 'Stuffs for Baby and Child', 'stuffs-for-baby-and-child-es', NULL, NULL, NULL, 83, 84, 2, NULL, 1),
(223, 'es', 223, 59, 'Stuffs for Beauty and Health', 'stuffs-for-beauty-and-health-es', NULL, NULL, NULL, 85, 86, 2, NULL, 1),
(224, 'es', 224, 59, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes-es', NULL, NULL, NULL, 87, 88, 2, NULL, 1),
(226, 'es', 226, 72, 'Accessories - Other Pets services', 'accessories-other-pets-services-es', NULL, NULL, NULL, 283, 284, 2, NULL, 1),
(227, 'es', 227, 72, 'Sales, Adoptions, Lost', 'sales-adoptions-lost-es', NULL, NULL, NULL, 285, 286, 2, NULL, 1),
(229, 'es', 229, 75, 'Friendship - Friends', 'friendship-friends-es', NULL, NULL, NULL, 305, 306, 2, NULL, 1),
(230, 'es', 230, 75, 'Escorts - Adult Services', 'escorts-adult-services-es', NULL, NULL, NULL, 303, 304, 2, NULL, 1),
(231, 'es', 231, 75, 'Women Seeking Women', 'women-seeking-women-es', NULL, NULL, NULL, 299, 300, 2, NULL, 1),
(232, 'es', 232, 75, 'Women Seeking Men', 'women-seeking-men-es', NULL, NULL, NULL, 301, 302, 2, NULL, 1),
(233, 'es', 233, 75, 'Men Seeking Women', 'men-seeking-women-es', NULL, NULL, NULL, 289, 290, 2, NULL, 1),
(234, 'es', 234, 75, 'Men Seeking Men', 'men-seeking-men-es', NULL, NULL, NULL, 291, 292, 2, NULL, 1),
(235, 'es', 235, 75, 'Massage Services - Relaxation', 'massage-services-relaxation-es', NULL, NULL, NULL, 293, 294, 2, NULL, 1),
(236, 'es', 236, 75, 'Adults Products - Articles', 'adults-products-articles-es', NULL, NULL, NULL, 295, 296, 2, NULL, 1),
(237, 'es', 237, 75, 'Casual Encounter', 'casual-encounter-es', NULL, NULL, NULL, 297, 298, 2, NULL, 1),
(239, 'es', 239, 85, 'Agriculture - Environment', 'agriculture-environment-es', NULL, NULL, NULL, 197, 198, 2, NULL, 1),
(240, 'es', 240, 85, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk-es', NULL, NULL, NULL, 195, 196, 2, NULL, 1),
(241, 'es', 241, 85, 'Automotive - Mechanic', 'automotive-mechanic-es', NULL, NULL, NULL, 191, 192, 2, NULL, 1),
(242, 'es', 242, 85, 'Others Jobs Offer', 'others-jobs-offer-es', NULL, NULL, NULL, 189, 190, 2, NULL, 1),
(243, 'es', 243, 85, 'BTP - Construction - Building', 'btp-construction-building-es', NULL, NULL, NULL, 187, 188, 2, NULL, 1),
(244, 'es', 244, 85, 'Trade - Business Services', 'trade-business-services-es', NULL, NULL, NULL, 185, 186, 2, NULL, 1),
(245, 'es', 245, 85, 'Commercial - Sale Jobs Offer', 'commercial-sale-jobs-offer-es', NULL, NULL, NULL, 183, 184, 2, NULL, 1),
(246, 'es', 246, 85, 'Accounting - Management - Finance', 'accounting-management-finance-es', NULL, NULL, NULL, 181, 182, 2, NULL, 1),
(247, 'es', 247, 85, 'Steering - Manager', 'steering-manager-es', NULL, NULL, NULL, 221, 222, 2, NULL, 1),
(248, 'es', 248, 85, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty-es', NULL, NULL, NULL, 193, 194, 2, NULL, 1),
(249, 'es', 249, 85, 'Public Service Jobs Offer', 'public-service-jobs-offer-es', NULL, NULL, NULL, 179, 180, 2, NULL, 1),
(250, 'es', 250, 85, 'Real Estate Jobs Offer', 'real-estate-jobs-offer-es', NULL, NULL, NULL, 207, 208, 2, NULL, 1),
(251, 'es', 251, 85, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting-es', NULL, NULL, NULL, 199, 200, 2, NULL, 1),
(252, 'es', 252, 85, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications-es', NULL, NULL, NULL, 201, 202, 2, NULL, 1),
(253, 'es', 253, 85, 'Industry, Production & engineering', 'industry-production-engineering-es', NULL, NULL, NULL, 219, 220, 2, NULL, 1),
(254, 'es', 254, 85, 'Marketing - Communication', 'marketing-communication-es', NULL, NULL, NULL, 217, 218, 2, NULL, 1),
(255, 'es', 255, 85, 'Babysitting - Nanny Work', 'babysitting-nanny-work-es', NULL, NULL, NULL, 215, 216, 2, NULL, 1),
(256, 'es', 256, 85, 'HR - Training - Education', 'hr-training-education-es', NULL, NULL, NULL, 213, 214, 2, NULL, 1),
(257, 'es', 257, 85, 'Medical - Healthcare - Social', 'medical-healthcare-social-es', NULL, NULL, NULL, 211, 212, 2, NULL, 1),
(258, 'es', 258, 85, 'Security - Guarding', 'security-guarding-es', NULL, NULL, NULL, 177, 178, 2, NULL, 1),
(259, 'es', 259, 85, 'Household Services - Housekeeping', 'household-services-housekeeping-es', NULL, NULL, NULL, 209, 210, 2, NULL, 1),
(260, 'es', 260, 85, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure-es', NULL, NULL, NULL, 205, 206, 2, NULL, 1),
(261, 'es', 261, 85, 'Transportation - Logistics', 'transportation-logistics-es', NULL, NULL, NULL, 203, 204, 2, NULL, 1),
(263, 'es', 263, 109, 'Agriculture - Environment', 'agriculture-environment-es', NULL, NULL, NULL, 129, 130, 2, NULL, 1),
(264, 'es', 264, 109, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk-es', NULL, NULL, NULL, 153, 154, 2, NULL, 1),
(265, 'es', 265, 109, 'Automotive - Mechanic', 'automotive-mechanic-es', NULL, NULL, NULL, 171, 172, 2, NULL, 1),
(266, 'es', 266, 109, 'Others Jobs Search', 'others-jobs-search-es', NULL, NULL, NULL, 169, 170, 2, NULL, 1),
(267, 'es', 267, 109, 'BTP - Construction - Building', 'btp-construction-building-es', NULL, NULL, NULL, 165, 166, 2, NULL, 1),
(268, 'es', 268, 109, 'Trade - Business Services', 'trade-business-services-es', NULL, NULL, NULL, 167, 168, 2, NULL, 1),
(269, 'es', 269, 109, 'Commercial - Sale Jobs Search', 'commercial-sale-jobs-search-es', NULL, NULL, NULL, 163, 164, 2, NULL, 1),
(270, 'es', 270, 109, 'Accounting - Management - Finance', 'accounting-management-finance-es', NULL, NULL, NULL, 161, 162, 2, NULL, 1),
(271, 'es', 271, 109, 'Steering - Manager', 'steering-manager-es', NULL, NULL, NULL, 157, 158, 2, NULL, 1),
(272, 'es', 272, 109, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty-es', NULL, NULL, NULL, 155, 156, 2, NULL, 1),
(273, 'es', 273, 109, 'Public Service Jobs Search', 'public-service-jobs-search-es', NULL, NULL, NULL, 151, 152, 2, NULL, 1),
(274, 'es', 274, 109, 'Real Estate Jobs Search', 'real-estate-jobs-search-es', NULL, NULL, NULL, 131, 132, 2, NULL, 1),
(275, 'es', 275, 109, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting-es', NULL, NULL, NULL, 149, 150, 2, NULL, 1),
(276, 'es', 276, 109, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications-es', NULL, NULL, NULL, 147, 148, 2, NULL, 1),
(277, 'es', 277, 109, 'Industry, Production & engineering', 'industry-production-engineering-es', NULL, NULL, NULL, 145, 146, 2, NULL, 1),
(278, 'es', 278, 109, 'Marketing - Communication', 'marketing-communication-es', NULL, NULL, NULL, 159, 160, 2, NULL, 1),
(279, 'es', 279, 109, 'Babysitting - Nanny Work', 'babysitting-nanny-work-es', NULL, NULL, NULL, 143, 144, 2, NULL, 1),
(280, 'es', 280, 109, 'HR - Training - Education', 'hr-training-education-es', NULL, NULL, NULL, 141, 142, 2, NULL, 1),
(281, 'es', 281, 109, 'Medical - Healthcare - Social', 'medical-healthcare-social-es', NULL, NULL, NULL, 139, 140, 2, NULL, 1),
(282, 'es', 282, 109, 'Security - Guarding', 'security-guarding-es', NULL, NULL, NULL, 137, 138, 2, NULL, 1),
(283, 'es', 283, 109, 'Household Services - Housekeeping', 'household-services-housekeeping-es', NULL, NULL, NULL, 135, 136, 2, NULL, 1),
(284, 'es', 284, 109, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure-es', NULL, NULL, NULL, 133, 134, 2, NULL, 1),
(285, 'es', 285, 109, 'Transportation - Logistics', 'transportation-logistics-es', NULL, NULL, NULL, 173, 174, 2, NULL, 1),
(287, 'es', 287, 133, 'Language Classes', 'language-classes-es', NULL, NULL, NULL, 263, 264, 2, NULL, 1),
(288, 'es', 288, 133, 'Computer Courses', 'computer-courses-es', NULL, NULL, NULL, 261, 262, 2, NULL, 1),
(289, 'es', 289, 133, 'Tutoring, Private Lessons', 'tutoring-private-lessons-es', NULL, NULL, NULL, 257, 258, 2, NULL, 1),
(290, 'es', 290, 133, 'Vocational Training', 'vocational-training-es', NULL, NULL, NULL, 259, 260, 2, NULL, 1),
(291, 'es', 291, 133, 'Maths, Physics, Chemistry', 'maths-physics-chemistry-es', NULL, NULL, NULL, 251, 252, 2, NULL, 1),
(292, 'es', 292, 133, 'Music, Theatre, Dance', 'music-theatre-dance-es', NULL, NULL, NULL, 253, 254, 2, NULL, 1),
(293, 'es', 293, 133, 'School support', 'school-support-es', NULL, NULL, NULL, 255, 256, 2, NULL, 1),
(295, 'es', 295, 141, 'Concerts & Festivals', 'concerts-festivals-es', NULL, NULL, NULL, 227, 228, 2, NULL, 1),
(296, 'es', 296, 141, 'Networking & Meetups', 'networking-meetups-es', NULL, NULL, NULL, 229, 230, 2, NULL, 1),
(297, 'es', 297, 141, 'Sports & Outdoors', 'sports-outdoors-es', NULL, NULL, NULL, 225, 226, 2, NULL, 1),
(298, 'es', 298, 141, 'Trade Shows & Conventions', 'trade-shows-conventions-es', NULL, NULL, NULL, 231, 232, 2, NULL, 1),
(299, 'es', 299, 141, 'Training & Seminars', 'training-seminars-es', NULL, NULL, NULL, 233, 234, 2, NULL, 1),
(300, 'es', 300, 141, 'Ceremonies', 'ceremonies-es', NULL, NULL, NULL, 235, 236, 2, NULL, 1),
(301, 'es', 301, 141, 'Conferences', 'conferences-es', NULL, NULL, NULL, 237, 238, 2, NULL, 1),
(302, 'es', 302, 141, 'Weddings', 'weddings-es', NULL, NULL, NULL, 239, 240, 2, NULL, 1),
(303, 'es', 303, 141, 'Birthdays', 'birthdays-es', NULL, NULL, NULL, 241, 242, 2, NULL, 1),
(304, 'es', 304, 141, 'Family Events', 'family-events-es', NULL, NULL, NULL, 243, 244, 2, NULL, 1),
(305, 'es', 305, 141, 'Nightlife', 'nightlife-es', NULL, NULL, NULL, 245, 246, 2, NULL, 1),
(306, 'es', 306, 141, 'All others events', 'all-others-events-es', NULL, NULL, NULL, 247, 248, 2, NULL, 1),
(307, 'es', 307, 0, 'Dólares', 'dolares', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(308, 'en', 307, 0, 'Dólares', 'dolares-en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(309, 'es', 309, 0, 'Euros', 'euros', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(310, 'en', 309, 0, 'Euros', 'euros-en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(311, 'es', 311, 0, 'Reales', 'reales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(312, 'en', 311, 0, 'Reales', 'reales-en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(313, 'es', 313, 0, 'Pesos chilenos', 'pesos-chilenos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(314, 'en', 313, 0, 'Pesos chilenos', 'pesos-chilenos-en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(315, 'es', 315, 0, 'Pesos argentinos', 'pesos-argentinos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(316, 'en', 315, 0, 'Pesos argentinos', 'pesos-argentinos-en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, 0, 2, 3, 1),
(2, 1, 6, 0, 0, 16, 17, 1),
(3, 109, 7, 0, NULL, NULL, NULL, NULL),
(4, 1, 5, 0, 0, 8, 9, 1),
(5, 1, 4, 0, 0, 14, 15, 1),
(6, 1, 2, 0, 0, 4, 5, 1),
(7, 1, 3, 0, 0, 6, 7, 1),
(8, 1, 8, 0, 0, 12, 13, 1),
(9, 47, 8, 0, 0, 4, 5, 1),
(10, 59, 8, 0, NULL, NULL, NULL, NULL),
(11, 1, 9, 0, 0, 10, 11, 1),
(12, 85, 10, 0, NULL, NULL, NULL, NULL),
(13, 85, 11, 0, NULL, NULL, NULL, NULL),
(14, 85, 12, 0, NULL, NULL, NULL, NULL),
(15, 109, 12, 0, NULL, NULL, NULL, NULL),
(16, 9, 13, 0, 0, 2, 3, 1),
(17, 9, 14, 0, 0, 4, 5, 1),
(18, 9, 15, 0, 0, 8, 9, 1),
(19, 9, 16, 0, 0, 10, 11, 1),
(20, 9, 17, 0, 0, 6, 7, 1),
(21, 47, 18, 0, 0, 2, 3, 1),
(22, 75, 19, 0, NULL, NULL, NULL, NULL),
(23, 75, 20, 0, NULL, NULL, NULL, NULL),
(24, 75, 21, 0, NULL, NULL, NULL, NULL),
(25, 141, 22, 0, NULL, NULL, NULL, NULL),
(26, 141, 23, 0, NULL, NULL, NULL, NULL),
(27, 141, 24, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ISO-3166 2-letter country code, 2 characters',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'name of geographical point (utf8) varchar(200)',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of geographical point in plain ascii characters, varchar(200)',
  `latitude` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `longitude` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, char(1)',
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, varchar(10)',
  `subadmin1_code` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)',
  `subadmin2_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)',
  `population` bigint(20) DEFAULT NULL COMMENT 'bigint (4 byte int)',
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the timezone id (see file timeZone.txt)',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(3427213, 'AR', 'Zárate', 'Zarate', -34.0981, -59.0286, 'P', 'PPLA2', 'AR.01', 'AR.01.06882', 88781, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3427387, 'AR', 'Villa Ortúzar', 'Villa Ortuzar', -34.5797, -58.4683, 'P', 'PPLX', 'AR.07', 'AR.07.02015', 22500, 'America/Argentina/Buenos_Aires', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(3427388, 'AR', 'Villa Ocampo', 'Villa Ocampo', -28.4875, -59.3551, 'P', 'PPL', 'AR.21', 'AR.21.82049', 19101, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427399, 'AR', 'Villa María Grande', 'Villa Maria Grande', -31.6656, -59.9018, 'P', 'PPL', 'AR.08', 'AR.08.30084', 7101, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427408, 'AR', 'Villa Lugano', 'Villa Lugano', -34.6791, -58.4726, 'P', 'PPLX', 'AR.07', 'AR.07.02008', 114000, 'America/Argentina/Buenos_Aires', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(3427420, 'AR', 'Villa Hernandarias', 'Villa Hernandarias', -31.231, -59.985, 'P', 'PPL', 'AR.08', 'AR.08.30084', 5375, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427428, 'AR', 'Villaguay', 'Villaguay', -31.8653, -59.0269, 'P', 'PPLA2', 'AR.08', 'AR.08.30113', 32027, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3427431, 'AR', 'Villa Gesell', 'Villa Gesell', -37.2639, -56.973, 'P', 'PPL', 'AR.01', 'AR.01.06868', 23257, 'America/Argentina/Buenos_Aires', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427443, 'AR', 'Villa Elisa', 'Villa Elisa', -32.1632, -58.4008, 'P', 'PPL', 'AR.08', 'AR.08.30008', 9334, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427537, 'AR', 'Veinticinco de Mayo', 'Veinticinco de Mayo', -27.3768, -54.7431, 'P', 'PPL', 'AR.14', 'AR.14.54119', 11928, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3427582, 'AR', 'Urdinarrain', 'Urdinarrain', -32.6857, -58.8932, 'P', 'PPL', 'AR.08', 'AR.08.30056', 7992, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3427761, 'AR', 'Tigre', 'Tigre', -34.426, -58.5796, 'P', 'PPL', 'AR.01', 'AR.01.06805', 31106, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3427833, 'AR', 'Tandil', 'Tandil', -37.3217, -59.1332, 'P', 'PPLA2', 'AR.01', 'AR.01.06791', 104325, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3428068, 'AR', 'San Vicente', 'San Vicente', -26.6167, -54.1333, 'P', 'PPL', 'AR.14', 'AR.14.54112', 38247, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428071, 'AR', 'Santo Tomé', 'Santo Tome', -28.5494, -56.0408, 'P', 'PPLA2', 'AR.06', 'AR.06.18168', 22634, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428079, 'AR', 'Santo Pipó', 'Santo Pipo', -27.1413, -55.4087, 'P', 'PPL', 'AR.14', 'AR.14.54098', 5447, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428182, 'AR', 'Santa Rosa', 'Santa Rosa', -28.2632, -58.1189, 'P', 'PPL', 'AR.06', 'AR.06.18028', 8330, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428287, 'AR', 'Santa Lucía', 'Santa Lucia', -28.9875, -59.1029, 'P', 'PPLA2', 'AR.06', 'AR.06.18091', 14056, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428359, 'AR', 'Santa Elena', 'Santa Elena', -30.9477, -59.787, 'P', 'PPL', 'AR.08', 'AR.08.30070', 18410, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428481, 'AR', 'San Salvador', 'San Salvador', -31.6249, -58.5052, 'P', 'PPLA2', 'AR.08', 'AR.08.30088', 11626, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428576, 'AR', 'San Pedro', 'San Pedro', -33.6792, -59.6663, 'P', 'PPLA2', 'AR.01', 'AR.01.06770', 47452, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3428577, 'AR', 'San Pedro', 'San Pedro', -26.6221, -54.1084, 'P', 'PPLA2', 'AR.14', 'AR.14.54112', 23736, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3428644, 'AR', 'San Miguel', 'San Miguel', -27.9958, -57.5896, 'P', 'PPLA2', 'AR.06', 'AR.06.18154', 7396, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3428708, 'AR', 'San Luis del Palmar', 'San Luis del Palmar', -27.5079, -58.5545, 'P', 'PPLA2', 'AR.06', 'AR.06.18140', 15347, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428759, 'AR', 'San Lorenzo', 'San Lorenzo', -28.1331, -58.7673, 'P', 'PPL', 'AR.06', 'AR.06.18126', 47626, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428858, 'AR', 'San José de Feliciano', 'San Jose de Feliciano', -30.3845, -58.7517, 'P', 'PPLA2', 'AR.08', 'AR.08.30042', 11137, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3428928, 'AR', 'San José', 'San Jose', -27.7698, -55.7826, 'P', 'PPL', 'AR.14', 'AR.14.54007', 6452, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3428975, 'AR', 'San Javier', 'San Javier', -30.5778, -59.9317, 'P', 'PPLA2', 'AR.21', 'AR.21.82098', 15606, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3428992, 'AR', 'San Isidro', 'San Isidro', -34.4721, -58.5271, 'P', 'PPLA2', 'AR.01', 'AR.01.06756', 45190, 'America/Argentina/Buenos_Aires', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(3429160, 'AR', 'San Clemente del Tuyú', 'San Clemente del Tuyu', -36.3569, -56.7235, 'P', 'PPL', 'AR.01', 'AR.01.06420', 11174, 'America/Argentina/Buenos_Aires', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429403, 'AR', 'Saladas', 'Saladas', -28.2538, -58.6259, 'P', 'PPLA2', 'AR.06', 'AR.06.18126', 18349, 'America/Argentina/Cordoba', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(3429439, 'AR', 'Rosario del Tala', 'Rosario del Tala', -32.3029, -59.1455, 'P', 'PPLA2', 'AR.08', 'AR.08.30091', 13807, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429576, 'AR', 'Retiro', 'Retiro', -34.5833, -58.3833, 'P', 'PPLX', 'AR.07', 'AR.07.02001', 38635, 'America/Argentina/Buenos_Aires', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(3429577, 'AR', 'Resistencia', 'Resistencia', -27.4606, -58.9839, 'P', 'PPLA', 'AR.03', 'AR.03.22140', 387158, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429594, 'AR', 'Reconquista', 'Reconquista', -29.15, -59.65, 'P', 'PPLA2', 'AR.21', 'AR.21.82049', 90184, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3429652, 'AR', 'Quilmes', 'Quilmes', -34.729, -58.2637, 'P', 'PPLA2', 'AR.01', 'AR.01.06658', 518788, 'America/Argentina/Buenos_Aires', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(3429713, 'AR', 'Puerto Vilelas', 'Puerto Vilelas', -27.5141, -58.9391, 'P', 'PPL', 'AR.03', 'AR.03.22140', 8455, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429721, 'AR', 'Puerto Tirol', 'Puerto Tirol', -27.3722, -59.0821, 'P', 'PPLA2', 'AR.03', 'AR.03.22077', 9767, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429732, 'AR', 'Puerto Rico', 'Puerto Rico', -26.796, -55.024, 'P', 'PPLA2', 'AR.14', 'AR.14.54077', 17491, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429738, 'AR', 'Puerto Piray', 'Puerto Piray', -26.4678, -54.7148, 'P', 'PPL', 'AR.14', 'AR.14.54084', 8557, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429764, 'AR', 'Puerto Libertad', 'Puerto Libertad', -25.9164, -54.6209, 'P', 'PPL', 'AR.14', 'AR.14.54063', 6143, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429777, 'AR', 'Puerto Iguazú', 'Puerto Iguazu', -25.5991, -54.5736, 'P', 'PPLA4', 'AR.14', 'AR.14.54063', 32038, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3429786, 'AR', 'Puerto Esperanza', 'Puerto Esperanza', -26.0152, -54.6731, 'P', 'PPLA2', 'AR.14', 'AR.14.54063', 15579, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429790, 'AR', 'Puerto Eldorado', 'Puerto Eldorado', -26.4084, -54.6946, 'P', 'PPL', 'AR.14', 'AR.14.54042', 54189, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3429866, 'AR', 'Presidencia de la Plaza', 'Presidencia de la Plaza', -27.0015, -59.8424, 'P', 'PPLA2', 'AR.03', 'AR.03.22119', 12231, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3429886, 'AR', 'Posadas', 'Posadas', -27.3671, -55.8961, 'P', 'PPLA', 'AR.14', 'AR.14.54028', 323739, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3429902, 'AR', 'Pontevedra', 'Pontevedra', -34.7478, -58.7007, 'P', 'PPL', 'AR.01', 'AR.01.06539', 33515, 'America/Argentina/Buenos_Aires', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(3429949, 'AR', 'Pirané', 'Pirane', -25.7324, -59.1088, 'P', 'PPLA2', 'AR.09', 'AR.09.34056', 19124, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3429980, 'AR', 'Pilar', 'Pilar', -34.4587, -58.9142, 'P', 'PPLA2', 'AR.01', 'AR.01.06638', 226517, 'America/Argentina/Buenos_Aires', 1, '2017-12-20 23:00:00', '2017-12-20 23:00:00'),
(3430029, 'AR', 'Perugorría', 'Perugorria', -29.3413, -58.6106, 'P', 'PPL', 'AR.06', 'AR.06.18035', 5685, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430104, 'AR', 'Paso de los Libres', 'Paso de los Libres', -29.7125, -57.0877, 'P', 'PPLA2', 'AR.06', 'AR.06.18119', 43805, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430105, 'AR', 'Paso de la Patria', 'Paso de la Patria', -27.3168, -58.572, 'P', 'PPL', 'AR.06', 'AR.06.18133', 5818, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430178, 'AR', 'Panambí', 'Panambi', -27.7237, -54.9151, 'P', 'PPL', 'AR.14', 'AR.14.54091', 5970, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430180, 'AR', 'Pampa del Indio', 'Pampa del Indio', -26.0647, -59.919, 'P', 'PPL', 'AR.03', 'AR.03.22084', 11588, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430186, 'AR', 'Palo Santo', 'Palo Santo', -25.5633, -59.3378, 'P', 'PPL', 'AR.09', 'AR.09.34056', 5324, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430340, 'AR', 'Oberá', 'Obera', -27.4871, -55.1199, 'P', 'PPLA2', 'AR.14', 'AR.14.54091', 56528, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430402, 'AR', 'Nuestra Señora del Rosario de Caa Catí', 'Nuestra Senora del Rosario de Caa Cati', -27.7507, -57.6207, 'P', 'PPLA2', 'AR.06', 'AR.06.18063', 7573, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430443, 'AR', 'Necochea', 'Necochea', -38.5545, -58.7396, 'P', 'PPLA2', 'AR.01', 'AR.01.06581', 80478, 'America/Argentina/Buenos_Aires', 1, '2016-01-26 23:00:00', '2016-01-26 23:00:00'),
(3430545, 'AR', 'Morón', 'Moron', -34.6509, -58.6196, 'P', 'PPLA2', 'AR.01', 'AR.01.06568', 319934, 'America/Argentina/Buenos_Aires', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(3430598, 'AR', 'Monte Caseros', 'Monte Caseros', -30.2536, -57.6363, 'P', 'PPLA2', 'AR.06', 'AR.06.18112', 24671, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430601, 'AR', 'Montecarlo', 'Montecarlo', -26.5662, -54.757, 'P', 'PPLA2', 'AR.14', 'AR.14.54084', 22229, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430648, 'AR', 'Mocoretá', 'Mocoreta', -30.6189, -57.9634, 'P', 'PPL', 'AR.06', 'AR.06.18112', 6088, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430708, 'AR', 'Mercedes', 'Mercedes', -34.6515, -59.4307, 'P', 'PPLA2', 'AR.01', 'AR.01.06532', 52949, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430709, 'AR', 'Mercedes', 'Mercedes', -29.1842, -58.0752, 'P', 'PPLA2', 'AR.06', 'AR.06.18105', 30649, 'America/Argentina/Cordoba', 1, '2015-06-14 23:00:00', '2015-06-14 23:00:00'),
(3430760, 'AR', 'Mburucuyá', 'Mburucuya', -28.0453, -58.2284, 'P', 'PPLA2', 'AR.06', 'AR.06.18098', 9012, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3430857, 'AR', 'Margarita Belén', 'Margarita Belen', -27.2616, -58.9722, 'P', 'PPLA2', 'AR.03', 'AR.03.22126', 5547, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430863, 'AR', 'Mar del Plata', 'Mar del Plata', -38.0023, -57.5575, 'P', 'PPLA2', 'AR.01', 'AR.01.06357', 553935, 'America/Argentina/Buenos_Aires', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430940, 'AR', 'Malabrigo', 'Malabrigo', -29.3464, -59.9696, 'P', 'PPL', 'AR.21', 'AR.21.82049', 7026, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430968, 'AR', 'Maciá', 'Macia', -32.1722, -59.3995, 'P', 'PPL', 'AR.08', 'AR.08.30091', 5806, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3430988, 'AR', 'Luján', 'Lujan', -34.5703, -59.105, 'P', 'PPLA2', 'AR.01', 'AR.01.06497', 81749, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3431606, 'AR', 'Las Toscas', 'Las Toscas', -28.3529, -59.2579, 'P', 'PPL', 'AR.21', 'AR.21.82049', 11811, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3431916, 'AR', 'Larroque', 'Larroque', -33.0359, -59.0013, 'P', 'PPL', 'AR.08', 'AR.08.30056', 6200, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3432043, 'AR', 'La Plata', 'La Plata', -34.9215, -57.9545, 'P', 'PPLA', 'AR.01', 'AR.01.06441', 694167, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3432079, 'AR', 'La Paz', 'La Paz', -30.7449, -59.6457, 'P', 'PPLA2', 'AR.08', 'AR.08.30070', 24716, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3432355, 'AR', 'La Leonesa', 'La Leonesa', -27.0379, -58.7035, 'P', 'PPLA2', 'AR.03', 'AR.03.22014', 10067, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3432760, 'AR', 'La Cruz', 'La Cruz', -29.1744, -56.6433, 'P', 'PPLA2', 'AR.06', 'AR.06.18147', 8591, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433349, 'AR', 'Jardín América', 'Jardin America', -27.0435, -55.227, 'P', 'PPL', 'AR.14', 'AR.14.54098', 24905, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433363, 'AR', 'Itatí', 'Itati', -27.2704, -58.2446, 'P', 'PPLA2', 'AR.06', 'AR.06.18077', 7902, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3433513, 'AR', 'Ibarreta', 'Ibarreta', -25.2144, -59.8585, 'P', 'PPL', 'AR.09', 'AR.09.34035', 8687, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433658, 'AR', 'Gualeguaychú', 'Gualeguaychu', -33.0094, -58.5172, 'P', 'PPLA2', 'AR.08', 'AR.08.30056', 78676, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433663, 'AR', 'Gualeguay', 'Gualeguay', -33.1416, -59.3097, 'P', 'PPLA2', 'AR.08', 'AR.08.30049', 33120, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3433715, 'AR', 'Goya', 'Goya', -29.1439, -59.2651, 'P', 'PPLA2', 'AR.06', 'AR.06.18070', 70245, 'America/Argentina/Cordoba', 1, '2015-06-23 23:00:00', '2015-06-23 23:00:00'),
(3433743, 'AR', 'Gobernador Roca', 'Gobernador Roca', -27.1864, -55.4643, 'P', 'PPL', 'AR.14', 'AR.14.54098', 6315, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433753, 'AR', 'Gobernador Ingeniero Valentín Virasoro', 'Gobernador Ingeniero Valentin Virasoro', -28.05, -56.0333, 'P', 'PPL', 'AR.06', 'AR.06.18168', 28756, 'America/Argentina/Cordoba', 1, '2016-02-01 23:00:00', '2016-02-01 23:00:00'),
(3433803, 'AR', 'General José de San Martín', 'General Jose de San Martin', -26.5374, -59.3416, 'P', 'PPLA2', 'AR.03', 'AR.03.22084', 31758, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433836, 'AR', 'Garupá', 'Garupa', -27.4817, -55.8292, 'P', 'PPL', 'AR.14', 'AR.14.54028', 28814, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433839, 'AR', 'Garuhapé', 'Garuhape', -26.8177, -54.9566, 'P', 'PPL', 'AR.14', 'AR.14.54077', 8259, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433899, 'AR', 'Formosa', 'Formosa', -26.1775, -58.1781, 'P', 'PPLA', 'AR.09', 'AR.09.34014', 221383, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433901, 'AR', 'Fontana', 'Fontana', -27.4181, -59.0239, 'P', 'PPL', 'AR.03', 'AR.03.22140', 26745, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433956, 'AR', 'Federal', 'Federal', -30.9547, -58.7833, 'P', 'PPLA2', 'AR.08', 'AR.08.30035', 16333, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3433959, 'AR', 'Federación', 'Federacion', -31.0062, -57.8996, 'P', 'PPLA2', 'AR.08', 'AR.08.30028', 13789, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3434095, 'AR', 'Esquina', 'Esquina', -30.0144, -59.5272, 'P', 'PPLA2', 'AR.06', 'AR.06.18049', 26399, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3434291, 'AR', 'El Soberbio', 'El Soberbio', -27.2985, -54.1988, 'P', 'PPLA2', 'AR.14', 'AR.14.54056', 19571, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3434731, 'AR', 'El Colorado', 'El Colorado', -26.3081, -59.3729, 'P', 'PPL', 'AR.09', 'AR.09.34056', 12780, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3434932, 'AR', 'El Alcázar', 'El Alcazar', -26.7146, -54.8152, 'P', 'PPL', 'AR.14', 'AR.14.54077', 5127, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3434995, 'AR', 'Dos de Mayo', 'Dos de Mayo', -27.0228, -54.6867, 'P', 'PPL', 'AR.14', 'AR.14.54014', 14544, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435038, 'AR', 'Dolores', 'Dolores', -36.3132, -57.6792, 'P', 'PPLA2', 'AR.01', 'AR.01.06238', 25190, 'America/Argentina/Buenos_Aires', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(3435103, 'AR', 'Curuzú Cuatiá', 'Curuzu Cuatia', -29.7917, -58.0546, 'P', 'PPLA2', 'AR.06', 'AR.06.18035', 36390, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435217, 'AR', 'Corrientes', 'Corrientes', -27.4806, -58.8341, 'P', 'PPLA', 'AR.06', 'AR.06.18021', 339067, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435261, 'AR', 'Concordia', 'Concordia', -31.393, -58.0209, 'P', 'PPLA2', 'AR.08', 'AR.08.30015', 145210, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435264, 'AR', 'Concepción del Uruguay', 'Concepcion del Uruguay', -32.4825, -58.2372, 'P', 'PPLA2', 'AR.08', 'AR.08.30098', 67895, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435266, 'AR', 'Concepción de la Sierra', 'Concepcion de la Sierra', -27.9831, -55.5203, 'P', 'PPLA2', 'AR.14', 'AR.14.54035', 7398, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435283, 'AR', 'Comandante Fontana', 'Comandante Fontana', -25.3345, -59.6821, 'P', 'PPLA2', 'AR.09', 'AR.09.34035', 5655, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435290, 'AR', 'Colonia Wanda', 'Colonia Wanda', -25.9741, -54.4281, 'P', 'PPL', 'AR.14', 'AR.14.54063', 12779, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435344, 'AR', 'Colonia Aurora', 'Colonia Aurora', -27.4743, -54.525, 'P', 'PPL', 'AR.14', 'AR.14.54119', 8407, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435356, 'AR', 'Colegiales', 'Colegiales', -34.5737, -58.4492, 'P', 'PPLX', 'AR.07', 'AR.07.02013', 57000, 'America/Argentina/Buenos_Aires', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(3435364, 'AR', 'Clorinda', 'Clorinda', -25.2848, -57.7185, 'P', 'PPLA2', 'AR.09', 'AR.09.34049', 15000, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435486, 'AR', 'Chajarí', 'Chajari', -30.7505, -57.9796, 'P', 'PPL', 'AR.08', 'AR.08.30028', 30655, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435532, 'AR', 'Cerro Azul', 'Cerro Azul', -27.6331, -55.4962, 'P', 'PPL', 'AR.14', 'AR.14.54070', 5323, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435701, 'AR', 'Capioví', 'Capiovi', -26.93, -55.0608, 'P', 'PPL', 'AR.14', 'AR.14.54077', 5860, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435734, 'AR', 'Candelaria', 'Candelaria', -27.4595, -55.7454, 'P', 'PPL', 'AR.14', 'AR.14.54021', 11039, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3435750, 'AR', 'Campo Viera', 'Campo Viera', -27.3833, -55.0333, 'P', 'PPL', 'AR.14', 'AR.14.54091', 9228, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435765, 'AR', 'Campo Ramón', 'Campo Ramon', -27.4611, -55.019, 'P', 'PPL', 'AR.14', 'AR.14.54091', 10088, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435789, 'AR', 'Campo Grande', 'Campo Grande', -27.2077, -54.9798, 'P', 'PPLA2', 'AR.14', 'AR.14.54014', 12040, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3435810, 'AR', 'Campana', 'Campana', -34.1687, -58.9591, 'P', 'PPLA2', 'AR.01', 'AR.01.06126', 81612, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3435910, 'AR', 'Buenos Aires', 'Buenos Aires', -34.6132, -58.3772, 'P', 'PPLC', 'AR.07', NULL, 13076300, 'America/Argentina/Buenos_Aires', 1, '2017-05-27 23:00:00', '2017-05-27 23:00:00'),
(3435966, 'AR', 'Bovril', 'Bovril', -31.3431, -59.4451, 'P', 'PPL', 'AR.08', 'AR.08.30070', 7977, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3436003, 'AR', 'Boedo', 'Boedo', -34.6333, -58.4167, 'P', 'PPLX', 'AR.07', 'AR.07.02005', 48231, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3436030, 'AR', 'Bernardo de Irigoyen', 'Bernardo de Irigoyen', -26.2552, -53.6458, 'P', 'PPLA2', 'AR.14', 'AR.14.54049', 10889, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3436043, 'AR', 'Berazategui', 'Berazategui', -34.7653, -58.2128, 'P', 'PPL', 'AR.01', 'AR.01.06091', 167498, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3436077, 'AR', 'Belgrano', 'Belgrano', -34.5627, -58.4583, 'P', 'PPLX', 'AR.07', 'AR.07.02013', 138942, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3436124, 'AR', 'Barranqueras', 'Barranqueras', -27.4813, -58.9393, 'P', 'PPL', 'AR.03', 'AR.03.22140', 50823, 'America/Argentina/Cordoba', 1, '2015-06-23 23:00:00', '2015-06-23 23:00:00'),
(3436134, 'AR', 'Barracas', 'Barracas', -34.6497, -58.3834, 'P', 'PPLX', 'AR.07', 'AR.07.02004', 77474, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3436199, 'AR', 'Azul', 'Azul', -36.777, -59.8585, 'P', 'PPLA2', 'AR.01', 'AR.01.06049', 53941, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3436230, 'AR', 'Avellaneda', 'Avellaneda', -29.1176, -59.6583, 'P', 'PPL', 'AR.21', 'AR.21.82049', 23077, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3436287, 'AR', 'Aristóbulo del Valle', 'Aristobulo del Valle', -27.0963, -54.8963, 'P', 'PPL', 'AR.14', 'AR.14.54014', 20683, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3436370, 'AR', 'Alvear', 'Alvear', -29.0968, -56.5504, 'P', 'PPLA2', 'AR.06', 'AR.06.18056', 7917, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3436448, 'AR', 'Alba Posse', 'Alba Posse', -27.5698, -54.6826, 'P', 'PPLA2', 'AR.14', 'AR.14.54119', 6652, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832132, 'AR', 'Zapala', 'Zapala', -38.8992, -70.0544, 'P', 'PPLA2', 'AR.15', 'AR.15.58112', 31534, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3832189, 'AR', 'Yuto', 'Yuto', -23.6434, -64.4719, 'P', 'PPL', 'AR.10', 'AR.10.38035', 7732, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832260, 'AR', 'Yerba Buena', 'Yerba Buena', -26.8167, -65.3167, 'P', 'PPLA2', 'AR.24', 'AR.24.90119', 50783, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832376, 'AR', 'Yacimiento Río Turbio', 'Yacimiento Rio Turbio', -51.5732, -72.3508, 'P', 'PPL', 'AR.20', 'AR.20.78021', 6650, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832647, 'AR', 'Villa Regina', 'Villa Regina', -39.1, -67.0667, 'P', 'PPL', 'AR.16', 'AR.16.62042', 31209, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832653, 'AR', 'Villa Paula de Sarmiento', 'Villa Paula de Sarmiento', -31.4933, -68.5384, 'P', 'PPL', 'AR.18', 'AR.18.70042', 19092, 'America/Argentina/San_Juan', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832658, 'AR', 'Villa Ojo de Agua', 'Villa Ojo de Agua', -29.5, -63.6938, 'P', 'PPLA2', 'AR.22', 'AR.22.86126', 5832, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832662, 'AR', 'Villa Nueva', 'Villa Nueva', -32.4329, -63.2476, 'P', 'PPL', 'AR.05', 'AR.05.14042', 16841, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832694, 'AR', 'Villa María', 'Villa Maria', -32.4075, -63.2402, 'P', 'PPLA2', 'AR.05', 'AR.05.14042', 92453, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832711, 'AR', 'Villa La Angostura', 'Villa La Angostura', -40.7617, -71.6463, 'P', 'PPL', 'AR.15', 'AR.15.58070', 7526, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832719, 'AR', 'Villa Huidobro', 'Villa Huidobro', -34.8383, -64.5869, 'P', 'PPLA2', 'AR.05', 'AR.05.14035', 5155, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832734, 'AR', 'Villa General Belgrano', 'Villa General Belgrano', -31.9754, -64.5559, 'P', 'PPL', 'AR.05', 'AR.05.14007', 5888, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3832756, 'AR', 'Villa Dolores', 'Villa Dolores', -31.9459, -65.1896, 'P', 'PPL', 'AR.05', 'AR.05.14133', 28009, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832759, 'AR', 'Villa de Soto', 'Villa de Soto', -30.8552, -64.9995, 'P', 'PPL', 'AR.05', 'AR.05.14028', 7303, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832763, 'AR', 'Villa del Totoral', 'Villa del Totoral', -30.8167, -63.7167, 'P', 'PPLA2', 'AR.05', 'AR.05.14168', 7110, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832778, 'AR', 'Villa Constitución', 'Villa Constitucion', -33.2278, -60.3297, 'P', 'PPLA2', 'AR.21', 'AR.21.82028', 44271, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832783, 'AR', 'Chañar Ladeado', 'Chanar Ladeado', -33.3252, -62.0383, 'P', 'PPL', 'AR.21', 'AR.21.82014', 5639, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832791, 'AR', 'Villa Carlos Paz', 'Villa Carlos Paz', -31.4241, -64.4978, 'P', 'PPL', 'AR.05', 'AR.05.14091', 69451, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832793, 'AR', 'Villa Cañás', 'Villa Canas', -34.0056, -61.6076, 'P', 'PPL', 'AR.21', 'AR.21.82042', 9328, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832797, 'AR', 'Villa Berthet', 'Villa Berthet', -27.2917, -60.4126, 'P', 'PPLA2', 'AR.03', 'AR.03.22147', 12029, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832811, 'AR', 'Villa Ángela', 'Villa Angela', -27.5738, -60.7153, 'P', 'PPLA2', 'AR.03', 'AR.03.22098', 43511, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832815, 'AR', 'Villa Allende', 'Villa Allende', -31.2946, -64.2954, 'P', 'PPL', 'AR.05', 'AR.05.14021', 21683, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832899, 'AR', 'Viedma', 'Viedma', -40.8134, -62.9967, 'P', 'PPLA', 'AR.16', 'AR.16.62007', 48940, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832917, 'AR', 'Vicuña Mackenna', 'Vicuna Mackenna', -33.9197, -64.3922, 'P', 'PPL', 'AR.05', 'AR.05.14098', 8994, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832923, 'AR', 'Victorica', 'Victorica', -36.215, -65.4359, 'P', 'PPLA2', 'AR.11', 'AR.11.42098', 6565, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3832934, 'AR', 'Victoria', 'Victoria', -32.6184, -60.1548, 'P', 'PPL', 'AR.08', 'AR.08.30105', 25139, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3832959, 'AR', 'Viale', 'Viale', -31.8678, -60.0072, 'P', 'PPL', 'AR.08', 'AR.08.30084', 8939, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833027, 'AR', 'Vera', 'Vera', -29.4593, -60.2126, 'P', 'PPLA2', 'AR.21', 'AR.21.82133', 19797, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833062, 'AR', 'Venado Tuerto', 'Venado Tuerto', -33.7456, -61.9688, 'P', 'PPL', 'AR.21', 'AR.21.82042', 72340, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833111, 'AR', 'Veinticinco de Mayo', 'Veinticinco de Mayo', -37.7741, -67.7164, 'P', 'PPLA2', 'AR.11', 'AR.11.42112', 6962, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833112, 'AR', 'Veinticinco de Mayo', 'Veinticinco de Mayo', -35.4323, -60.1727, 'P', 'PPLA2', 'AR.01', 'AR.01.06854', 24668, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3833211, 'AR', 'Valle Hermoso', 'Valle Hermoso', -31.1173, -64.4808, 'P', 'PPL', 'AR.05', 'AR.05.14091', 5486, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833367, 'AR', 'Ushuaia', 'Ushuaia', -54.8, -68.3, 'P', 'PPLA', 'AR.23', 'AR.23.94014', 58028, 'America/Argentina/Ushuaia', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833412, 'AR', 'Unquillo', 'Unquillo', -31.2307, -64.3161, 'P', 'PPL', 'AR.05', 'AR.05.14021', 15369, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833675, 'AR', 'Trevelin', 'Trevelin', -43.0858, -71.4639, 'P', 'PPL', 'AR.04', 'AR.04.26035', 6395, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833794, 'AR', 'Tres Isletas', 'Tres Isletas', -26.3407, -60.4321, 'P', 'PPLA2', 'AR.03', 'AR.03.22091', 24747, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833859, 'AR', 'Tres Arroyos', 'Tres Arroyos', -38.3739, -60.2798, 'P', 'PPLA2', 'AR.01', 'AR.01.06833', 47136, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3833883, 'AR', 'Trelew', 'Trelew', -43.249, -65.3051, 'P', 'PPL', 'AR.04', 'AR.04.26077', 93442, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3833947, 'AR', 'Trancas', 'Trancas', -26.2157, -65.2849, 'P', 'PPLA2', 'AR.24', 'AR.24.90112', 6658, 'America/Argentina/Tucuman', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3833995, 'AR', 'Totoras', 'Totoras', -32.5844, -61.1685, 'P', 'PPL', 'AR.21', 'AR.21.82056', 9587, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834048, 'AR', 'Tostado', 'Tostado', -29.232, -61.7692, 'P', 'PPLA2', 'AR.21', 'AR.21.82077', 14000, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834361, 'AR', 'Tinogasta', 'Tinogasta', -28.0632, -67.5649, 'P', 'PPLA2', 'AR.02', 'AR.02.10105', 14509, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834397, 'AR', 'Tilisarao', 'Tilisarao', -32.7329, -65.2911, 'P', 'PPL', 'AR.19', 'AR.19.74028', 5478, 'America/Argentina/San_Luis', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834403, 'AR', 'Tilcara', 'Tilcara', -23.5776, -65.3509, 'P', 'PPLA2', 'AR.10', 'AR.10.38094', 5640, 'America/Argentina/Jujuy', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3834502, 'AR', 'Termas de Río Hondo', 'Termas de Rio Hondo', -27.4936, -64.8597, 'P', 'PPLA2', 'AR.22', 'AR.22.86147', 27838, 'America/Argentina/Cordoba', 1, '2017-03-24 23:00:00', '2017-03-24 23:00:00'),
(3834601, 'AR', 'Tartagal', 'Tartagal', -22.5164, -63.8013, 'P', 'PPLA2', 'AR.17', 'AR.17.66056', 60819, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834665, 'AR', 'Tancacha', 'Tancacha', -32.2431, -63.9807, 'P', 'PPL', 'AR.05', 'AR.05.14161', 5184, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834813, 'AR', 'Tafí Viejo', 'Tafi Viejo', -26.732, -65.2592, 'P', 'PPLA2', 'AR.24', 'AR.24.90105', 48459, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834843, 'AR', 'Taco Pozo', 'Taco Pozo', -25.6167, -63.2833, 'P', 'PPL', 'AR.03', 'AR.03.22007', 8470, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834961, 'AR', 'Suncho Corral', 'Suncho Corral', -27.9336, -63.4294, 'P', 'PPLA2', 'AR.22', 'AR.22.86098', 6087, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3834971, 'AR', 'Sunchales', 'Sunchales', -30.944, -61.5615, 'P', 'PPL', 'AR.21', 'AR.21.82021', 18757, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835238, 'AR', 'Simoca', 'Simoca', -27.2627, -65.3565, 'P', 'PPLA2', 'AR.24', 'AR.24.90091', 7939, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835297, 'AR', 'Sierra Grande', 'Sierra Grande', -41.606, -65.3557, 'P', 'PPL', 'AR.16', 'AR.16.62077', 6978, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835372, 'AR', 'Senillosa', 'Senillosa', -39.0141, -68.4328, 'P', 'PPL', 'AR.15', 'AR.15.58035', 6394, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3835695, 'AR', 'Sastre', 'Sastre', -31.7676, -61.8289, 'P', 'PPLA2', 'AR.21', 'AR.21.82126', 5521, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835710, 'AR', 'Sarmiento', 'Sarmiento', -45.5882, -69.07, 'P', 'PPLA2', 'AR.04', 'AR.04.26091', 8292, 'America/Argentina/Catamarca', 1, '2017-02-06 23:00:00', '2017-02-06 23:00:00'),
(3835793, 'AR', 'Santo Tomé', 'Santo Tome', -31.6627, -60.7653, 'P', 'PPL', 'AR.21', 'AR.21.82063', 59072, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835869, 'AR', 'Santiago del Estero', 'Santiago del Estero', -27.7951, -64.2615, 'P', 'PPLA', 'AR.22', 'AR.22.86049', 354692, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835921, 'AR', 'Santa Sylvina', 'Santa Sylvina', -27.8326, -61.1375, 'P', 'PPLA2', 'AR.03', 'AR.03.22043', 9040, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835938, 'AR', 'Santa Rosa de Río Primero', 'Santa Rosa de Rio Primero', -31.1523, -63.4019, 'P', 'PPLA2', 'AR.05', 'AR.05.14105', 6788, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3835943, 'AR', 'Santa Rosa de Calamuchita', 'Santa Rosa de Calamuchita', -32.069, -64.5363, 'P', 'PPL', 'AR.05', 'AR.05.14007', 9504, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3835994, 'AR', 'Santa Rosa', 'Santa Rosa', -36.6167, -64.2833, 'P', 'PPLA', 'AR.11', 'AR.11.42021', 111424, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836194, 'AR', 'Santa Lucía', 'Santa Lucia', -31.5399, -68.495, 'P', 'PPLA2', 'AR.18', 'AR.18.70098', 43565, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3836277, 'AR', 'Santa Fe de la Vera Cruz', 'Santa Fe de la Vera Cruz', -31.6333, -60.7, 'P', 'PPLA', 'AR.21', 'AR.21.82063', 489505, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836564, 'AR', 'San Salvador de Jujuy', 'San Salvador de Jujuy', -24.1946, -65.2971, 'P', 'PPLA', 'AR.10', 'AR.10.38021', 305891, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836620, 'AR', 'San Ramón de la Nueva Orán', 'San Ramon de la Nueva Oran', -23.1371, -64.3243, 'P', 'PPL', 'AR.17', 'AR.17.66126', 74059, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836669, 'AR', 'San Rafael', 'San Rafael', -34.6177, -68.3301, 'P', 'PPLA2', 'AR.13', 'AR.13.50105', 109163, 'America/Argentina/Mendoza', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836772, 'AR', 'San Pedro', 'San Pedro', -24.2313, -64.8661, 'P', 'PPLA2', 'AR.10', 'AR.10.38063', 58430, 'America/Argentina/Jujuy', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3836846, 'AR', 'San Nicolás de los Arroyos', 'San Nicolas de los Arroyos', -33.3343, -60.2108, 'P', 'PPLA2', 'AR.01', 'AR.01.06763', 127742, 'America/Argentina/Buenos_Aires', 1, '2017-11-28 23:00:00', '2017-11-28 23:00:00'),
(3836873, 'AR', 'San Miguel de Tucumán', 'San Miguel de Tucuman', -26.8241, -65.2226, 'P', 'PPLA', 'AR.24', 'AR.24.90084', 781023, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836951, 'AR', 'San Martín de los Andes', 'San Martin de los Andes', -40.1579, -71.3534, 'P', 'PPL', 'AR.15', 'AR.15.58056', 23519, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3836992, 'AR', 'San Martín', 'San Martin', -33.081, -68.4681, 'P', 'PPLA2', 'AR.13', 'AR.13.50098', 82549, 'America/Argentina/Mendoza', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3836993, 'AR', 'San Martín', 'San Martin', -31.4296, -68.5006, 'P', 'PPLA2', 'AR.18', 'AR.18.70091', 10140, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3837056, 'AR', 'San Luis', 'San Luis', -33.295, -66.3356, 'P', 'PPLA', 'AR.19', 'AR.19.74056', 183982, 'America/Argentina/San_Luis', 1, '2016-09-04 23:00:00', '2016-09-04 23:00:00'),
(3837124, 'AR', 'San Justo', 'San Justo', -30.7891, -60.5919, 'P', 'PPLA2', 'AR.21', 'AR.21.82112', 21809, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3837213, 'AR', 'San Juan', 'San Juan', -31.5375, -68.5364, 'P', 'PPLA', 'AR.18', 'AR.18.70028', 447048, 'America/Argentina/San_Juan', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837240, 'AR', 'San José de Jáchal', 'San Jose de Jachal', -30.2406, -68.7469, 'P', 'PPLA2', 'AR.18', 'AR.18.70056', 21018, 'America/Argentina/San_Juan', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837441, 'AR', 'San Jorge', 'San Jorge', -31.8962, -61.8598, 'P', 'PPL', 'AR.21', 'AR.21.82126', 16873, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837675, 'AR', 'San Francisco', 'San Francisco', -31.428, -62.0827, 'P', 'PPLA2', 'AR.05', 'AR.05.14140', 59062, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837702, 'AR', 'San Fernando del Valle de Catamarca', 'San Fernando del Valle de Catamarca', -28.4696, -65.7852, 'P', 'PPLA', 'AR.02', 'AR.02.10049', 188812, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837823, 'AR', 'San Cristóbal', 'San Cristobal', -30.3105, -61.2372, 'P', 'PPLA2', 'AR.21', 'AR.21.82091', 14286, 'America/Argentina/Cordoba', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(3837857, 'AR', 'San Carlos Centro', 'San Carlos Centro', -31.7286, -61.0919, 'P', 'PPL', 'AR.21', 'AR.21.82070', 10465, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837943, 'AR', 'San Bernardo', 'San Bernardo', -27.2878, -60.7125, 'P', 'PPLA2', 'AR.03', 'AR.03.22112', 11101, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837956, 'AR', 'San Benito', 'San Benito', -31.7837, -60.4416, 'P', 'PPL', 'AR.08', 'AR.08.30084', 6771, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3837980, 'AR', 'San Antonio Oeste', 'San Antonio Oeste', -40.7319, -64.9477, 'P', 'PPLA2', 'AR.16', 'AR.16.62077', 16966, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838158, 'AR', 'San Agustín de Valle Fértil', 'San Agustin de Valle Fertil', -30.6335, -67.4682, 'P', 'PPLA2', 'AR.18', 'AR.18.70119', 6864, 'America/Argentina/San_Juan', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838201, 'AR', 'Sampacho', 'Sampacho', -33.3839, -64.7221, 'P', 'PPL', 'AR.05', 'AR.05.14098', 7238, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838233, 'AR', 'Salta', 'Salta', -24.7859, -65.4117, 'P', 'PPLA', 'AR.17', 'AR.17.66028', 512686, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838235, 'AR', 'Salsipuedes', 'Salsipuedes', -31.1373, -64.2959, 'P', 'PPL', 'AR.05', 'AR.05.14021', 6411, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838506, 'AR', 'Rufino', 'Rufino', -34.2683, -62.7126, 'P', 'PPL', 'AR.21', 'AR.21.82042', 18361, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838583, 'AR', 'Rosario', 'Rosario', -32.9468, -60.6393, 'P', 'PPLA2', 'AR.21', 'AR.21.82084', 1173533, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3838638, 'AR', 'Roldán', 'Roldan', -32.8985, -60.9068, 'P', 'PPL', 'AR.21', 'AR.21.82119', 12468, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838793, 'AR', 'Río Tercero', 'Rio Tercero', -32.173, -64.1141, 'P', 'PPL', 'AR.05', 'AR.05.14161', 53389, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838797, 'AR', 'Río Segundo', 'Rio Segundo', -31.6526, -63.9099, 'P', 'PPL', 'AR.05', 'AR.05.14119', 18155, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3838854, 'AR', 'Río Grande', 'Rio Grande', -53.7877, -67.7095, 'P', 'PPLA2', 'AR.23', 'AR.23.94007', 52681, 'America/Argentina/Ushuaia', 1, '2017-12-20 23:00:00', '2017-12-20 23:00:00'),
(3838859, 'AR', 'Río Gallegos', 'Rio Gallegos', -51.6226, -69.2181, 'P', 'PPLA', 'AR.20', 'AR.20.78021', 85700, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3838874, 'AR', 'Río Cuarto', 'Rio Cuarto', -33.1307, -64.3499, 'P', 'PPLA2', 'AR.05', 'AR.05.14098', 153757, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3838902, 'AR', 'Río Ceballos', 'Rio Ceballos', -31.1649, -64.3224, 'P', 'PPL', 'AR.05', 'AR.05.14021', 16632, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3839262, 'AR', 'Recreo', 'Recreo', -31.4908, -60.733, 'P', 'PPL', 'AR.21', 'AR.21.82063', 12798, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3839263, 'AR', 'Recreo', 'Recreo', -29.2818, -65.061, 'P', 'PPLA2', 'AR.02', 'AR.02.10070', 14204, 'America/Argentina/Catamarca', 1, '2016-02-02 23:00:00', '2016-02-02 23:00:00'),
(3839282, 'AR', 'Realicó', 'Realico', -35.0366, -64.2447, 'P', 'PPLA2', 'AR.11', 'AR.11.42133', 7151, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3839307, 'AR', 'Rawson', 'Rawson', -43.3002, -65.1023, 'P', 'PPLA', 'AR.04', 'AR.04.26077', 26335, 'America/Argentina/Catamarca', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3839479, 'AR', 'Rafaela', 'Rafaela', -31.2503, -61.4867, 'P', 'PPLA2', 'AR.21', 'AR.21.82021', 88713, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3839482, 'AR', 'Rada Tilly', 'Rada Tilly', -45.9246, -67.5542, 'P', 'PPL', 'AR.04', 'AR.04.26021', 6208, 'America/Argentina/Catamarca', 1, '2018-01-23 23:00:00', '2018-01-23 23:00:00'),
(3839490, 'AR', 'Quitilipi', 'Quitilipi', -26.8691, -60.2168, 'P', 'PPLA2', 'AR.03', 'AR.03.22133', 32083, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3839565, 'AR', 'Quimilí', 'Quimili', -27.6333, -62.4167, 'P', 'PPLA2', 'AR.22', 'AR.22.86119', 10959, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3839982, 'AR', 'Punta Alta', 'Punta Alta', -38.8759, -62.0736, 'P', 'PPLA2', 'AR.01', 'AR.01.06182', 57209, 'America/Argentina/Buenos_Aires', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3840082, 'AR', 'San Julián', 'San Julian', -49.3055, -67.7274, 'P', 'PPLA2', 'AR.20', 'AR.20.78042', 6143, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3840092, 'AR', 'Puerto Madryn', 'Puerto Madryn', -42.7692, -65.0385, 'P', 'PPLA2', 'AR.04', 'AR.04.26007', 64555, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3840104, 'AR', 'Puerto Deseado', 'Puerto Deseado', -47.7503, -65.8938, 'P', 'PPLA2', 'AR.20', 'AR.20.78014', 10237, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3840300, 'AR', 'Presidencia Roque Sáenz Peña', 'Presidencia Roque Saenz Pena', -26.7852, -60.4388, 'P', 'PPLA2', 'AR.03', 'AR.03.22021', 81879, 'America/Argentina/Cordoba', 1, '2016-10-29 23:00:00', '2016-10-29 23:00:00'),
(3840470, 'AR', 'Pozo del Molle', 'Pozo del Molle', -32.0186, -62.9198, 'P', 'PPL', 'AR.05', 'AR.05.14119', 5429, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3840860, 'AR', 'Pocito', 'Pocito', -31.6833, -68.5833, 'P', 'PPL', 'AR.18', 'AR.18.70070', 40969, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3840885, 'AR', 'Plottier', 'Plottier', -38.9667, -68.2333, 'P', 'PPL', 'AR.15', 'AR.15.58035', 25186, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3840896, 'AR', 'Plaza Huincul', 'Plaza Huincul', -38.926, -69.2086, 'P', 'PPL', 'AR.15', 'AR.15.58035', 12273, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3841149, 'AR', 'Pilar', 'Pilar', -31.6789, -63.8796, 'P', 'PPL', 'AR.05', 'AR.05.14119', 12488, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3841309, 'AR', 'Pico Truncado', 'Pico Truncado', -46.7949, -67.9573, 'P', 'PPL', 'AR.20', 'AR.20.78014', 14985, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3841490, 'AR', 'Pergamino', 'Pergamino', -33.8899, -60.5736, 'P', 'PPLA2', 'AR.01', 'AR.01.06623', 87652, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3841500, 'AR', 'Pérez', 'Perez', -32.9983, -60.7679, 'P', 'PPL', 'AR.21', 'AR.21.82084', 24436, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3841956, 'AR', 'Paraná', 'Parana', -31.732, -60.5238, 'P', 'PPLA', 'AR.08', 'AR.08.30084', 262295, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842142, 'AR', 'Pampa del Infierno', 'Pampa del Infierno', -26.5052, -61.1744, 'P', 'PPLA2', 'AR.03', 'AR.03.22007', 8176, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842190, 'AR', 'Palpalá', 'Palpala', -24.2565, -65.2116, 'P', 'PPLA2', 'AR.10', 'AR.10.38042', 48199, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842268, 'AR', 'Palma Sola', 'Palma Sola', -23.9634, -64.2987, 'P', 'PPL', 'AR.10', 'AR.10.38070', 5318, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842621, 'AR', 'Oncativo', 'Oncativo', -31.9135, -63.682, 'P', 'PPL', 'AR.05', 'AR.05.14119', 12660, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842662, 'AR', 'Oliva', 'Oliva', -32.0416, -63.5698, 'P', 'PPLA2', 'AR.05', 'AR.05.14161', 11629, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3842670, 'AR', 'Olavarría', 'Olavarria', -36.8927, -60.3225, 'P', 'PPLA2', 'AR.01', 'AR.01.06595', 86320, 'America/Argentina/Buenos_Aires', 1, '2017-02-06 23:00:00', '2017-02-06 23:00:00'),
(3842881, 'AR', 'Nueve de Julio', 'Nueve de Julio', -35.4444, -60.8831, 'P', 'PPLA2', 'AR.01', 'AR.01.06588', 34718, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3842882, 'AR', 'Nueve de Julio', 'Nueve de Julio', -31.6691, -68.3902, 'P', 'PPLA2', 'AR.18', 'AR.18.70063', 7652, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3843123, 'AR', 'Neuquén', 'Neuquen', -38.9516, -68.0591, 'P', 'PPLA', 'AR.15', 'AR.15.58035', 242092, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3843619, 'AR', 'Morteros', 'Morteros', -30.7116, -61.9986, 'P', 'PPL', 'AR.05', 'AR.05.14140', 15129, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3843803, 'AR', 'Monteros', 'Monteros', -27.1674, -65.4983, 'P', 'PPLA2', 'AR.24', 'AR.24.90070', 23771, 'America/Argentina/Tucuman', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(3843830, 'AR', 'Monte Maíz', 'Monte Maiz', -33.2046, -62.6008, 'P', 'PPL', 'AR.05', 'AR.05.14182', 6920, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3843871, 'AR', 'Monte Cristo', 'Monte Cristo', -31.3431, -63.9444, 'P', 'PPL', 'AR.05', 'AR.05.14021', 6914, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3843881, 'AR', 'Monte Buey', 'Monte Buey', -32.9164, -62.4567, 'P', 'PPL', 'AR.05', 'AR.05.14063', 5497, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3844229, 'AR', 'Mina Clavero', 'Mina Clavero', -31.721, -65.0062, 'P', 'PPL', 'AR.05', 'AR.05.14126', 6855, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3844377, 'AR', 'Merlo', 'Merlo', -32.3429, -65.014, 'P', 'PPL', 'AR.19', 'AR.19.74049', 11159, 'America/Argentina/San_Luis', 1, '2015-06-06 23:00:00', '2015-06-06 23:00:00');
INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(3844421, 'AR', 'Mendoza', 'Mendoza', -32.8908, -68.8272, 'P', 'PPLA', 'AR.13', 'AR.13.50028', 876884, 'America/Argentina/Mendoza', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3844899, 'AR', 'Marcos Juárez', 'Marcos Juarez', -32.6978, -62.1067, 'P', 'PPLA2', 'AR.05', 'AR.05.14063', 24226, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3845073, 'AR', 'Malvinas Argentinas', 'Malvinas Argentinas', -31.3833, -64.0667, 'P', 'PPL', 'AR.05', 'AR.05.14014', 8628, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3845202, 'AR', 'Malagueño', 'Malagueno', -31.4647, -64.3584, 'P', 'PPL', 'AR.05', 'AR.05.14147', 9364, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3845330, 'AR', 'Machagai', 'Machagai', -26.9261, -60.0495, 'P', 'PPLA2', 'AR.03', 'AR.03.22168', 28070, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3846175, 'AR', 'Los Frentones', 'Los Frentones', -26.4077, -61.4137, 'P', 'PPL', 'AR.03', 'AR.03.22007', 6610, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3846514, 'AR', 'Los Altos', 'Los Altos', -28.0485, -65.4995, 'P', 'PPL', 'AR.02', 'AR.02.10098', 6421, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3846864, 'AR', 'Lincoln', 'Lincoln', -34.8665, -61.5302, 'P', 'PPLA2', 'AR.01', 'AR.01.06469', 41808, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3846915, 'AR', 'Libertador General San Martín', 'Libertador General San Martin', -23.8064, -64.7876, 'P', 'PPLA2', 'AR.10', 'AR.10.38035', 49267, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3846991, 'AR', 'Leones', 'Leones', -32.6617, -62.2968, 'P', 'PPL', 'AR.05', 'AR.05.14063', 9971, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3847482, 'AR', 'La Toma', 'La Toma', -33.0526, -65.6238, 'P', 'PPLA2', 'AR.19', 'AR.19.74021', 6663, 'America/Argentina/San_Luis', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3847613, 'AR', 'Las Varillas', 'Las Varillas', -31.8721, -62.7195, 'P', 'PPL', 'AR.05', 'AR.05.14140', 14649, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3847836, 'AR', 'Las Rosas', 'Las Rosas', -32.4766, -61.5804, 'P', 'PPLA2', 'AR.21', 'AR.21.82007', 12793, 'America/Argentina/Cordoba', 1, '2016-06-21 23:00:00', '2016-06-21 23:00:00'),
(3847933, 'AR', 'Las Parejas', 'Las Parejas', -32.6848, -61.5164, 'P', 'PPL', 'AR.21', 'AR.21.82007', 11317, 'America/Argentina/Cordoba', 1, '2016-06-21 23:00:00', '2016-06-21 23:00:00'),
(3848164, 'AR', 'Las Lomitas', 'Las Lomitas', -24.7096, -60.593, 'P', 'PPL', 'AR.09', 'AR.09.34035', 10354, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3848209, 'AR', 'Las Lajitas', 'Las Lajitas', -24.6833, -64.25, 'P', 'PPL', 'AR.17', 'AR.17.66007', 9151, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3848343, 'AR', 'Las Higueras', 'Las Higueras', -33.0923, -64.289, 'P', 'PPL', 'AR.05', 'AR.05.14098', 5282, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3848353, 'AR', 'Las Heras', 'Las Heras', -46.5419, -68.9359, 'P', 'PPL', 'AR.20', 'AR.20.78014', 9303, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3848687, 'AR', 'Las Breñas', 'Las Brenas', -27.0897, -61.0816, 'P', 'PPLA2', 'AR.03', 'AR.03.22105', 26955, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3848950, 'AR', 'La Rioja', 'La Rioja', -29.4111, -66.8507, 'P', 'PPLA', 'AR.12', 'AR.12.46014', 162620, 'America/Argentina/La_Rioja', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3849140, 'AR', 'La Quiaca', 'La Quiaca', -22.1024, -65.593, 'P', 'PPLA2', 'AR.10', 'AR.10.38112', 14751, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3850005, 'AR', 'Lamarque', 'Lamarque', -39.423, -65.7021, 'P', 'PPL', 'AR.16', 'AR.16.62014', 7819, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3850920, 'AR', 'Laguna Paiva', 'Laguna Paiva', -31.3039, -60.6589, 'P', 'PPL', 'AR.21', 'AR.21.82063', 12250, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3850929, 'AR', 'Laguna Larga', 'Laguna Larga', -31.7765, -63.801, 'P', 'PPL', 'AR.05', 'AR.05.14119', 7137, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3851331, 'AR', 'La Falda', 'La Falda', -31.0884, -64.4899, 'P', 'PPL', 'AR.05', 'AR.05.14091', 15112, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3851798, 'AR', 'La Cumbre', 'La Cumbre', -30.982, -64.4914, 'P', 'PPL', 'AR.05', 'AR.05.14091', 7235, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3851985, 'AR', 'La Cocha', 'La Cocha', -27.7773, -65.5704, 'P', 'PPLA2', 'AR.24', 'AR.24.90049', 7066, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3852279, 'AR', 'La Carlota', 'La Carlota', -33.4199, -63.2977, 'P', 'PPLA2', 'AR.05', 'AR.05.14056', 11490, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3852374, 'AR', 'La Calera', 'La Calera', -31.3438, -64.3353, 'P', 'PPL', 'AR.05', 'AR.05.14021', 24796, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3852468, 'AR', 'Laboulaye', 'Laboulaye', -34.1266, -63.3912, 'P', 'PPLA2', 'AR.05', 'AR.05.14084', 19908, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3852480, 'AR', 'Laborde', 'Laborde', -33.1532, -62.8566, 'P', 'PPL', 'AR.05', 'AR.05.14182', 5492, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853330, 'AR', 'Justo Daract', 'Justo Daract', -33.8594, -65.1828, 'P', 'PPL', 'AR.19', 'AR.19.74035', 9680, 'America/Argentina/San_Luis', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853331, 'AR', 'Justiniano Posse', 'Justiniano Posse', -32.8841, -62.6779, 'P', 'PPL', 'AR.05', 'AR.05.14182', 7406, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853350, 'AR', 'Junín de los Andes', 'Junin de los Andes', -39.9504, -71.0694, 'P', 'PPLA2', 'AR.15', 'AR.15.58049', 10592, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853354, 'AR', 'Junín', 'Junin', -34.5838, -60.9433, 'P', 'PPLA2', 'AR.01', 'AR.01.06413', 85007, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3853491, 'AR', 'Joaquín V. González', 'Joaquin V. Gonzalez', -25.0833, -64.1833, 'P', 'PPL', 'AR.17', 'AR.17.66112', 19185, 'America/Argentina/Salta', 1, '2016-02-01 23:00:00', '2016-02-01 23:00:00'),
(3853510, 'AR', 'Jesús María', 'Jesus Maria', -30.9815, -64.0942, 'P', 'PPLA2', 'AR.05', 'AR.05.14021', 26825, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853745, 'AR', 'Intendente Alvear', 'Intendente Alvear', -35.2338, -63.592, 'P', 'PPLA2', 'AR.11', 'AR.11.42056', 6990, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853767, 'AR', 'Ingenio La Esperanza', 'Ingenio La Esperanza', -24.2255, -64.839, 'P', 'PPL', 'AR.10', 'AR.10.38063', 5002, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853782, 'AR', 'Ingeniero Luis A. Huergo', 'Ingeniero Luis A. Huergo', -39.0833, -67.2333, 'P', 'PPL', 'AR.16', 'AR.16.62042', 6483, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853786, 'AR', 'Ingeniero Jacobacci', 'Ingeniero Jacobacci', -41.3292, -69.5501, 'P', 'PPL', 'AR.16', 'AR.16.62091', 5785, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853788, 'AR', 'Ingeniero Guillermo N. Juárez', 'Ingeniero Guillermo N. Juarez', -23.9, -61.85, 'P', 'PPLA2', 'AR.09', 'AR.09.34028', 10357, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853935, 'AR', 'Icaño', 'Icano', -28.9193, -65.3282, 'P', 'PPL', 'AR.02', 'AR.02.10070', 6857, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853967, 'AR', 'Humahuaca', 'Humahuaca', -23.2054, -65.3505, 'P', 'PPLA2', 'AR.10', 'AR.10.38028', 11369, 'America/Argentina/Jujuy', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3853974, 'AR', 'Huinca Renancó', 'Huinca Renanco', -34.8404, -64.3758, 'P', 'PPL', 'AR.05', 'AR.05.14035', 8637, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3853981, 'AR', 'Huillapima', 'Huillapima', -28.7253, -65.9787, 'P', 'PPL', 'AR.02', 'AR.02.10042', 7779, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3854008, 'AR', 'Huerta Grande', 'Huerta Grande', -31.0752, -64.4906, 'P', 'PPL', 'AR.05', 'AR.05.14091', 5630, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3854331, 'AR', 'Hernando', 'Hernando', -32.4266, -63.7333, 'P', 'PPL', 'AR.05', 'AR.05.14161', 10486, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3854336, 'AR', 'Hermoso Campo', 'Hermoso Campo', -27.6082, -61.3444, 'P', 'PPLA2', 'AR.03', 'AR.03.22039', 7435, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3854493, 'AR', 'Guatraché', 'Guatrache', -37.6678, -63.5302, 'P', 'PPLA2', 'AR.11', 'AR.11.42070', 5271, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3854724, 'AR', 'Graneros', 'Graneros', -27.6493, -65.4383, 'P', 'PPLA2', 'AR.24', 'AR.24.90035', 5263, 'America/Argentina/Tucuman', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3854895, 'AR', 'Granadero Baigorria', 'Granadero Baigorria', -32.8568, -60.7175, 'P', 'PPL', 'AR.21', 'AR.21.82084', 32427, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3854985, 'AR', 'Gobernador Gálvez', 'Gobernador Galvez', -33.0302, -60.6404, 'P', 'PPL', 'AR.21', 'AR.21.82084', 74650, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855041, 'AR', 'General Villegas', 'General Villegas', -35.0328, -63.0125, 'P', 'PPLA2', 'AR.01', 'AR.01.06392', 16270, 'America/Argentina/Buenos_Aires', 1, '2016-11-28 23:00:00', '2016-11-28 23:00:00'),
(3855065, 'AR', 'General Roca', 'General Roca', -39.0333, -67.5833, 'P', 'PPL', 'AR.16', 'AR.16.62042', 73212, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3855067, 'AR', 'General Ramírez', 'General Ramirez', -32.176, -60.2008, 'P', 'PPL', 'AR.08', 'AR.08.30021', 8614, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855074, 'AR', 'General Pinedo', 'General Pinedo', -27.3167, -61.2833, 'P', 'PPLA2', 'AR.03', 'AR.03.22036', 15741, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855075, 'AR', 'General Pico', 'General Pico', -35.6566, -63.7568, 'P', 'PPLA2', 'AR.11', 'AR.11.42105', 57029, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855098, 'AR', 'General Levalle', 'General Levalle', -34.0147, -63.9241, 'P', 'PPL', 'AR.05', 'AR.05.14084', 5492, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855114, 'AR', 'General Fernández Oro', 'General Fernandez Oro', -38.953, -67.9249, 'P', 'PPL', 'AR.16', 'AR.16.62042', 6813, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3855116, 'AR', 'General Enrique Mosconi', 'General Enrique Mosconi', -22.5959, -63.8125, 'P', 'PPL', 'AR.17', 'AR.17.66056', 19811, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855121, 'AR', 'General Conesa', 'General Conesa', -40.1, -64.4333, 'P', 'PPLA2', 'AR.16', 'AR.16.62028', 5595, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855124, 'AR', 'General Cabrera', 'General Cabrera', -32.8131, -63.8724, 'P', 'PPL', 'AR.05', 'AR.05.14056', 10351, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855143, 'AR', 'General Acha', 'General Acha', -37.377, -64.6043, 'P', 'PPLA2', 'AR.11', 'AR.11.42154', 12536, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855244, 'AR', 'Gálvez', 'Galvez', -32.0293, -61.221, 'P', 'PPL', 'AR.21', 'AR.21.82105', 18374, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855284, 'AR', 'Gaimán', 'Gaiman', -43.2897, -65.4929, 'P', 'PPLA2', 'AR.04', 'AR.04.26042', 5753, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855302, 'AR', 'Funes', 'Funes', -32.9157, -60.81, 'P', 'PPL', 'AR.21', 'AR.21.82084', 14750, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855368, 'AR', 'Fray Luis Beltrán', 'Fray Luis Beltran', -39.3167, -65.7667, 'P', 'PPL', 'AR.16', 'AR.16.62014', 6401, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855370, 'AR', 'Fray Luis A. Beltrán', 'Fray Luis A. Beltran', -32.7912, -60.7282, 'P', 'PPL', 'AR.21', 'AR.21.82119', 14390, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855394, 'AR', 'Fraile Pintado', 'Fraile Pintado', -23.9408, -64.7994, 'P', 'PPL', 'AR.10', 'AR.10.38035', 13682, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855554, 'AR', 'Firmat', 'Firmat', -33.4594, -61.4832, 'P', 'PPL', 'AR.21', 'AR.21.82042', 18294, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855588, 'AR', 'Fiambalá', 'Fiambala', -27.687, -67.6149, 'P', 'PPL', 'AR.02', 'AR.02.10105', 8061, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3855666, 'AR', 'Famaillá', 'Famailla', -27.0541, -65.4033, 'P', 'PPLA2', 'AR.24', 'AR.24.90028', 30951, 'America/Argentina/Tucuman', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3855974, 'AR', 'Esquel', 'Esquel', -42.9115, -71.3195, 'P', 'PPL', 'AR.04', 'AR.04.26035', 28486, 'America/Argentina/Catamarca', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3856022, 'AR', 'Esperanza', 'Esperanza', -31.4488, -60.9317, 'P', 'PPLA2', 'AR.21', 'AR.21.82070', 35885, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3856231, 'AR', 'Embarcación', 'Embarcacion', -23.21, -64.0996, 'P', 'PPL', 'AR.17', 'AR.17.66056', 23961, 'America/Argentina/Salta', 1, '2015-05-22 23:00:00', '2015-05-22 23:00:00'),
(3856235, 'AR', 'Embalse', 'Embalse', -32.18, -64.4181, 'P', 'PPL', 'AR.05', 'AR.05.14007', 15900, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3856436, 'AR', 'El Trébol', 'El Trebol', -32.2008, -61.7014, 'P', 'PPL', 'AR.21', 'AR.21.82126', 10871, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3857012, 'AR', 'El Quebrachal', 'El Quebrachal', -25.2833, -64.0667, 'P', 'PPL', 'AR.17', 'AR.17.66007', 10243, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3857974, 'AR', 'El Galpón', 'El Galpon', -25.3807, -64.6526, 'P', 'PPL', 'AR.17', 'AR.17.66112', 8357, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3858553, 'AR', 'El Carril', 'El Carril', -25.0741, -65.4917, 'P', 'PPL', 'AR.17', 'AR.17.66042', 9780, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3858677, 'AR', 'El Calafate', 'El Calafate', -50.3408, -72.2768, 'P', 'PPL', 'AR.20', 'AR.20.78028', 8000, 'America/Argentina/Rio_Gallegos', 1, '2017-07-19 23:00:00', '2017-07-19 23:00:00'),
(3858765, 'AR', 'El Bolsón', 'El Bolson', -41.9605, -71.5334, 'P', 'PPL', 'AR.16', 'AR.16.62021', 15537, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859036, 'AR', 'Eduardo Castex', 'Eduardo Castex', -35.915, -64.2945, 'P', 'PPLA2', 'AR.11', 'AR.11.42035', 9861, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859384, 'AR', 'Diamante', 'Diamante', -32.0664, -60.6384, 'P', 'PPLA2', 'AR.08', 'AR.08.30021', 19545, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859409, 'AR', 'Devoto', 'Devoto', -31.4043, -62.3063, 'P', 'PPL', 'AR.05', 'AR.05.14140', 5597, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859429, 'AR', 'Despeñaderos', 'Despenaderos', -31.8163, -64.2899, 'P', 'PPL', 'AR.05', 'AR.05.14147', 5645, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859512, 'AR', 'Deán Funes', 'Dean Funes', -30.4204, -64.3498, 'P', 'PPLA2', 'AR.05', 'AR.05.14049', 20164, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859552, 'AR', 'Cutral-Có', 'Cutral-Co', -38.9342, -69.2305, 'P', 'PPL', 'AR.15', 'AR.15.58035', 47380, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3859828, 'AR', 'Cruz del Eje', 'Cruz del Eje', -30.7264, -64.8039, 'P', 'PPLA2', 'AR.05', 'AR.05.14028', 28166, 'America/Argentina/Cordoba', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3859839, 'AR', 'Cruz Alta', 'Cruz Alta', -33.0089, -61.8075, 'P', 'PPL', 'AR.05', 'AR.05.14063', 6862, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859904, 'AR', 'Crespo', 'Crespo', -32.0287, -60.3066, 'P', 'PPL', 'AR.08', 'AR.08.30084', 18296, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859965, 'AR', 'Cosquín', 'Cosquin', -31.2451, -64.4656, 'P', 'PPLA2', 'AR.05', 'AR.05.14091', 19070, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3859974, 'AR', 'Corzuela', 'Corzuela', -26.9537, -60.9693, 'P', 'PPLA2', 'AR.03', 'AR.03.22049', 10470, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860129, 'AR', 'Corral de Bustos', 'Corral de Bustos', -33.2821, -62.1846, 'P', 'PPL', 'AR.05', 'AR.05.14063', 9882, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860164, 'AR', 'Coronel Suárez', 'Coronel Suarez', -37.4547, -61.9334, 'P', 'PPLA2', 'AR.01', 'AR.01.06203', 27000, 'America/Argentina/Buenos_Aires', 1, '2016-03-05 23:00:00', '2016-03-05 23:00:00'),
(3860178, 'AR', 'Coronel Moldes', 'Coronel Moldes', -33.6227, -64.5971, 'P', 'PPL', 'AR.05', 'AR.05.14098', 8104, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860197, 'AR', 'Coronel Du Graty', 'Coronel Du Graty', -27.6804, -60.9146, 'P', 'PPL', 'AR.03', 'AR.03.22098', 9140, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860199, 'AR', 'Coronel Dorrego', 'Coronel Dorrego', -38.7187, -61.2873, 'P', 'PPLA2', 'AR.01', 'AR.01.06189', 11644, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3860217, 'AR', 'Coronda', 'Coronda', -31.9726, -60.9198, 'P', 'PPLA2', 'AR.21', 'AR.21.82105', 16975, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860259, 'AR', 'Córdoba', 'Cordoba', -31.4135, -64.1811, 'P', 'PPLA', 'AR.05', 'AR.05.14014', 1428214, 'America/Argentina/Cordoba', 1, '2016-07-28 23:00:00', '2016-07-28 23:00:00'),
(3860419, 'AR', 'Concepción del Bermejo', 'Concepcion del Bermejo', -26.5993, -60.9462, 'P', 'PPL', 'AR.03', 'AR.03.22007', 5830, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3860443, 'AR', 'Comodoro Rivadavia', 'Comodoro Rivadavia', -45.8641, -67.4966, 'P', 'PPLA2', 'AR.04', 'AR.04.26021', 140850, 'America/Argentina/Catamarca', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861002, 'AR', 'Clodomira', 'Clodomira', -27.5744, -64.1311, 'P', 'PPL', 'AR.22', 'AR.22.86035', 9043, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861056, 'AR', 'Cipolletti', 'Cipolletti', -38.9339, -67.9903, 'P', 'PPL', 'AR.16', 'AR.16.62042', 75078, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3861061, 'AR', 'Cinco Saltos', 'Cinco Saltos', -38.8223, -68.0629, 'P', 'PPL', 'AR.16', 'AR.16.62042', 19819, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3861262, 'AR', 'Chos Malal', 'Chos Malal', -37.3781, -70.2709, 'P', 'PPLA2', 'AR.15', 'AR.15.58042', 11721, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861329, 'AR', 'Choele Choel', 'Choele Choel', -39.2667, -65.6833, 'P', 'PPLA2', 'AR.16', 'AR.16.62014', 9791, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861344, 'AR', 'Chivilcoy', 'Chivilcoy', -34.8957, -60.0167, 'P', 'PPLA2', 'AR.01', 'AR.01.06224', 54514, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3861416, 'AR', 'Chimbas', 'Chimbas', -31.4833, -68.5333, 'P', 'PPLA2', 'AR.18', 'AR.18.70042', 73829, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3861445, 'AR', 'Chilecito', 'Chilecito', -29.1619, -67.4974, 'P', 'PPLA2', 'AR.12', 'AR.12.46042', 42248, 'America/Argentina/La_Rioja', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3861494, 'AR', 'Chicoana', 'Chicoana', -25.1009, -65.5331, 'P', 'PPLA2', 'AR.17', 'AR.17.66042', 8468, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3861678, 'AR', 'Charata', 'Charata', -27.2144, -61.188, 'P', 'PPLA2', 'AR.03', 'AR.03.22028', 27813, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861824, 'AR', 'Chamical', 'Chamical', -30.36, -66.314, 'P', 'PPLA2', 'AR.12', 'AR.12.46035', 13383, 'America/Argentina/La_Rioja', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3861953, 'AR', 'Chacabuco', 'Chacabuco', -34.6417, -60.4739, 'P', 'PPLA2', 'AR.01', 'AR.01.06210', 34587, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3861966, 'AR', 'Cervantes', 'Cervantes', -39.05, -67.3833, 'P', 'PPL', 'AR.16', 'AR.16.62042', 5173, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862100, 'AR', 'Ceres', 'Ceres', -29.881, -61.945, 'P', 'PPL', 'AR.21', 'AR.21.82091', 13063, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862144, 'AR', 'Centenario', 'Centenario', -38.8296, -68.1318, 'P', 'PPL', 'AR.15', 'AR.15.58035', 28956, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3862240, 'AR', 'Caucete', 'Caucete', -31.6518, -68.2811, 'P', 'PPLA2', 'AR.18', 'AR.18.70035', 33609, 'America/Argentina/San_Juan', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862254, 'AR', 'Catriel', 'Catriel', -37.8791, -67.7956, 'P', 'PPL', 'AR.16', 'AR.16.62042', 15169, 'America/Argentina/Salta', 1, '2016-03-05 23:00:00', '2016-03-05 23:00:00'),
(3862320, 'AR', 'Castelli', 'Castelli', -25.9468, -60.6195, 'P', 'PPLA2', 'AR.03', 'AR.03.22063', 36588, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862351, 'AR', 'Casilda', 'Casilda', -33.0442, -61.1681, 'P', 'PPLA2', 'AR.21', 'AR.21.82014', 32002, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862655, 'AR', 'Carcarañá', 'Carcarana', -32.8568, -61.1533, 'P', 'PPL', 'AR.21', 'AR.21.82119', 15619, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862738, 'AR', 'Capitán Bermúdez', 'Capitan Bermudez', -32.8226, -60.7185, 'P', 'PPL', 'AR.21', 'AR.21.82119', 27060, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862761, 'AR', 'Capilla del Monte', 'Capilla del Monte', -30.8609, -64.5251, 'P', 'PPL', 'AR.05', 'AR.05.14091', 9085, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862772, 'AR', 'Capayán', 'Capayan', -28.761, -66.0502, 'P', 'PPL', 'AR.02', 'AR.02.10042', 6358, 'America/Argentina/Catamarca', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(3862883, 'AR', 'Canals', 'Canals', -33.5654, -62.8893, 'P', 'PPL', 'AR.05', 'AR.05.14182', 8343, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3862981, 'AR', 'Cañada de Gómez', 'Canada de Gomez', -32.8164, -61.3949, 'P', 'PPLA2', 'AR.21', 'AR.21.82056', 36000, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863095, 'AR', 'Campo Largo', 'Campo Largo', -26.8008, -60.8422, 'P', 'PPLA2', 'AR.03', 'AR.03.22070', 10743, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863136, 'AR', 'Campo Gallo', 'Campo Gallo', -26.5833, -62.85, 'P', 'PPLA2', 'AR.22', 'AR.22.86014', 5455, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863362, 'AR', 'Calingasta', 'Calingasta', -31.3339, -69.4208, 'P', 'PPL', 'AR.18', 'AR.18.70021', 8176, 'America/Argentina/San_Juan', 1, '2017-08-22 23:00:00', '2017-08-22 23:00:00'),
(3863366, 'AR', 'Calilegua', 'Calilegua', -23.7737, -64.77, 'P', 'PPL', 'AR.10', 'AR.10.38035', 5174, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863379, 'AR', 'Caleta Olivia', 'Caleta Olivia', -46.4393, -67.5281, 'P', 'PPL', 'AR.20', 'AR.20.78014', 36077, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863419, 'AR', 'Calchaquí', 'Calchaqui', -29.8877, -60.287, 'P', 'PPL', 'AR.21', 'AR.21.82133', 10221, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863491, 'AR', 'Caimancito', 'Caimancito', -23.7407, -64.5937, 'P', 'PPL', 'AR.10', 'AR.10.38035', 5403, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3863503, 'AR', 'Cafayate', 'Cafayate', -26.0729, -65.9777, 'P', 'PPL', 'AR.17', 'AR.17.66021', 11785, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3863833, 'AR', 'Brinkmann', 'Brinkmann', -30.8659, -62.0374, 'P', 'PPL', 'AR.05', 'AR.05.14140', 8237, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3864274, 'AR', 'Berrotarán', 'Berrotaran', -32.451, -64.3887, 'P', 'PPL', 'AR.05', 'AR.05.14098', 6446, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3864328, 'AR', 'Beltrán', 'Beltran', -27.8291, -64.061, 'P', 'PPL', 'AR.22', 'AR.22.86161', 5321, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3864331, 'AR', 'Bell Ville', 'Bell Ville', -32.6259, -62.6887, 'P', 'PPLA2', 'AR.05', 'AR.05.14182', 35105, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3864375, 'AR', 'Bella Vista', 'Bella Vista', -27.0342, -65.302, 'P', 'PPLA2', 'AR.24', 'AR.24.90056', 15126, 'America/Argentina/Tucuman', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3864888, 'AR', 'Balnearia', 'Balnearia', -31.0088, -62.6673, 'P', 'PPL', 'AR.05', 'AR.05.14140', 5585, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865086, 'AR', 'Bahía Blanca', 'Bahia Blanca', -38.7196, -62.2724, 'P', 'PPLA2', 'AR.01', 'AR.01.06056', 276546, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3865186, 'AR', 'Aviá Terai', 'Avia Terai', -26.6853, -60.7292, 'P', 'PPL', 'AR.03', 'AR.03.22070', 6821, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865385, 'AR', 'Arroyo Seco', 'Arroyo Seco', -33.1549, -60.5086, 'P', 'PPL', 'AR.21', 'AR.21.82084', 20008, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865424, 'AR', 'Arroyito', 'Arroyito', -31.4202, -63.05, 'P', 'PPL', 'AR.05', 'AR.05.14140', 19577, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865449, 'AR', 'Armstrong', 'Armstrong', -32.7822, -61.6022, 'P', 'PPL', 'AR.21', 'AR.21.82007', 10388, 'America/Argentina/Cordoba', 1, '2016-06-21 23:00:00', '2016-06-21 23:00:00'),
(3865474, 'AR', 'Arias', 'Arias', -33.6441, -62.4027, 'P', 'PPL', 'AR.05', 'AR.05.14063', 6928, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865579, 'AR', 'Arauco', 'Arauco', -28.5805, -66.7944, 'P', 'PPL', 'AR.12', 'AR.12.46007', 13720, 'America/Argentina/La_Rioja', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3865605, 'AR', 'Apolinario Saravia', 'Apolinario Saravia', -24.4328, -63.9953, 'P', 'PPL', 'AR.17', 'AR.17.66007', 8595, 'America/Argentina/Salta', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3865802, 'AR', 'Andalgalá', 'Andalgala', -27.6001, -66.3179, 'P', 'PPLA2', 'AR.02', 'AR.02.10021', 14068, 'America/Argentina/Catamarca', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3865840, 'AR', 'Añatuya', 'Anatuya', -28.4606, -62.8347, 'P', 'PPLA2', 'AR.22', 'AR.22.86077', 20261, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3866163, 'AR', 'Alta Gracia', 'Alta Gracia', -31.6529, -64.4283, 'P', 'PPLA2', 'AR.05', 'AR.05.14147', 40384, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3866237, 'AR', 'Almafuerte', 'Almafuerte', -32.193, -64.2556, 'P', 'PPL', 'AR.05', 'AR.05.14161', 10534, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3866242, 'AR', 'Allen', 'Allen', -38.9774, -67.8271, 'P', 'PPL', 'AR.16', 'AR.16.62042', 26083, 'America/Argentina/Salta', 1, '2015-12-08 23:00:00', '2015-12-08 23:00:00'),
(3866367, 'AR', 'Alderetes', 'Alderetes', -26.8167, -65.1333, 'P', 'PPL', 'AR.24', 'AR.24.90014', 38466, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3866425, 'AR', 'Albardón', 'Albardon', -31.4372, -68.5256, 'P', 'PPL', 'AR.18', 'AR.18.70007', 20413, 'America/Argentina/San_Juan', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(3866496, 'AR', 'Aguilares', 'Aguilares', -27.4338, -65.6143, 'P', 'PPLA2', 'AR.24', 'AR.24.90077', 32494, 'America/Argentina/Tucuman', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3866935, 'AR', 'Adelia María', 'Adelia Maria', -33.6315, -64.021, 'P', 'PPL', 'AR.05', 'AR.05.14098', 6434, 'America/Argentina/Cordoba', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3867009, 'AR', 'Abra Pampa', 'Abra Pampa', -22.7205, -65.697, 'P', 'PPLA2', 'AR.10', 'AR.10.38007', 9425, 'America/Argentina/Jujuy', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(3867625, 'CL', 'Yumbel', 'Yumbel', -37.0982, -72.5608, 'P', 'PPL', 'CL.06', 'CL.06.83', 11111, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3868121, 'CL', 'Viña del Mar', 'Vina del Mar', -33.0246, -71.5518, 'P', 'PPL', 'CL.01', 'CL.01.51', 294551, 'America/Santiago', 1, '2017-02-19 23:00:00', '2017-02-19 23:00:00'),
(3868158, 'CL', 'Villarrica', 'Villarrica', -39.2857, -72.2279, 'P', 'PPL', 'CL.04', 'CL.04.91', 31602, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3868192, 'CL', 'Villa Alemana', 'Villa Alemana', -33.0422, -71.3733, 'P', 'PPLA3', 'CL.01', 'CL.01.58', 97320, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3868210, 'CL', 'Vilcún', 'Vilcun', -38.6688, -72.2256, 'P', 'PPL', 'CL.04', 'CL.04.91', 9241, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3868308, 'CL', 'Vicuña', 'Vicuna', -30.0354, -70.7127, 'P', 'PPL', 'CL.07', 'CL.07.41', 13496, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3868326, 'CL', 'Victoria', 'Victoria', -38.2329, -72.3329, 'P', 'PPL', 'CL.04', 'CL.04.92', 24555, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3868626, 'CL', 'Valparaíso', 'Valparaiso', -33.036, -71.6296, 'P', 'PPLA', 'CL.01', 'CL.01.51', 282448, 'America/Santiago', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(3868633, 'CL', 'Vallenar', 'Vallenar', -28.5762, -70.7594, 'P', 'PPL', 'CL.05', 'CL.05.33', 44895, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3868707, 'CL', 'Valdivia', 'Valdivia', -39.8142, -73.2459, 'P', 'PPLA', 'CL.17', 'CL.17.141', 133419, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3869381, 'CL', 'Traiguén', 'Traiguen', -38.2496, -72.6703, 'P', 'PPL', 'CL.04', 'CL.04.92', 14481, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3869657, 'CL', 'Tomé', 'Tome', -36.6176, -72.9559, 'P', 'PPL', 'CL.06', 'CL.06.81', 46698, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3869716, 'CL', 'Tocopilla', 'Tocopilla', -22.092, -70.1979, 'P', 'PPL', 'CL.03', 'CL.03.23', 24460, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3869979, 'CL', 'Teno', 'Teno', -34.8705, -71.1622, 'P', 'PPL', 'CL.11', 'CL.11.73', 6858, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3870011, 'CL', 'Temuco', 'Temuco', -38.7397, -72.5984, 'P', 'PPLA', 'CL.04', 'CL.04.91', 238129, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3870243, 'CL', 'Taltal', 'Taltal', -25.4087, -70.4836, 'P', 'PPL', 'CL.03', NULL, 10018, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3870282, 'CL', 'Talcahuano', 'Talcahuano', -36.7249, -73.1168, 'P', 'PPL', 'CL.06', 'CL.06.81', 252968, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3870294, 'CL', 'Talca', 'Talca', -35.4264, -71.6554, 'P', 'PPLA', 'CL.11', 'CL.11.71', 197479, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3870306, 'CL', 'Talagante', 'Talagante', -33.6639, -70.9273, 'P', 'PPL', 'CL.12', 'CL.12.136', 51764, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3871276, 'CL', 'San Vicente de Tagua Tagua', 'San Vicente de Tagua Tagua', -34.4386, -71.0775, 'P', 'PPL', 'CL.08', 'CL.08.61', 29560, 'America/Santiago', 1, '2015-10-27 23:00:00', '2015-10-27 23:00:00'),
(3871286, 'CL', 'San Vicente', 'San Vicente', -34.4333, -71.0833, 'P', 'PPL', 'CL.08', 'CL.08.61', 22572, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3871336, 'CL', 'Santiago', 'Santiago', -33.4569, -70.6483, 'P', 'PPLC', 'CL.12', 'CL.12.131', 4837295, 'America/Santiago', 1, '2016-07-04 23:00:00', '2016-07-04 23:00:00'),
(3871616, 'CL', 'Santa Cruz', 'Santa Cruz', -34.6388, -71.3658, 'P', 'PPL', 'CL.08', 'CL.08.63', 33283, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3872154, 'CL', 'San Javier', 'San Javier', -35.5952, -71.7292, 'P', 'PPL', 'CL.11', 'CL.11.74', 22427, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3872255, 'CL', 'San Felipe', 'San Felipe', -32.7498, -70.7258, 'P', 'PPL', 'CL.01', 'CL.01.57', 59294, 'America/Santiago', 1, '2017-08-17 23:00:00', '2017-08-17 23:00:00'),
(3872306, 'CL', 'San Clemente', 'San Clemente', -35.5378, -71.487, 'P', 'PPL', 'CL.11', 'CL.11.71', 13656, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3872326, 'CL', 'San Carlos', 'San Carlos', -36.4248, -71.958, 'P', 'PPL', 'CL.06', 'CL.06.84', 31517, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3872348, 'CL', 'San Bernardo', 'San Bernardo', -33.5922, -70.6996, 'P', 'PPL', 'CL.12', 'CL.12.134', 249858, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3872395, 'CL', 'San Antonio', 'San Antonio', -33.5947, -71.6075, 'P', 'PPL', 'CL.01', 'CL.01.56', 85651, 'America/Santiago', 1, '2016-02-27 23:00:00', '2016-02-27 23:00:00'),
(3872594, 'CL', 'Salamanca', 'Salamanca', -31.7792, -70.9639, 'P', 'PPL', 'CL.07', 'CL.07.42', 13265, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3873145, 'CL', 'Río Bueno', 'Rio Bueno', -40.3349, -72.9556, 'P', 'PPL', 'CL.17', 'CL.17.142', 15456, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3873441, 'CL', 'Rengo', 'Rengo', -34.4064, -70.8583, 'P', 'PPL', 'CL.08', 'CL.08.61', 38100, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3873668, 'CL', 'Rauco', 'Rauco', -34.9255, -71.3172, 'P', 'PPL', 'CL.11', 'CL.11.73', 8566, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3873775, 'CL', 'Rancagua', 'Rancagua', -34.1708, -70.7444, 'P', 'PPLA', 'CL.08', 'CL.08.61', 212695, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3874096, 'CL', 'Quilpué', 'Quilpue', -33.0475, -71.4425, 'P', 'PPL', 'CL.01', 'CL.01.58', 130263, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3874119, 'CL', 'Quillota', 'Quillota', -32.8834, -71.2488, 'P', 'PPL', 'CL.01', 'CL.01.55', 67779, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3874579, 'CL', 'Purranque', 'Purranque', -40.9131, -73.1591, 'P', 'PPL', 'CL.14', 'CL.14.103', 13619, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3874787, 'CL', 'Punta Arenas', 'Punta Arenas', -53.1548, -70.9113, 'P', 'PPLA', 'CL.10', 'CL.10.121', 117430, 'America/Punta_Arenas', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3874930, 'CL', 'Puerto Varas', 'Puerto Varas', -41.3195, -72.9854, 'P', 'PPL', 'CL.14', 'CL.14.101', 24958, 'America/Santiago', 1, '2013-01-25 23:00:00', '2013-01-25 23:00:00'),
(3874943, 'CL', 'Quellón', 'Quellon', -43.1182, -73.6166, 'P', 'PPL', 'CL.14', 'CL.14.102', 21823, 'America/Santiago', 1, '2016-11-22 23:00:00', '2016-11-22 23:00:00'),
(3874958, 'CL', 'Puerto Natales', 'Puerto Natales', -51.7299, -72.506, 'P', 'PPL', 'CL.10', 'CL.10.124', 20000, 'America/Punta_Arenas', 1, '2017-12-15 23:00:00', '2017-12-15 23:00:00'),
(3874960, 'CL', 'Puerto Montt', 'Puerto Montt', -41.4693, -72.9424, 'P', 'PPLA', 'CL.14', 'CL.14.101', 160054, 'America/Santiago', 1, '2017-12-10 23:00:00', '2017-12-10 23:00:00'),
(3874997, 'CL', 'Puerto Aisén', 'Puerto Aisen', -45.403, -72.6918, 'P', 'PPL', 'CL.02', 'CL.02.112', 16936, 'America/Santiago', 1, '2017-03-04 23:00:00', '2017-03-04 23:00:00'),
(3875024, 'CL', 'Puente Alto', 'Puente Alto', -33.6117, -70.5758, 'P', 'PPL', 'CL.12', 'CL.12.132', 510417, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3875070, 'CL', 'Pucón', 'Pucon', -39.2822, -71.9543, 'P', 'PPL', 'CL.04', 'CL.04.91', 26953, 'America/Santiago', 1, '2017-02-19 23:00:00', '2017-02-19 23:00:00'),
(3875746, 'CL', 'Pitrufquén', 'Pitrufquen', -38.9864, -72.6372, 'P', 'PPL', 'CL.04', 'CL.04.91', 13743, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3876664, 'CL', 'Penco', 'Penco', -36.7407, -72.9953, 'P', 'PPL', 'CL.06', 'CL.06.81', 46091, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3876685, 'CL', 'Peñaflor', 'Penaflor', -33.6063, -70.8765, 'P', 'PPL', 'CL.12', 'CL.12.136', 65495, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3877146, 'CL', 'Parral', 'Parral', -36.1431, -71.826, 'P', 'PPL', 'CL.11', 'CL.11.74', 26904, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3877348, 'CL', 'Panguipulli', 'Panguipulli', -39.6436, -72.3327, 'P', 'PPL', 'CL.04', NULL, 16312, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3877739, 'CL', 'Paine', 'Paine', -33.808, -70.7411, 'P', 'PPL', 'CL.12', 'CL.12.134', 32766, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3877918, 'CL', 'Ovalle', 'Ovalle', -30.6011, -71.199, 'P', 'PPL', 'CL.07', 'CL.07.43', 77138, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3877949, 'CL', 'Osorno', 'Osorno', -40.574, -73.1335, 'P', 'PPL', 'CL.14', 'CL.14.103', 135773, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3878456, 'CL', 'Nueva Imperial', 'Nueva Imperial', -38.7445, -72.9502, 'P', 'PPL', 'CL.04', 'CL.04.91', 18777, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3879123, 'CL', 'Nacimiento', 'Nacimiento', -37.5025, -72.6731, 'P', 'PPL', 'CL.06', 'CL.06.83', 21220, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3879200, 'CL', 'Mulchén', 'Mulchen', -37.7189, -72.241, 'P', 'PPL', 'CL.06', 'CL.06.83', 22170, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3879429, 'CL', 'Monte Patria', 'Monte Patria', -30.695, -70.9577, 'P', 'PPL', 'CL.07', 'CL.07.43', 13945, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3879627, 'CL', 'Molina', 'Molina', -35.1143, -71.2823, 'P', 'PPL', 'CL.11', 'CL.11.73', 28775, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3880107, 'CL', 'Melipilla', 'Melipilla', -33.6891, -71.2153, 'P', 'PPL', 'CL.12', 'CL.12.135', 63100, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3881102, 'CL', 'Machalí', 'Machali', -34.1808, -70.6493, 'P', 'PPL', 'CL.08', 'CL.08.61', 27595, 'America/Santiago', 1, '2013-04-03 23:00:00', '2013-04-03 23:00:00'),
(3881276, 'CL', 'Lota', 'Lota', -37.0899, -73.1577, 'P', 'PPL', 'CL.06', 'CL.06.81', 49763, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3882428, 'CL', 'Los Ángeles', 'Los Angeles', -37.4697, -72.3537, 'P', 'PPLA2', 'CL.06', 'CL.06.83', 125430, 'America/Santiago', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(3882434, 'CL', 'Los Andes', 'Los Andes', -32.8337, -70.5983, 'P', 'PPL', 'CL.01', 'CL.01.53', 56859, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3882559, 'CL', 'Longaví', 'Longavi', -35.965, -71.6836, 'P', 'PPL', 'CL.11', 'CL.11.74', 6325, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3882582, 'CL', 'Loncoche', 'Loncoche', -39.3671, -72.6309, 'P', 'PPL', 'CL.04', 'CL.04.91', 15590, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3883035, 'CL', 'Llaillay', 'Llaillay', -32.8404, -70.9562, 'P', 'PPL', 'CL.01', 'CL.01.57', 16646, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3883167, 'CL', 'Linares', 'Linares', -35.8467, -71.5931, 'P', 'PPL', 'CL.11', 'CL.11.74', 69535, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3883214, 'CL', 'Limache', 'Limache', -33.0167, -71.2667, 'P', 'PPLA3', 'CL.01', 'CL.01.58', 35876, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3883457, 'CL', 'Lebu', 'Lebu', -37.6082, -73.6536, 'P', 'PPL', 'CL.06', 'CL.06.82', 22345, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3883615, 'CL', 'Lautaro', 'Lautaro', -38.5307, -72.4365, 'P', 'PPL', 'CL.04', 'CL.04.91', 21579, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3883629, 'CL', 'La Unión', 'La Union', -40.2931, -73.0817, 'P', 'PPL', 'CL.17', NULL, 26298, 'America/Santiago', 1, '2016-01-26 23:00:00', '2016-01-26 23:00:00'),
(3884373, 'CL', 'La Serena', 'La Serena', -29.9045, -71.2489, 'P', 'PPLA', 'CL.07', 'CL.07.41', 154521, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3885273, 'CL', 'Lampa', 'Lampa', -33.2863, -70.8756, 'P', 'PPL', 'CL.12', 'CL.12.133', 29250, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3885456, 'CL', 'La Ligua', 'La Ligua', -32.4524, -71.2311, 'P', 'PPL', 'CL.01', 'CL.01.54', 24857, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3885509, 'CL', 'La Laja', 'La Laja', -37.2841, -72.7111, 'P', 'PPL', 'CL.06', 'CL.06.83', 16550, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3887127, 'CL', 'Iquique', 'Iquique', -20.2204, -70.1391, 'P', 'PPLA', 'CL.15', 'CL.15.11', 227499, 'America/Santiago', 1, '2012-12-04 23:00:00', '2012-12-04 23:00:00'),
(3887344, 'CL', 'Illapel', 'Illapel', -31.6335, -71.1697, 'P', 'PPL', 'CL.07', 'CL.07.42', 22816, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3888214, 'CL', 'Hacienda La Calera', 'Hacienda La Calera', -32.7833, -71.2167, 'P', 'PPL', 'CL.01', 'CL.01.55', 49106, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3888749, 'CL', 'Graneros', 'Graneros', -34.0686, -70.7275, 'P', 'PPL', 'CL.08', 'CL.08.61', 23301, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3889263, 'CL', 'Frutillar', 'Frutillar', -41.1268, -73.0437, 'P', 'PPL', 'CL.14', 'CL.14.101', 16939, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3889322, 'CL', 'Freire', 'Freire', -38.9525, -72.6265, 'P', 'PPL', 'CL.04', 'CL.04.91', 7813, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3890949, 'CL', 'El Monte', 'El Monte', -33.6797, -70.9848, 'P', 'PPL', 'CL.12', 'CL.12.136', 23090, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3892454, 'CL', 'Diego de Almagro', 'Diego de Almagro', -26.3667, -70.05, 'P', 'PPL', 'CL.05', 'CL.05.32', 18137, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3892870, 'CL', 'Curicó', 'Curico', -34.9828, -71.2394, 'P', 'PPL', 'CL.11', 'CL.11.73', 102438, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3892892, 'CL', 'Curanilahue', 'Curanilahue', -37.4779, -73.3449, 'P', 'PPL', 'CL.06', 'CL.06.82', 30611, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3893532, 'CL', 'Coronel', 'Coronel', -37.0339, -73.1402, 'P', 'PPL', 'CL.06', 'CL.06.81', 92940, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3893629, 'CL', 'Coquimbo', 'Coquimbo', -29.9533, -71.3395, 'P', 'PPL', 'CL.07', 'CL.07.41', 161317, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3893656, 'CL', 'Copiapó', 'Copiapo', -27.3668, -70.3314, 'P', 'PPLA', 'CL.05', 'CL.05.31', 129280, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3893726, 'CL', 'Constitución', 'Constitucion', -35.3332, -72.4116, 'P', 'PPL', 'CL.11', 'CL.11.71', 37917, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3893894, 'CL', 'Concepción', 'Concepcion', -36.827, -73.0498, 'P', 'PPLA', 'CL.06', 'CL.06.81', 215413, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3894177, 'CL', 'Collipulli', 'Collipulli', -37.9545, -72.4344, 'P', 'PPL', 'CL.04', 'CL.04.92', 16392, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3894406, 'CL', 'Coihueco', 'Coihueco', -36.6278, -71.8307, 'P', 'PPL', 'CL.06', 'CL.06.84', 7346, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3894426, 'CL', 'Coyhaique', 'Coyhaique', -45.5752, -72.0662, 'P', 'PPLA', 'CL.02', 'CL.02.111', 45787, 'America/Santiago', 1, '2017-04-07 23:00:00', '2017-04-07 23:00:00'),
(3894871, 'CL', 'Chonchi', 'Chonchi', -42.62, -73.7767, 'P', 'PPL', 'CL.14', 'CL.14.102', 12572, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3895061, 'CL', 'Chimbarongo', 'Chimbarongo', -34.7125, -71.0434, 'P', 'PPL', 'CL.08', 'CL.08.63', 17356, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3895088, 'CL', 'Chillán', 'Chillan', -36.6066, -72.1034, 'P', 'PPL', 'CL.06', 'CL.06.84', 150396, 'America/Santiago', 1, '2017-02-19 23:00:00', '2017-02-19 23:00:00'),
(3895138, 'CL', 'Chiguayante', 'Chiguayante', -36.9256, -73.0284, 'P', 'PPL', 'CL.06', 'CL.06.81', 82545, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3895165, 'CL', 'Chicureo Abajo', 'Chicureo Abajo', -33.2838, -70.6533, 'P', 'PPL', 'CL.12', 'CL.12.133', 18000, 'America/Santiago', 1, '2013-04-24 23:00:00', '2013-04-24 23:00:00'),
(3896105, 'CL', 'Cauquenes', 'Cauquenes', -35.9671, -72.3225, 'P', 'PPL', 'CL.11', 'CL.11.72', 31362, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3896218, 'CL', 'Castro', 'Castro', -42.4721, -73.7732, 'P', 'PPL', 'CL.14', 'CL.14.102', 29926, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3896433, 'CL', 'Cartagena', 'Cartagena', -33.5538, -71.6076, 'P', 'PPL', 'CL.01', 'CL.01.56', 16875, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3896774, 'CL', 'Carahue', 'Carahue', -38.7112, -73.161, 'P', 'PPL', 'CL.04', 'CL.04.91', 11875, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3896924, 'CL', 'Cañete', 'Canete', -37.8013, -73.3962, 'P', 'PPL', 'CL.06', 'CL.06.82', 20158, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3897334, 'CL', 'Calbuco', 'Calbuco', -41.7734, -73.1305, 'P', 'PPL', 'CL.14', NULL, 12490, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3897347, 'CL', 'Calama', 'Calama', -22.4567, -68.9237, 'P', 'PPL', 'CL.03', 'CL.03.22', 143084, 'America/Santiago', 1, '2016-06-03 23:00:00', '2016-06-03 23:00:00'),
(3897557, 'CL', 'Cabrero', 'Cabrero', -37.0339, -72.4047, 'P', 'PPL', 'CL.06', 'CL.06.83', 18327, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3897724, 'CL', 'Bulnes', 'Bulnes', -36.7423, -72.2985, 'P', 'PPL', 'CL.06', 'CL.06.84', 12715, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3897774, 'CL', 'Buin', 'Buin', -33.7326, -70.7428, 'P', 'PPL', 'CL.12', 'CL.12.134', 55441, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3899361, 'CL', 'Arica', 'Arica', -18.4746, -70.2979, 'P', 'PPLA', 'CL.16', 'CL.16.151', 185999, 'America/Santiago', 1, '2012-12-04 23:00:00', '2012-12-04 23:00:00'),
(3899462, 'CL', 'Arauco', 'Arauco', -37.2463, -73.3175, 'P', 'PPL', 'CL.06', 'CL.06.82', 24659, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(3899539, 'CL', 'Antofagasta', 'Antofagasta', -23.6524, -70.3954, 'P', 'PPLA', 'CL.03', 'CL.03.21', 309832, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(3899629, 'CL', 'Angol', 'Angol', -37.7952, -72.7164, 'P', 'PPL', 'CL.04', 'CL.04.92', 44856, 'America/Santiago', 1, '2013-03-12 23:00:00', '2013-03-12 23:00:00'),
(3899695, 'CL', 'Ancud', 'Ancud', -41.8707, -73.8162, 'P', 'PPL', 'CL.14', 'CL.14.102', 28020, 'America/Santiago', 1, '2013-01-10 23:00:00', '2013-01-10 23:00:00'),
(6458708, 'CL', 'Las Animas', 'Las Animas', -39.8087, -73.2182, 'P', 'PPL', 'CL.14', NULL, 30000, 'America/Santiago', 1, '2007-04-14 23:00:00', '2007-04-14 23:00:00'),
(6693228, 'AR', 'Balvanera', 'Balvanera', -34.6103, -58.3977, 'P', 'PPLX', 'AR.07', 'AR.07.02003', 152198, 'America/Argentina/Buenos_Aires', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(6693230, 'AR', 'Villa Santa Rita', 'Villa Santa Rita', -34.6108, -58.481, 'P', 'PPLX', 'AR.07', 'AR.07.02011', 34000, 'America/Argentina/Buenos_Aires', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(7116866, 'AR', 'Villa Mercedes', 'Villa Mercedes', -33.6757, -65.4578, 'P', 'PPL', 'AR.19', 'AR.19.74035', 96781, 'America/Argentina/San_Luis', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00');
INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(7281017, 'CL', 'La Pintana', 'La Pintana', -33.5833, -70.6342, 'P', 'PPL', 'CL.12', 'CL.12.131', 201178, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(7281020, 'CL', 'Lo Prado', 'Lo Prado', -33.4443, -70.7255, 'P', 'PPL', 'CL.12', 'CL.12.131', 104316, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(7284819, 'AR', 'La Punta', 'La Punta', -33.1837, -66.3127, 'P', 'PPLL', 'AR.19', 'AR.19.74056', 15000, 'America/Argentina/San_Luis', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(7647007, 'AR', 'San Carlos de Bariloche', 'San Carlos de Bariloche', -41.1456, -71.3082, 'P', 'PPLA3', 'AR.16', 'AR.16.62021', 95394, 'America/Argentina/Salta', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00'),
(7874740, 'CL', 'Villa Presidente Frei, Ñuñoa, Santiago, Chile', 'Villa Presidente Frei, Nunoa, Santiago, Chile', -33.4607, -70.5802, 'P', 'PPLX', 'CL.12', 'CL.12.131', 15000, 'America/Santiago', 1, '2012-05-02 23:00:00', '2012-05-02 23:00:00'),
(8521759, 'AR', 'Río Turbio', 'Rio Turbio', -51.5359, -72.3367, 'P', 'PPL', 'AR.20', 'AR.20.78021', 6650, 'America/Argentina/Rio_Gallegos', 1, '2016-01-29 23:00:00', '2016-01-29 23:00:00'),
(10172104, 'AR', 'Adrogué', 'Adrogue', -34.8004, -58.3838, 'P', 'PPL', 'AR.01', 'AR.01.06028', 28265, 'America/Argentina/Buenos_Aires', 1, '2015-04-21 23:00:00', '2015-04-21 23:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, '0', 0, 0, NULL, NULL),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, '0', 0, 0, NULL, NULL),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, '0', 0, 0, NULL, NULL),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, '0', 0, 0, NULL, NULL),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, '0', 0, 1, NULL, NULL),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, '0', 0, 0, NULL, NULL),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, '0', 0, 0, NULL, NULL),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, '0', 0, 0, NULL, NULL),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, '0', 0, 0, NULL, NULL),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, '0', 0, 0, NULL, NULL),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, '0', 0, 0, NULL, NULL),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, '0', 0, 0, NULL, NULL),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, '0', 0, 0, NULL, NULL),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, '0', 0, 0, NULL, NULL),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, '0', 0, 0, NULL, '2016-05-09 20:55:29'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, '0', 0, 0, NULL, NULL),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, '0', 0, 0, NULL, NULL),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, '0', 0, 0, NULL, NULL),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, '0', 0, 0, NULL, NULL),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, '0', 0, 0, NULL, NULL),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, '0', 0, 0, NULL, NULL),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, '0', 0, 1, NULL, '2019-04-03 22:08:26'),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, '0', 0, 0, NULL, NULL),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, '0', 0, 0, NULL, NULL),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, '0', 0, 0, NULL, NULL),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, '0', 0, 0, NULL, NULL),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, '0', 0, 0, NULL, NULL),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, '0', 0, 0, NULL, NULL),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, '0', 0, 0, NULL, NULL),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, '0', 0, 0, NULL, NULL),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, '0', 0, 0, NULL, NULL),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, '0', 0, 0, NULL, NULL),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, '0', 0, 0, NULL, NULL),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, '0', 0, 0, NULL, NULL),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, '0', 0, 0, NULL, NULL),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, '0', 0, 0, NULL, NULL),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, '0', 0, 0, NULL, NULL),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, '0', 0, 0, NULL, NULL),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, '0', 0, 0, NULL, NULL),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, '0', 0, 0, NULL, NULL),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, '0', 0, 0, NULL, NULL),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, '0', 0, 0, NULL, NULL),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, '0', 0, 0, NULL, NULL),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, '0', 0, 0, NULL, NULL),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, '0', 0, 0, NULL, NULL),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, '0', 0, 0, NULL, NULL),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, '0', 0, 0, NULL, NULL),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, '0', 0, 0, NULL, NULL),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, '0', 0, 0, NULL, NULL),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, '0', 0, 0, NULL, NULL),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, '0', 0, 0, NULL, NULL),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, '0', 0, 0, NULL, NULL),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, '0', 0, 0, NULL, NULL),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, '0', 0, 0, NULL, NULL),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, '0', 0, 0, NULL, NULL),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, '0', 0, 0, NULL, NULL),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, '0', 0, 0, NULL, NULL),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, '0', 0, 0, NULL, NULL),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, '0', 0, 0, NULL, NULL),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, '0', 0, 0, NULL, NULL),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, '0', 0, 0, NULL, NULL),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, '0', 0, 0, NULL, NULL),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, '0', 0, 0, NULL, NULL),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, '0', 0, 0, NULL, NULL),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, '0', 0, 0, NULL, NULL),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, '0', 0, 0, NULL, NULL),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, '0', 0, 0, NULL, NULL),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, '0', 0, 0, NULL, NULL),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, '0', 0, 0, NULL, NULL),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, '0', 0, 0, NULL, NULL),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, '0', 0, 0, NULL, NULL),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, '0', 0, 0, NULL, NULL),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, '0', 0, 0, NULL, NULL),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, '0', 0, 0, NULL, NULL),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, '0', 0, 0, NULL, NULL),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, '0', 0, 0, NULL, NULL),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, '0', 0, 0, NULL, NULL),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, '0', 0, 0, NULL, NULL),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, '0', 0, 0, NULL, NULL),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, '0', 0, 0, NULL, NULL),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, '0', 0, 0, NULL, NULL),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, '0', 0, 0, NULL, NULL),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, '0', 0, 0, NULL, NULL),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, '0', 0, 0, NULL, NULL),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, '0', 0, 0, NULL, NULL),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, '0', 0, 0, NULL, NULL),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, '0', 0, 0, NULL, NULL),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, '0', 0, 0, NULL, NULL),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, '0', 0, 0, NULL, NULL),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, '0', 0, 0, NULL, NULL),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, '0', 0, 0, NULL, NULL),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, '0', 0, 0, NULL, NULL),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, '0', 0, 0, NULL, NULL),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, '0', 0, 0, NULL, NULL),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, '0', 0, 0, NULL, NULL),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, '0', 0, 0, NULL, NULL),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, '0', 0, 0, NULL, NULL),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, '0', 0, 0, NULL, NULL),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, '0', 0, 0, NULL, NULL),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, '0', 0, 0, NULL, NULL),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, '0', 0, 0, NULL, NULL),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, '0', 0, 0, NULL, NULL),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, '0', 0, 0, NULL, NULL),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, '0', 0, 0, NULL, NULL),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, '0', 0, 0, NULL, NULL),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, '0', 0, 0, NULL, NULL),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, '0', 0, 0, NULL, NULL),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, '0', 0, 0, NULL, NULL),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, '0', 0, 0, NULL, NULL),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, '0', 0, 0, NULL, NULL),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, '0', 0, 0, NULL, NULL),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, '0', 0, 0, NULL, NULL),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, '0', 0, 0, NULL, NULL),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, '0', 0, 0, NULL, NULL),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, '0', 0, 0, NULL, NULL),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, '0', 0, 0, NULL, NULL),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, '0', 0, 0, NULL, NULL),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, '0', 0, 0, NULL, NULL),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, '0', 0, 0, NULL, NULL),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, '0', 0, 0, NULL, NULL),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, '0', 0, 0, NULL, NULL),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, '0', 0, 0, NULL, NULL),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, '0', 0, 0, NULL, NULL),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, '0', 0, 0, NULL, NULL),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, '0', 0, 0, NULL, NULL),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, '0', 0, 0, NULL, NULL),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, '0', 0, 0, NULL, NULL),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, '0', 0, 0, NULL, NULL),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, '0', 0, 0, NULL, NULL),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, '0', 0, 0, NULL, NULL),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, '0', 0, 0, NULL, NULL),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, '0', 0, 0, NULL, NULL),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, '0', 0, 0, NULL, NULL),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, '0', 0, 0, NULL, NULL),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, '0', 0, 0, NULL, NULL),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, '0', 0, 0, NULL, NULL),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, '0', 0, 0, NULL, NULL),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, '0', 0, 0, NULL, NULL),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, '0', 0, 0, NULL, NULL),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, '0', 0, 0, NULL, NULL),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, '0', 0, 0, NULL, NULL),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, '0', 0, 0, NULL, NULL),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, '0', 0, 0, NULL, NULL),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, '0', 0, 0, NULL, NULL),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, '0', 0, 0, NULL, NULL),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, '0', 0, 0, NULL, NULL),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, '0', 0, 0, NULL, NULL),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, '0', 0, 0, NULL, NULL),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, '0', 0, 0, NULL, NULL),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, '0', 0, 0, NULL, NULL),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, '0', 0, 0, NULL, NULL),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, '0', 0, 0, NULL, NULL),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, '0', 0, 0, NULL, NULL),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, '0', 0, 0, NULL, NULL),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, '0', 0, 0, NULL, NULL),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, '0', 0, 0, NULL, NULL),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, '0', 0, 0, NULL, NULL),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, '0', 0, 0, NULL, NULL),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, '0', 0, 0, NULL, NULL),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, '0', 0, 0, NULL, NULL),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, '0', 0, 0, NULL, NULL),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, '0', 0, 0, NULL, NULL),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, '0', 0, 0, NULL, NULL),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
  `font_arial` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_left` tinyint(1) UNSIGNED DEFAULT '0',
  `decimal_places` int(10) UNSIGNED DEFAULT '2' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `html_entity`, `font_arial`, `font_code2000`, `unicode_decimal`, `unicode_hex`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', '&#1583;.&#1573;', 'د.إ', 'د.إ', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(2, 'AFN', 'Afghanistan Afghani', '&#65;&#102;', '؋', '؋', '1547', '60b', 0, 2, '.', ',', NULL, NULL),
(3, 'ALL', 'Albania Lek', '&#76;&#101;&#107;', 'Lek', 'Lek', '76, 1', '4c, 6', 0, 2, '.', ',', NULL, NULL),
(4, 'AMD', 'Armenia Dram', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(5, 'ANG', 'Netherlands Antilles Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, NULL),
(6, 'AOA', 'Angola Kwanza', '&#75;&#122;', 'Kz', 'Kz', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(7, 'ARS', 'Argentina Peso', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2019-04-07 15:14:40'),
(8, 'AUD', 'Australia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(9, 'AWG', 'Aruba Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, NULL),
(10, 'AZN', 'Azerbaijan New Manat', '&#1084;&#1072;&#1085;', 'ман', 'ман', '1084,', '43c, ', 0, 2, '.', ',', NULL, NULL),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', '&#75;&#77;', 'KM', 'KM', '75, 7', '4b, 4', 0, 2, '.', ',', NULL, NULL),
(12, 'BBD', 'Barbados Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(13, 'BDT', 'Bangladesh Taka', '&#2547;', '৳', '৳', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(14, 'BGN', 'Bulgaria Lev', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(15, 'BHD', 'Bahrain Dinar', '.&#1583;.&#1576;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(16, 'BIF', 'Burundi Franc', '&#70;&#66;&#117;', 'FBu', 'FBu', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(17, 'BMD', 'Bermuda Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(18, 'BND', 'Brunei Darussalam Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(19, 'BOB', 'Bolivia Boliviano', '&#36;&#98;', '$b', '$b', '36, 9', '24, 6', 0, 2, '.', ',', NULL, NULL),
(20, 'BRL', 'Brazil Real', '&#82;&#36;', 'R$', 'R$', '82, 3', '52, 2', 0, 2, '.', ',', NULL, NULL),
(21, 'BSD', 'Bahamas Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(22, 'BTN', 'Bhutan Ngultrum', '&#78;&#117;&#46;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(23, 'BWP', 'Botswana Pula', '&#80;', 'P', 'P', '80', '50', 1, 2, '.', ',', NULL, NULL),
(24, 'BYR', 'Belarus Ruble', '&#112;&#46;', 'p.', 'p.', '112, ', '70, 2', 0, 0, '.', ',', NULL, NULL),
(25, 'BZD', 'Belize Dollar', '&#66;&#90;&#36;', 'BZ$', 'BZ$', '66, 9', '42, 5', 1, 2, '.', ',', NULL, NULL),
(26, 'CAD', 'Canada Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(27, 'CDF', 'Congo/Kinshasa Franc', '&#70;&#67;', 'Fr', 'Fr', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(28, 'CHF', 'Switzerland Franc', '', 'Fr', 'Fr', '67, 7', '43, 4', 0, 2, '.', ',', NULL, NULL),
(29, 'CLP', 'Chile Peso', '&#36;', '$', '$', '36', '24', 0, 0, '.', ',', NULL, NULL),
(30, 'CNY', 'China Yuan Renminbi', '&#165;', '¥', '¥', '165', 'a5', 0, 2, '.', ',', NULL, NULL),
(31, 'COP', 'Colombia Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(32, 'CRC', 'Costa Rica Colon', '&#8353;', '₡', '₡', '8353', '20a1', 0, 2, '.', ',', NULL, NULL),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(34, 'CUP', 'Cuba Peso', '&#8396;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, NULL),
(35, 'CVE', 'Cape Verde Escudo', '&#x24;', '$', '$', NULL, NULL, 1, 0, '.', ',', NULL, NULL),
(36, 'CZK', 'Czech Republic Koruna', '&#75;&#269;', 'Kč', 'Kč', '75, 2', '4b, 1', 0, 2, '.', ',', NULL, NULL),
(37, 'DJF', 'Djibouti Franc', '&#70;&#100;&#106;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(38, 'DKK', 'Denmark Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(39, 'DOP', 'Dominican Republic Peso', '&#82;&#68;&#36;', 'RD$', 'RD$', '82, 6', '52, 4', 0, 2, '.', ',', NULL, NULL),
(40, 'DZD', 'Algeria Dinar', '&#1583;&#1580;', 'DA', 'DA', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(41, 'EEK', 'Estonia Kroon', NULL, 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(42, 'EGP', 'Egypt Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(43, 'ERN', 'Eritrea Nakfa', '&#x4E;&#x66;&#x6B;', 'Nfk', 'Nfk', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(44, 'ETB', 'Ethiopia Birr', '&#66;&#114;', 'Br', 'Br', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(45, 'EUR', 'Euro Member Countries', '€', '€', '€', '8364', '20ac', 0, 2, ',', ' ', NULL, NULL),
(46, 'FJD', 'Fiji Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(48, 'GBP', 'United Kingdom Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(49, 'GEL', 'Georgia Lari', '&#4314;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(50, 'GGP', 'Guernsey Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(51, 'GHC', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', '162', 'a2', 1, 2, '.', ',', NULL, NULL),
(52, 'GHS', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(53, 'GIP', 'Gibraltar Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(54, 'GMD', 'Gambia Dalasi', '&#68;', 'D', 'D', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(55, 'GNF', 'Guinea Franc', '&#70;&#71;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(56, 'GTQ', 'Guatemala Quetzal', '&#81;', 'Q', 'Q', '81', '51', 0, 2, '.', ',', NULL, NULL),
(57, 'GYD', 'Guyana Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(58, 'HKD', 'Hong Kong Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(59, 'HNL', 'Honduras Lempira', '&#76;', 'L', 'L', '76', '4c', 0, 2, '.', ',', NULL, NULL),
(60, 'HRK', 'Croatia Kuna', '&#107;&#110;', 'kn', 'kn', '107, ', '6b, 6', 0, 2, '.', ',', NULL, NULL),
(61, 'HTG', 'Haiti Gourde', '&#71;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(62, 'HUF', 'Hungary Forint', '&#70;&#116;', 'Ft', 'Ft', '70, 1', '46, 7', 0, 2, '.', ',', NULL, NULL),
(63, 'IDR', 'Indonesia Rupiah', '&#82;&#112;', 'Rp', 'Rp', '82, 1', '52, 7', 0, 0, '.', ',', NULL, NULL),
(64, 'ILS', 'Israel Shekel', '&#8362;', '₪', '₪', '8362', '20aa', 0, 2, '.', ',', NULL, NULL),
(65, 'IMP', 'Isle of Man Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(66, 'INR', 'India Rupee', '&#8377;', '₨', '₨', '', '', 0, 2, '.', ',', NULL, NULL),
(67, 'IQD', 'Iraq Dinar', '&#1593;.&#1583;', 'د.ع;', 'د.ع;', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(68, 'IRR', 'Iran Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 0, '.', ',', NULL, NULL),
(69, 'ISK', 'Iceland Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 0, '.', ',', NULL, NULL),
(70, 'JEP', 'Jersey Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(71, 'JMD', 'Jamaica Dollar', '&#74;&#36;', 'J$', 'J$', '74, 3', '4a, 2', 1, 2, '.', ',', NULL, NULL),
(72, 'JOD', 'Jordan Dinar', '&#74;&#68;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(73, 'JPY', 'Japan Yen', '&#165;', '¥', '¥', '165', 'a5', 0, 0, '.', ',', NULL, NULL),
(74, 'KES', 'Kenya Shilling', '&#x4B;&#x53;&#x68;', 'KSh', 'KSh', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(75, 'KGS', 'Kyrgyzstan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(76, 'KHR', 'Cambodia Riel', '&#6107;', '៛', '៛', '6107', '17db', 0, 2, '.', ',', NULL, NULL),
(77, 'KMF', 'Comoros Franc', '&#67;&#70;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(78, 'KPW', 'Korea (North) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, NULL),
(79, 'KRW', 'Korea (South) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, NULL),
(80, 'KWD', 'Kuwait Dinar', '&#1583;.&#1603;', 'د.ك', 'د.ك', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(81, 'KYD', 'Cayman Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(82, 'KZT', 'Kazakhstan Tenge', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(83, 'LAK', 'Laos Kip', '&#8365;', '₭', '₭', '8365', '20ad', 0, 0, '.', ',', NULL, NULL),
(84, 'LBP', 'Lebanon Pound', '&#163;', '£', '£', '163', 'a3', 0, 0, '.', ',', NULL, NULL),
(85, 'LKR', 'Sri Lanka Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(86, 'LRD', 'Liberia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(87, 'LSL', 'Lesotho Loti', '&#76;', 'M', 'M', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(88, 'LTL', 'Lithuania Litas', '&#76;&#116;', 'Lt', 'Lt', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, NULL),
(89, 'LVL', 'Latvia Lat', '&#76;&#115;', 'Ls', 'Ls', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, NULL),
(90, 'LYD', 'Libya Dinar', '&#1604;.&#1583;', 'DL', 'DL', NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(91, 'MAD', 'Morocco Dirham', '&#1583;.&#1605;.', 'Dhs', 'Dhs', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(92, 'MDL', 'Moldova Leu', '&#76;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(93, 'MGA', 'Madagascar Ariary', '&#65;&#114;', 'Ar', 'Ar', NULL, NULL, 0, 5, '.', ',', NULL, NULL),
(94, 'MKD', 'Macedonia Denar', '&#1076;&#1077;&#1085;', 'ден', 'ден', '1076,', '434, ', 0, 2, '.', ',', NULL, NULL),
(95, 'MMK', 'Myanmar (Burma) Kyat', '&#75;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(96, 'MNT', 'Mongolia Tughrik', '&#8366;', '₮', '₮', '8366', '20ae', 0, 2, '.', ',', NULL, NULL),
(97, 'MOP', 'Macau Pataca', '&#77;&#79;&#80;&#36;', NULL, NULL, NULL, NULL, 0, 1, '.', ',', NULL, NULL),
(98, 'MRO', 'Mauritania Ouguiya', '&#85;&#77;', 'UM', 'UM', NULL, NULL, 0, 5, '.', ',', NULL, NULL),
(99, 'MUR', 'Mauritius Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', '.&#1923;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(101, 'MWK', 'Malawi Kwacha', '&#77;&#75;', 'MK', 'MK', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(102, 'MXN', 'Mexico Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(103, 'MYR', 'Malaysia Ringgit', '&#82;&#77;', 'RM', 'RM', '82, 7', '52, 4', 0, 2, '.', ',', NULL, NULL),
(104, 'MZN', 'Mozambique Metical', '&#77;&#84;', 'MT', 'MT', '77, 8', '4d, 5', 0, 2, '.', ',', NULL, NULL),
(105, 'NAD', 'Namibia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(106, 'NGN', 'Nigeria Naira', '&#8358;', '₦', '₦', '8358', '20a6', 1, 2, '.', ',', NULL, NULL),
(107, 'NIO', 'Nicaragua Cordoba', '&#67;&#36;', 'C$', 'C$', '67, 3', '43, 2', 0, 2, '.', ',', NULL, NULL),
(108, 'NOK', 'Norway Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(109, 'NPR', 'Nepal Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(110, 'NZD', 'New Zealand Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(111, 'OMR', 'Oman Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 3, '.', ',', NULL, NULL),
(112, 'PAB', 'Panama Balboa', '&#66;&#47;&#46;', 'B/.', 'B/.', '66, 4', '42, 2', 0, 2, '.', ',', NULL, NULL),
(113, 'PEN', 'Peru Nuevo Sol', '&#83;&#47;&#46;', 'S/.', 'S/.', '83, 4', '53, 2', 0, 2, '.', ',', NULL, NULL),
(114, 'PGK', 'Papua New Guinea Kina', '&#75;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(115, 'PHP', 'Philippines Peso', '&#8369;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, NULL),
(116, 'PKR', 'Pakistan Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(117, 'PLN', 'Poland Zloty', '&#122;&#322;', 'zł', 'zł', '122, ', '7a, 1', 0, 2, '.', ',', NULL, NULL),
(118, 'PYG', 'Paraguay Guarani', '&#71;&#115;', 'Gs', 'Gs', '71, 1', '47, 7', 0, 0, '.', ',', NULL, NULL),
(119, 'QAR', 'Qatar Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(120, 'RON', 'Romania New Leu', '&#108;&#101;&#105;', 'lei', 'lei', '108, ', '6c, 6', 0, 2, '.', ',', NULL, NULL),
(121, 'RSD', 'Serbia Dinar', '&#1044;&#1080;&#1085;&#46;', 'Дин.', 'Дин.', '1044,', '414, ', 0, 2, '.', ',', NULL, NULL),
(122, 'RUB', 'Russia Ruble', '&#1088;&#1091;&#1073;', 'руб', 'руб', '1088,', '440, ', 0, 2, '.', ',', NULL, NULL),
(123, 'RWF', 'Rwanda Franc', '&#1585;.&#1587;', 'FRw', 'FRw', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(124, 'SAR', 'Saudi Arabia Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(125, 'SBD', 'Solomon Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(126, 'SCR', 'Seychelles Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(127, 'SDG', 'Sudan Pound', '&#163;', 'DS', 'DS', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(128, 'SEK', 'Sweden Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(129, 'SGD', 'Singapore Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(130, 'SHP', 'Saint Helena Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(131, 'SLL', 'Sierra Leone Leone', '&#76;&#101;', 'Le', 'Le', NULL, NULL, 1, 0, '.', ',', NULL, NULL),
(132, 'SOS', 'Somalia Shilling', '&#83;', 'S', 'S', '83', '53', 0, 2, '.', ',', NULL, NULL),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(134, 'SRD', 'Suriname Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(135, 'SSP', 'South Sudanese Pound', '&#xA3;', '£', '£', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(136, 'STD', 'São Tomé and Príncipe Dobra', '&#68;&#98;', 'Db', 'Db', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(137, 'SVC', 'El Salvador Colon', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(138, 'SYP', 'Syria Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(139, 'SZL', 'Swaziland Lilangeni', '&#76;', 'E', 'E', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(140, 'THB', 'Thailand Baht', '&#3647;', '฿', '฿', '3647', 'e3f', 0, 2, '.', ',', NULL, NULL),
(141, 'TJS', 'Tajikistan Somoni', '&#84;&#74;&#83;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(142, 'TMT', 'Turkmenistan Manat', '&#109;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(143, 'TND', 'Tunisia Dinar', '&#1583;.&#1578;', 'DT', 'DT', NULL, NULL, 1, 3, '.', ',', NULL, NULL),
(144, 'TOP', 'Tonga Pa\'anga', '&#84;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(145, 'TRL', 'Turkey Lira', NULL, '₤', '₤', '8356', '20a4', 1, 2, '.', ',', NULL, NULL),
(146, 'TRY', 'Turkey Lira', '&#x20BA;', '₺', '₺', '', '', 1, 2, '.', ',', NULL, NULL),
(147, 'TTD', 'Trinidad and Tobago Dollar', '&#36;', 'TT$', 'TT$', '84, 8', '54, 5', 1, 2, '.', ',', NULL, NULL),
(148, 'TVD', 'Tuvalu Dollar', NULL, '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(149, 'TWD', 'Taiwan New Dollar', '&#78;&#84;&#36;', 'NT$', 'NT$', '78, 8', '4e, 5', 1, 2, '.', ',', NULL, NULL),
(150, 'TZS', 'Tanzania Shilling', '&#x54;&#x53;&#x68;', 'TSh', 'TSh', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(151, 'UAH', 'Ukraine Hryvnia', '&#8372;', '₴', '₴', '8372', '20b4', 0, 2, '.', ',', NULL, NULL),
(152, 'UGX', 'Uganda Shilling', '&#85;&#83;&#104;', 'USh', 'USh', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(153, 'USD', 'United States Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(154, 'UYU', 'Uruguay Peso', '&#36;&#85;', '$U', '$U', '36, 8', '24, 5', 0, 2, '.', ',', NULL, NULL),
(155, 'UZS', 'Uzbekistan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(156, 'VEF', 'Venezuela Bolivar', '&#66;&#115;', 'Bs', 'Bs', '66, 1', '42, 7', 0, 2, '.', ',', NULL, NULL),
(157, 'VND', 'Viet Nam Dong', '&#8363;', '₫', '₫', '8363', '20ab', 1, 0, '.', ',', NULL, NULL),
(158, 'VUV', 'Vanuatu Vatu', '&#86;&#84;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(159, 'WST', 'Samoa Tala', '&#87;&#83;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(161, 'XCD', 'East Caribbean Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', '&#70;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(165, 'YER', 'Yemen Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(166, 'ZAR', 'South Africa Rand', '&#82;', 'R', 'R', '82', '52', 1, 2, '.', ',', NULL, NULL),
(167, 'ZMW', 'Zambia Kwacha', NULL, 'ZK', 'ZK', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(168, 'ZWD', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(169, 'ZWL', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(170, 'XBT', 'Bitcoin', '฿', '฿', '฿', NULL, NULL, 1, 2, '.', ',', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8_unicode_ci NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('text','textarea','checkbox','checkbox_multiple','select','radio','file') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT '255',
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `translation_lang`, `translation_of`, `name`, `type`, `max`, `default`, `required`, `help`, `active`) VALUES
(1, 'posts', 'en', 25, 'Car Brand', 'select', NULL, NULL, 1, NULL, 1),
(2, 'posts', 'en', 26, 'Model', 'text', NULL, NULL, 0, NULL, 1),
(3, 'posts', 'en', 27, 'Year of registration', 'text', NULL, NULL, 0, NULL, 1),
(4, 'posts', 'en', 28, 'Mileage', 'text', NULL, NULL, 0, NULL, 1),
(5, 'posts', 'en', 29, 'Fuel Type', 'select', NULL, NULL, 0, NULL, 1),
(6, 'posts', 'en', 30, 'Features', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(7, 'posts', 'en', 31, 'Resume', 'file', NULL, NULL, 1, NULL, 1),
(8, 'posts', 'en', 32, 'Condition', 'select', NULL, NULL, 0, NULL, 1),
(9, 'posts', 'en', 33, 'Transmission', 'radio', NULL, NULL, 0, NULL, 1),
(10, 'posts', 'en', 34, 'Start Date', 'text', 50, NULL, 0, NULL, 1),
(11, 'posts', 'en', 35, 'Company', 'text', 100, NULL, 1, NULL, 1),
(12, 'posts', 'en', 36, 'Work Type', 'select', NULL, NULL, 1, NULL, 1),
(13, 'posts', 'en', 37, 'Size', 'text', 50, NULL, 1, NULL, 1),
(14, 'posts', 'en', 38, 'Rooms', 'select', NULL, NULL, 1, NULL, 1),
(15, 'posts', 'en', 39, 'Building Type', 'select', NULL, NULL, 0, NULL, 1),
(16, 'posts', 'en', 40, 'Parking', 'checkbox', NULL, NULL, 0, NULL, 1),
(17, 'posts', 'en', 41, 'Furnished', 'radio', NULL, NULL, 0, NULL, 1),
(18, 'posts', 'en', 42, 'Electronic Brand', 'select', NULL, NULL, 0, NULL, 1),
(19, 'posts', 'en', 43, 'Sex', 'radio', NULL, NULL, 1, NULL, 1),
(20, 'posts', 'en', 44, 'Looking for', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(21, 'posts', 'en', 45, 'Age', 'select', NULL, NULL, 1, NULL, 1),
(22, 'posts', 'en', 46, 'Start date', 'text', 50, NULL, 1, NULL, 1),
(23, 'posts', 'en', 47, 'End date', 'text', 50, NULL, 1, NULL, 1),
(24, 'posts', 'en', 48, 'Event Address', 'text', 200, NULL, 1, NULL, 1),
(25, 'posts', 'es', 25, 'Car Brand', 'select', NULL, NULL, 1, NULL, 1),
(26, 'posts', 'es', 26, 'Model', 'text', NULL, NULL, 0, NULL, 1),
(27, 'posts', 'es', 27, 'Year of registration', 'text', NULL, NULL, 0, NULL, 1),
(28, 'posts', 'es', 28, 'Mileage', 'text', NULL, NULL, 0, NULL, 1),
(29, 'posts', 'es', 29, 'Fuel Type', 'select', NULL, NULL, 0, NULL, 1),
(30, 'posts', 'es', 30, 'Features', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(31, 'posts', 'es', 31, 'Resume', 'file', NULL, NULL, 1, NULL, 1),
(32, 'posts', 'es', 32, 'Condition', 'select', NULL, NULL, 0, NULL, 1),
(33, 'posts', 'es', 33, 'Transmission', 'radio', NULL, NULL, 0, NULL, 1),
(34, 'posts', 'es', 34, 'Start Date', 'text', 50, NULL, 0, NULL, 1),
(35, 'posts', 'es', 35, 'Company', 'text', 100, NULL, 1, NULL, 1),
(36, 'posts', 'es', 36, 'Work Type', 'select', NULL, NULL, 1, NULL, 1),
(37, 'posts', 'es', 37, 'Size', 'text', 50, NULL, 1, NULL, 1),
(38, 'posts', 'es', 38, 'Rooms', 'select', NULL, NULL, 1, NULL, 1),
(39, 'posts', 'es', 39, 'Building Type', 'select', NULL, NULL, 0, NULL, 1),
(40, 'posts', 'es', 40, 'Parking', 'checkbox', NULL, NULL, 0, NULL, 1),
(41, 'posts', 'es', 41, 'Furnished', 'radio', NULL, NULL, 0, NULL, 1),
(42, 'posts', 'es', 42, 'Electronic Brand', 'select', NULL, NULL, 0, NULL, 1),
(43, 'posts', 'es', 43, 'Sex', 'radio', NULL, NULL, 1, NULL, 1),
(44, 'posts', 'es', 44, 'Looking for', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(45, 'posts', 'es', 45, 'Age', 'select', NULL, NULL, 1, NULL, 1),
(46, 'posts', 'es', 46, 'Start date', 'text', 50, NULL, 1, NULL, 1),
(47, 'posts', 'es', 47, 'End date', 'text', 50, NULL, 1, NULL, 1),
(48, 'posts', 'es', 48, 'Event Address', 'text', 200, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fields_options`
--

CREATE TABLE `fields_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `translation_lang`, `translation_of`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 25, 'en', 162, 'BMW', NULL, NULL, NULL, NULL),
(2, 25, 'en', 163, 'Mercedes', NULL, NULL, NULL, NULL),
(3, 25, 'en', 164, 'Renault', NULL, NULL, NULL, NULL),
(4, 30, 'en', 165, 'Air conditionar', NULL, NULL, NULL, NULL),
(5, 30, 'en', 166, 'GPS', NULL, NULL, NULL, NULL),
(6, 30, 'en', 167, 'Security System', NULL, NULL, NULL, NULL),
(7, 30, 'en', 168, 'Stepney', NULL, NULL, NULL, NULL),
(8, 29, 'en', 169, 'Essence', NULL, NULL, NULL, NULL),
(9, 29, 'en', 170, 'Diesel', NULL, NULL, NULL, NULL),
(10, 25, 'en', 171, 'Toyota', NULL, NULL, NULL, NULL),
(11, 32, 'en', 172, 'New', NULL, NULL, NULL, NULL),
(12, 32, 'en', 173, 'Used', NULL, NULL, NULL, NULL),
(13, 33, 'en', 174, 'Automatic', NULL, NULL, NULL, NULL),
(14, 33, 'en', 175, 'Manual', NULL, NULL, NULL, NULL),
(15, 36, 'en', 176, 'Full-time', NULL, NULL, NULL, NULL),
(16, 36, 'en', 177, 'Part-time', NULL, NULL, NULL, NULL),
(17, 36, 'en', 178, 'Temporary', NULL, NULL, NULL, NULL),
(18, 36, 'en', 179, 'Internship', NULL, NULL, NULL, NULL),
(19, 36, 'en', 180, 'Permanent', NULL, NULL, NULL, NULL),
(20, 38, 'en', 181, '1', 0, 4, 5, 1),
(21, 38, 'en', 182, '2', 0, 6, 7, 1),
(22, 38, 'en', 183, '3', 0, 8, 9, 1),
(23, 38, 'en', 184, '4', 0, 10, 11, 1),
(24, 38, 'en', 185, '5', 0, 12, 13, 1),
(25, 38, 'en', 186, '6', 0, 14, 15, 1),
(26, 38, 'en', 187, '7', 0, 16, 17, 1),
(27, 38, 'en', 188, '8', 0, 18, 19, 1),
(28, 38, 'en', 189, '9', 0, 20, 21, 1),
(29, 38, 'en', 190, '10', 0, 22, 23, 1),
(30, 38, 'en', 191, '> 10', 0, 24, 25, 1),
(31, 39, 'en', 192, 'Apartment', NULL, NULL, NULL, NULL),
(32, 39, 'en', 193, 'House', NULL, NULL, NULL, NULL),
(33, 41, 'en', 194, 'Yes', NULL, NULL, NULL, NULL),
(34, 41, 'en', 195, 'No', NULL, NULL, NULL, NULL),
(35, 39, 'en', 196, 'Office', NULL, NULL, NULL, NULL),
(36, 39, 'en', 197, 'Store', NULL, NULL, NULL, NULL),
(37, 39, 'en', 198, 'Plot of land', NULL, NULL, NULL, NULL),
(38, 38, 'en', 199, '0', 0, 2, 3, 1),
(39, 25, 'en', 200, 'Chevrolet', NULL, NULL, NULL, NULL),
(40, 25, 'en', 201, 'Cadillac', NULL, NULL, NULL, NULL),
(41, 25, 'en', 202, 'Buick', NULL, NULL, NULL, NULL),
(42, 25, 'en', 203, 'GMC', NULL, NULL, NULL, NULL),
(43, 25, 'en', 204, 'Ford', NULL, NULL, NULL, NULL),
(44, 25, 'en', 205, 'Chrysler', NULL, NULL, NULL, NULL),
(45, 25, 'en', 206, 'Dodge', NULL, NULL, NULL, NULL),
(46, 25, 'en', 207, 'Jeep', NULL, NULL, NULL, NULL),
(47, 25, 'en', 208, 'Tesla', NULL, NULL, NULL, NULL),
(48, 25, 'en', 209, 'Lexus', NULL, NULL, NULL, NULL),
(49, 25, 'en', 210, 'Suzuki', NULL, NULL, NULL, NULL),
(50, 25, 'en', 211, 'Mazda', NULL, NULL, NULL, NULL),
(51, 25, 'en', 212, 'Honda', NULL, NULL, NULL, NULL),
(52, 25, 'en', 213, 'Acura', NULL, NULL, NULL, NULL),
(53, 25, 'en', 214, 'Mitsubishi', NULL, NULL, NULL, NULL),
(54, 25, 'en', 215, 'Nissan', NULL, NULL, NULL, NULL),
(55, 25, 'en', 216, 'Infiniti', NULL, NULL, NULL, NULL),
(56, 25, 'en', 217, 'Audi', NULL, NULL, NULL, NULL),
(57, 25, 'en', 218, 'Volkswagen', NULL, NULL, NULL, NULL),
(58, 25, 'en', 219, 'Porsche', NULL, NULL, NULL, NULL),
(59, 25, 'en', 220, 'Opel', NULL, NULL, NULL, NULL),
(60, 25, 'en', 221, 'Jaguar', NULL, NULL, NULL, NULL),
(61, 25, 'en', 222, 'Land Rover', NULL, NULL, NULL, NULL),
(62, 25, 'en', 223, 'Mini', NULL, NULL, NULL, NULL),
(63, 25, 'en', 224, 'Aston Martin', NULL, NULL, NULL, NULL),
(64, 25, 'en', 225, 'Bentley', NULL, NULL, NULL, NULL),
(65, 25, 'en', 226, 'Rolls Royce', NULL, NULL, NULL, NULL),
(66, 25, 'en', 227, 'McLaren', NULL, NULL, NULL, NULL),
(67, 25, 'en', 228, 'Fiat', NULL, NULL, NULL, NULL),
(68, 25, 'en', 229, 'Alfa Romeo', NULL, NULL, NULL, NULL),
(69, 25, 'en', 230, 'Maserati', NULL, NULL, NULL, NULL),
(70, 25, 'en', 231, 'Ferrari', NULL, NULL, NULL, NULL),
(71, 25, 'en', 232, 'Lamborghini', NULL, NULL, NULL, NULL),
(72, 25, 'en', 233, 'Pagani', NULL, NULL, NULL, NULL),
(73, 25, 'en', 234, 'Lancia', NULL, NULL, NULL, NULL),
(74, 25, 'en', 235, 'Peugeot', NULL, NULL, NULL, NULL),
(75, 25, 'en', 236, 'Citroen', NULL, NULL, NULL, NULL),
(76, 25, 'en', 237, 'Bugatti', NULL, NULL, NULL, NULL),
(77, 25, 'en', 238, 'Tata', NULL, NULL, NULL, NULL),
(78, 25, 'en', 239, 'Hyundai', NULL, NULL, NULL, NULL),
(79, 25, 'en', 240, 'Kia', NULL, NULL, NULL, NULL),
(80, 25, 'en', 241, 'Daewoo', NULL, NULL, NULL, NULL),
(81, 25, 'en', 242, 'Volvo', NULL, NULL, NULL, NULL),
(82, 25, 'en', 243, 'Saab', NULL, NULL, NULL, NULL),
(83, 25, 'en', 244, 'Lada', NULL, NULL, NULL, NULL),
(84, 25, 'en', 245, 'Volga', NULL, NULL, NULL, NULL),
(85, 25, 'en', 246, 'Zil', NULL, NULL, NULL, NULL),
(86, 25, 'en', 247, 'GAZ', NULL, NULL, NULL, NULL),
(87, 25, 'en', 248, 'Geely', NULL, NULL, NULL, NULL),
(88, 25, 'en', 249, 'Chery', NULL, NULL, NULL, NULL),
(89, 25, 'en', 250, 'Hongqi', NULL, NULL, NULL, NULL),
(90, 42, 'en', 251, 'Huawei', NULL, NULL, NULL, NULL),
(91, 42, 'en', 252, 'Lenovo', NULL, NULL, NULL, NULL),
(92, 42, 'en', 253, 'TP-Link', NULL, NULL, NULL, NULL),
(93, 42, 'en', 254, 'Xiaomi', NULL, NULL, NULL, NULL),
(94, 42, 'en', 255, 'Canon', NULL, NULL, NULL, NULL),
(95, 42, 'en', 256, 'Casio', NULL, NULL, NULL, NULL),
(96, 42, 'en', 257, 'Epson', NULL, NULL, NULL, NULL),
(97, 42, 'en', 258, 'Fuji', NULL, NULL, NULL, NULL),
(98, 42, 'en', 259, 'Funai', NULL, NULL, NULL, NULL),
(99, 42, 'en', 260, 'JVC', NULL, NULL, NULL, NULL),
(100, 42, 'en', 261, 'Nikon', NULL, NULL, NULL, NULL),
(101, 42, 'en', 262, 'Nintendo', NULL, NULL, NULL, NULL),
(102, 42, 'en', 263, 'Olympus', NULL, NULL, NULL, NULL),
(103, 42, 'en', 264, 'Panasonic', NULL, NULL, NULL, NULL),
(104, 42, 'en', 265, 'Pentax', NULL, NULL, NULL, NULL),
(105, 42, 'en', 266, 'Pioneer', NULL, NULL, NULL, NULL),
(106, 42, 'en', 267, 'Sega', NULL, NULL, NULL, NULL),
(107, 42, 'en', 268, 'Sharp', NULL, NULL, NULL, NULL),
(108, 42, 'en', 269, 'Sony', NULL, NULL, NULL, NULL),
(109, 42, 'en', 270, 'Toshiba', NULL, NULL, NULL, NULL),
(110, 42, 'en', 271, 'Daewoo', NULL, NULL, NULL, NULL),
(111, 42, 'en', 272, 'LG', NULL, NULL, NULL, NULL),
(112, 42, 'en', 273, 'Samsung', NULL, NULL, NULL, NULL),
(113, 42, 'en', 274, 'Hyundai', NULL, NULL, NULL, NULL),
(114, 42, 'en', 275, 'Kova', NULL, NULL, NULL, NULL),
(115, 42, 'en', 276, 'Acer', NULL, NULL, NULL, NULL),
(116, 42, 'en', 277, 'Asus', NULL, NULL, NULL, NULL),
(117, 42, 'en', 278, 'D-Link', NULL, NULL, NULL, NULL),
(118, 42, 'en', 279, 'Gigabyte', NULL, NULL, NULL, NULL),
(119, 42, 'en', 280, 'Beko', NULL, NULL, NULL, NULL),
(120, 42, 'en', 281, 'Nokia', NULL, NULL, NULL, NULL),
(121, 42, 'en', 282, 'Alcatel-Lucent', NULL, NULL, NULL, NULL),
(122, 42, 'en', 283, 'Bosch', NULL, NULL, NULL, NULL),
(123, 42, 'en', 284, 'Siemens', NULL, NULL, NULL, NULL),
(124, 42, 'en', 285, 'Sennheiser', NULL, NULL, NULL, NULL),
(125, 42, 'en', 286, 'Telefunken', NULL, NULL, NULL, NULL),
(126, 42, 'en', 287, 'Philips', NULL, NULL, NULL, NULL),
(127, 42, 'en', 288, 'Electrolux', NULL, NULL, NULL, NULL),
(128, 42, 'en', 289, 'Russell Hobbs', NULL, NULL, NULL, NULL),
(129, 42, 'en', 290, 'BlackBerry', NULL, NULL, NULL, NULL),
(130, 42, 'en', 291, 'Thomson', NULL, NULL, NULL, NULL),
(131, 42, 'en', 292, 'Amazon', NULL, NULL, NULL, NULL),
(132, 42, 'en', 293, 'Apple', NULL, NULL, NULL, NULL),
(133, 42, 'en', 294, 'Bose', NULL, NULL, NULL, NULL),
(134, 42, 'en', 295, 'Cisco Systems', NULL, NULL, NULL, NULL),
(135, 42, 'en', 296, 'Dell', NULL, NULL, NULL, NULL),
(136, 42, 'en', 297, 'Gateway', NULL, NULL, NULL, NULL),
(137, 42, 'en', 298, 'Google', NULL, NULL, NULL, NULL),
(138, 42, 'en', 299, 'Hewlett-Packard', NULL, NULL, NULL, NULL),
(139, 42, 'en', 300, 'IBM', NULL, NULL, NULL, NULL),
(140, 42, 'en', 301, 'Intel', NULL, NULL, NULL, NULL),
(141, 42, 'en', 302, 'Microsoft', NULL, NULL, NULL, NULL),
(142, 42, 'en', 303, 'Motorola', NULL, NULL, NULL, NULL),
(143, 18, 'en', 304, 'NVIDIA', NULL, NULL, NULL, NULL),
(144, 18, 'en', 305, 'Packard Bell', NULL, NULL, NULL, NULL),
(145, 18, 'en', 306, 'Qualcomm', NULL, NULL, NULL, NULL),
(146, 18, 'en', 307, 'Seagate', NULL, NULL, NULL, NULL),
(147, 18, 'en', 308, 'Sun Microsystems', NULL, NULL, NULL, NULL),
(148, 18, 'en', 309, 'Vizio', NULL, NULL, NULL, NULL),
(149, 18, 'en', 310, 'Western Digital', NULL, NULL, NULL, NULL),
(150, 18, 'en', 311, 'Xerox', NULL, NULL, NULL, NULL),
(151, 18, 'en', 312, 'Other', NULL, NULL, NULL, NULL),
(152, 1, 'en', 313, 'Other', NULL, NULL, NULL, NULL),
(153, 19, 'en', 314, 'man', NULL, NULL, NULL, NULL),
(154, 19, 'en', 315, 'woman', NULL, NULL, NULL, NULL),
(155, 20, 'en', 316, 'man', NULL, NULL, NULL, NULL),
(156, 20, 'en', 317, 'woman', NULL, NULL, NULL, NULL),
(157, 21, 'en', 318, '18 - 25', NULL, NULL, NULL, NULL),
(158, 21, 'en', 319, '26 - 30', NULL, NULL, NULL, NULL),
(159, 21, 'en', 320, '31 - 40', NULL, NULL, NULL, NULL),
(160, 21, 'en', 321, '41 - 50', NULL, NULL, NULL, NULL),
(161, 21, 'en', 322, '50 - 60', NULL, NULL, NULL, NULL),
(162, 25, 'es', 162, 'BMW', NULL, NULL, NULL, NULL),
(163, 25, 'es', 163, 'Mercedes', NULL, NULL, NULL, NULL),
(164, 25, 'es', 164, 'Renault', NULL, NULL, NULL, NULL),
(165, 30, 'es', 165, 'Air conditionar', NULL, NULL, NULL, NULL),
(166, 30, 'es', 166, 'GPS', NULL, NULL, NULL, NULL),
(167, 30, 'es', 167, 'Security System', NULL, NULL, NULL, NULL),
(168, 30, 'es', 168, 'Stepney', NULL, NULL, NULL, NULL),
(169, 29, 'es', 169, 'Essence', NULL, NULL, NULL, NULL),
(170, 29, 'es', 170, 'Diesel', NULL, NULL, NULL, NULL),
(171, 25, 'es', 171, 'Toyota', NULL, NULL, NULL, NULL),
(172, 32, 'es', 172, 'New', NULL, NULL, NULL, NULL),
(173, 32, 'es', 173, 'Used', NULL, NULL, NULL, NULL),
(174, 33, 'es', 174, 'Automatic', NULL, NULL, NULL, NULL),
(175, 33, 'es', 175, 'Manual', NULL, NULL, NULL, NULL),
(176, 36, 'es', 176, 'Full-time', NULL, NULL, NULL, NULL),
(177, 36, 'es', 177, 'Part-time', NULL, NULL, NULL, NULL),
(178, 36, 'es', 178, 'Temporary', NULL, NULL, NULL, NULL),
(179, 36, 'es', 179, 'Internship', NULL, NULL, NULL, NULL),
(180, 36, 'es', 180, 'Permanent', NULL, NULL, NULL, NULL),
(181, 38, 'es', 181, '1', 0, 4, 5, 1),
(182, 38, 'es', 182, '2', 0, 6, 7, 1),
(183, 38, 'es', 183, '3', 0, 8, 9, 1),
(184, 38, 'es', 184, '4', 0, 10, 11, 1),
(185, 38, 'es', 185, '5', 0, 12, 13, 1),
(186, 38, 'es', 186, '6', 0, 14, 15, 1),
(187, 38, 'es', 187, '7', 0, 16, 17, 1),
(188, 38, 'es', 188, '8', 0, 18, 19, 1),
(189, 38, 'es', 189, '9', 0, 20, 21, 1),
(190, 38, 'es', 190, '10', 0, 22, 23, 1),
(191, 38, 'es', 191, '> 10', 0, 24, 25, 1),
(192, 39, 'es', 192, 'Apartment', NULL, NULL, NULL, NULL),
(193, 39, 'es', 193, 'House', NULL, NULL, NULL, NULL),
(194, 41, 'es', 194, 'Yes', NULL, NULL, NULL, NULL),
(195, 41, 'es', 195, 'No', NULL, NULL, NULL, NULL),
(196, 39, 'es', 196, 'Office', NULL, NULL, NULL, NULL),
(197, 39, 'es', 197, 'Store', NULL, NULL, NULL, NULL),
(198, 39, 'es', 198, 'Plot of land', NULL, NULL, NULL, NULL),
(199, 38, 'es', 199, '0', 0, 2, 3, 1),
(200, 25, 'es', 200, 'Chevrolet', NULL, NULL, NULL, NULL),
(201, 25, 'es', 201, 'Cadillac', NULL, NULL, NULL, NULL),
(202, 25, 'es', 202, 'Buick', NULL, NULL, NULL, NULL),
(203, 25, 'es', 203, 'GMC', NULL, NULL, NULL, NULL),
(204, 25, 'es', 204, 'Ford', NULL, NULL, NULL, NULL),
(205, 25, 'es', 205, 'Chrysler', NULL, NULL, NULL, NULL),
(206, 25, 'es', 206, 'Dodge', NULL, NULL, NULL, NULL),
(207, 25, 'es', 207, 'Jeep', NULL, NULL, NULL, NULL),
(208, 25, 'es', 208, 'Tesla', NULL, NULL, NULL, NULL),
(209, 25, 'es', 209, 'Lexus', NULL, NULL, NULL, NULL),
(210, 25, 'es', 210, 'Suzuki', NULL, NULL, NULL, NULL),
(211, 25, 'es', 211, 'Mazda', NULL, NULL, NULL, NULL),
(212, 25, 'es', 212, 'Honda', NULL, NULL, NULL, NULL),
(213, 25, 'es', 213, 'Acura', NULL, NULL, NULL, NULL),
(214, 25, 'es', 214, 'Mitsubishi', NULL, NULL, NULL, NULL),
(215, 25, 'es', 215, 'Nissan', NULL, NULL, NULL, NULL),
(216, 25, 'es', 216, 'Infiniti', NULL, NULL, NULL, NULL),
(217, 25, 'es', 217, 'Audi', NULL, NULL, NULL, NULL),
(218, 25, 'es', 218, 'Volkswagen', NULL, NULL, NULL, NULL),
(219, 25, 'es', 219, 'Porsche', NULL, NULL, NULL, NULL),
(220, 25, 'es', 220, 'Opel', NULL, NULL, NULL, NULL),
(221, 25, 'es', 221, 'Jaguar', NULL, NULL, NULL, NULL),
(222, 25, 'es', 222, 'Land Rover', NULL, NULL, NULL, NULL),
(223, 25, 'es', 223, 'Mini', NULL, NULL, NULL, NULL),
(224, 25, 'es', 224, 'Aston Martin', NULL, NULL, NULL, NULL),
(225, 25, 'es', 225, 'Bentley', NULL, NULL, NULL, NULL),
(226, 25, 'es', 226, 'Rolls Royce', NULL, NULL, NULL, NULL),
(227, 25, 'es', 227, 'McLaren', NULL, NULL, NULL, NULL),
(228, 25, 'es', 228, 'Fiat', NULL, NULL, NULL, NULL),
(229, 25, 'es', 229, 'Alfa Romeo', NULL, NULL, NULL, NULL),
(230, 25, 'es', 230, 'Maserati', NULL, NULL, NULL, NULL),
(231, 25, 'es', 231, 'Ferrari', NULL, NULL, NULL, NULL),
(232, 25, 'es', 232, 'Lamborghini', NULL, NULL, NULL, NULL),
(233, 25, 'es', 233, 'Pagani', NULL, NULL, NULL, NULL),
(234, 25, 'es', 234, 'Lancia', NULL, NULL, NULL, NULL),
(235, 25, 'es', 235, 'Peugeot', NULL, NULL, NULL, NULL),
(236, 25, 'es', 236, 'Citroen', NULL, NULL, NULL, NULL),
(237, 25, 'es', 237, 'Bugatti', NULL, NULL, NULL, NULL),
(238, 25, 'es', 238, 'Tata', NULL, NULL, NULL, NULL),
(239, 25, 'es', 239, 'Hyundai', NULL, NULL, NULL, NULL),
(240, 25, 'es', 240, 'Kia', NULL, NULL, NULL, NULL),
(241, 25, 'es', 241, 'Daewoo', NULL, NULL, NULL, NULL),
(242, 25, 'es', 242, 'Volvo', NULL, NULL, NULL, NULL),
(243, 25, 'es', 243, 'Saab', NULL, NULL, NULL, NULL),
(244, 25, 'es', 244, 'Lada', NULL, NULL, NULL, NULL),
(245, 25, 'es', 245, 'Volga', NULL, NULL, NULL, NULL),
(246, 25, 'es', 246, 'Zil', NULL, NULL, NULL, NULL),
(247, 25, 'es', 247, 'GAZ', NULL, NULL, NULL, NULL),
(248, 25, 'es', 248, 'Geely', NULL, NULL, NULL, NULL),
(249, 25, 'es', 249, 'Chery', NULL, NULL, NULL, NULL),
(250, 25, 'es', 250, 'Hongqi', NULL, NULL, NULL, NULL),
(251, 42, 'es', 251, 'Huawei', NULL, NULL, NULL, NULL),
(252, 42, 'es', 252, 'Lenovo', NULL, NULL, NULL, NULL),
(253, 42, 'es', 253, 'TP-Link', NULL, NULL, NULL, NULL),
(254, 42, 'es', 254, 'Xiaomi', NULL, NULL, NULL, NULL),
(255, 42, 'es', 255, 'Canon', NULL, NULL, NULL, NULL),
(256, 42, 'es', 256, 'Casio', NULL, NULL, NULL, NULL),
(257, 42, 'es', 257, 'Epson', NULL, NULL, NULL, NULL),
(258, 42, 'es', 258, 'Fuji', NULL, NULL, NULL, NULL),
(259, 42, 'es', 259, 'Funai', NULL, NULL, NULL, NULL),
(260, 42, 'es', 260, 'JVC', NULL, NULL, NULL, NULL),
(261, 42, 'es', 261, 'Nikon', NULL, NULL, NULL, NULL),
(262, 42, 'es', 262, 'Nintendo', NULL, NULL, NULL, NULL),
(263, 42, 'es', 263, 'Olympus', NULL, NULL, NULL, NULL),
(264, 42, 'es', 264, 'Panasonic', NULL, NULL, NULL, NULL),
(265, 42, 'es', 265, 'Pentax', NULL, NULL, NULL, NULL),
(266, 42, 'es', 266, 'Pioneer', NULL, NULL, NULL, NULL),
(267, 42, 'es', 267, 'Sega', NULL, NULL, NULL, NULL),
(268, 42, 'es', 268, 'Sharp', NULL, NULL, NULL, NULL),
(269, 42, 'es', 269, 'Sony', NULL, NULL, NULL, NULL),
(270, 42, 'es', 270, 'Toshiba', NULL, NULL, NULL, NULL),
(271, 42, 'es', 271, 'Daewoo', NULL, NULL, NULL, NULL),
(272, 42, 'es', 272, 'LG', NULL, NULL, NULL, NULL),
(273, 42, 'es', 273, 'Samsung', NULL, NULL, NULL, NULL),
(274, 42, 'es', 274, 'Hyundai', NULL, NULL, NULL, NULL),
(275, 42, 'es', 275, 'Kova', NULL, NULL, NULL, NULL),
(276, 42, 'es', 276, 'Acer', NULL, NULL, NULL, NULL),
(277, 42, 'es', 277, 'Asus', NULL, NULL, NULL, NULL),
(278, 42, 'es', 278, 'D-Link', NULL, NULL, NULL, NULL),
(279, 42, 'es', 279, 'Gigabyte', NULL, NULL, NULL, NULL),
(280, 42, 'es', 280, 'Beko', NULL, NULL, NULL, NULL),
(281, 42, 'es', 281, 'Nokia', NULL, NULL, NULL, NULL),
(282, 42, 'es', 282, 'Alcatel-Lucent', NULL, NULL, NULL, NULL),
(283, 42, 'es', 283, 'Bosch', NULL, NULL, NULL, NULL),
(284, 42, 'es', 284, 'Siemens', NULL, NULL, NULL, NULL),
(285, 42, 'es', 285, 'Sennheiser', NULL, NULL, NULL, NULL),
(286, 42, 'es', 286, 'Telefunken', NULL, NULL, NULL, NULL),
(287, 42, 'es', 287, 'Philips', NULL, NULL, NULL, NULL),
(288, 42, 'es', 288, 'Electrolux', NULL, NULL, NULL, NULL),
(289, 42, 'es', 289, 'Russell Hobbs', NULL, NULL, NULL, NULL),
(290, 42, 'es', 290, 'BlackBerry', NULL, NULL, NULL, NULL),
(291, 42, 'es', 291, 'Thomson', NULL, NULL, NULL, NULL),
(292, 42, 'es', 292, 'Amazon', NULL, NULL, NULL, NULL),
(293, 42, 'es', 293, 'Apple', NULL, NULL, NULL, NULL),
(294, 42, 'es', 294, 'Bose', NULL, NULL, NULL, NULL),
(295, 42, 'es', 295, 'Cisco Systems', NULL, NULL, NULL, NULL),
(296, 42, 'es', 296, 'Dell', NULL, NULL, NULL, NULL),
(297, 42, 'es', 297, 'Gateway', NULL, NULL, NULL, NULL),
(298, 42, 'es', 298, 'Google', NULL, NULL, NULL, NULL),
(299, 42, 'es', 299, 'Hewlett-Packard', NULL, NULL, NULL, NULL),
(300, 42, 'es', 300, 'IBM', NULL, NULL, NULL, NULL),
(301, 42, 'es', 301, 'Intel', NULL, NULL, NULL, NULL),
(302, 42, 'es', 302, 'Microsoft', NULL, NULL, NULL, NULL),
(303, 42, 'es', 303, 'Motorola', NULL, NULL, NULL, NULL),
(304, 18, 'es', 304, 'NVIDIA', NULL, NULL, NULL, NULL),
(305, 18, 'es', 305, 'Packard Bell', NULL, NULL, NULL, NULL),
(306, 18, 'es', 306, 'Qualcomm', NULL, NULL, NULL, NULL),
(307, 18, 'es', 307, 'Seagate', NULL, NULL, NULL, NULL),
(308, 18, 'es', 308, 'Sun Microsystems', NULL, NULL, NULL, NULL),
(309, 18, 'es', 309, 'Vizio', NULL, NULL, NULL, NULL),
(310, 18, 'es', 310, 'Western Digital', NULL, NULL, NULL, NULL),
(311, 18, 'es', 311, 'Xerox', NULL, NULL, NULL, NULL),
(312, 18, 'es', 312, 'Other', NULL, NULL, NULL, NULL),
(313, 1, 'es', 313, 'Other', NULL, NULL, NULL, NULL),
(314, 19, 'es', 314, 'man', NULL, NULL, NULL, NULL),
(315, 19, 'es', 315, 'woman', NULL, NULL, NULL, NULL),
(316, 20, 'es', 316, 'man', NULL, NULL, NULL, NULL),
(317, 20, 'es', 317, 'woman', NULL, NULL, NULL, NULL),
(318, 21, 'es', 318, '18 - 25', NULL, NULL, NULL, NULL),
(319, 21, 'es', 319, '26 - 30', NULL, NULL, NULL, NULL),
(320, 21, 'es', 320, '31 - 40', NULL, NULL, NULL, NULL),
(321, 21, 'es', 321, '41 - 50', NULL, NULL, NULL, NULL),
(322, 21, 'es', 322, '50 - 60', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 3, 'Mr'),
(2, 'en', 4, 'Mrs'),
(3, 'es', 3, 'Mr'),
(4, 'es', 4, 'Mrs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `view` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', NULL, 'home.inc.search', NULL, 0, 0, 1, 1, 1),
(2, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, 0, 2, 3, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, 0, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, 0, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, 0, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, 0, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', NULL, 'layouts.inc.advertising.top', NULL, 0, 12, 13, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, 0, 14, 15, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(2, 'es', 'es_AR', 'Spanish', 'Español', NULL, 'spanish', NULL, 'ltr', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `from_user_id` int(10) UNSIGNED DEFAULT '0',
  `from_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user_id` int(10) UNSIGNED DEFAULT '0',
  `to_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) UNSIGNED DEFAULT '0',
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `translation_of` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 9, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(2, 'en', 10, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(3, 'en', 11, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(4, 'en', 12, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(5, 'en', 13, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(6, 'en', 14, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(7, 'en', 15, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(8, 'en', 16, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(9, 'es', 9, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(10, 'es', 10, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(11, 'es', 11, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(12, 'es', 12, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(13, 'es', 13, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(14, 'es', 14, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(15, 'es', 15, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(16, 'es', 16, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT '30' COMMENT 'In days',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `duration`, `description`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 5, 'Regular List', 'FREE', NULL, 0, '0.00', 'USD', 30, 'Regular List', 0, 2, 3, 1, 0),
(2, 'en', 6, 'Urgent Ad', 'Urgent', 'red', 0, '4.99', 'USD', 30, 'Urgent', 0, 4, 5, 1, 0),
(3, 'en', 7, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 30, 'Top Ads', 0, 6, 7, 1, 0),
(4, 'en', 8, 'Top page Ad + Urgent Ad', 'Premium+', 'green', 1, '9.00', 'USD', 30, 'Featured Ads', 0, 8, 9, 1, 0),
(5, 'es', 5, 'Regular List', 'FREE', NULL, 0, '0.00', 'USD', 30, 'Regular List', 0, 2, 3, 1, 0),
(6, 'es', 6, 'Urgent Ad', 'Urgent', 'red', 0, '4.99', 'USD', 30, 'Urgent', 0, 4, 5, 1, 0),
(7, 'es', 7, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 30, 'Top Ads', 0, 6, 7, 1, 0),
(8, 'es', 8, 'Top page Ad + Urgent Ad', 'Premium+', 'green', 1, '9.00', 'USD', 30, 'Featured Ads', 0, 8, 9, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 5, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of Cotonou under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:10:40', '2019-04-03 21:50:21'),
(2, 'en', 6, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:28:37', '2019-04-03 21:50:21'),
(3, 'en', 7, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:31:56', '2019-04-03 21:50:21'),
(4, 'en', 8, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:34:56', '2019-04-03 21:50:21'),
(5, 'es', 5, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of Cotonou under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2019-04-03 21:45:44', '2019-04-03 21:50:21'),
(6, 'es', 6, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2019-04-03 21:45:44', '2019-04-03 21:50:21'),
(7, 'es', 7, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2019-04-03 21:45:44', '2019-04-03 21:50:21'),
(8, 'es', 8, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2019-04-03 21:45:44', '2019-04-03 21:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT '0',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` text COLLATE utf8_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, NULL, 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'list-permission', 'web', '2019-04-02 16:27:36', '2019-04-02 16:27:36'),
(2, 'create-permission', 'web', '2019-04-02 16:27:37', '2019-04-02 16:27:37'),
(3, 'update-permission', 'web', '2019-04-02 16:27:37', '2019-04-02 16:27:37'),
(4, 'delete-permission', 'web', '2019-04-02 16:27:37', '2019-04-02 16:27:37'),
(5, 'list-role', 'web', '2019-04-02 16:27:37', '2019-04-02 16:27:37'),
(6, 'create-role', 'web', '2019-04-02 16:27:38', '2019-04-02 16:27:38'),
(7, 'update-role', 'web', '2019-04-02 16:27:38', '2019-04-02 16:27:38'),
(8, 'delete-role', 'web', '2019-04-02 16:27:38', '2019-04-02 16:27:38'),
(9, 'access-dashboard', 'web', '2019-04-02 16:27:38', '2019-04-02 16:27:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pictures`
--

CREATE TABLE `pictures` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1' COMMENT 'Set at 0 on updating the ad',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT '0',
  `contact_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lon` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) DEFAULT '0',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `reviewed` tinyint(1) UNSIGNED DEFAULT '0',
  `featured` tinyint(1) UNSIGNED DEFAULT '0',
  `archived` tinyint(1) UNSIGNED DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `country_code`, `user_id`, `category_id`, `post_type_id`, `title`, `description`, `tags`, `price`, `negotiable`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `lon`, `lat`, `ip_addr`, `visits`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `fb_profile`, `partner`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'AR', 1, 307, 3, 'USD 1000', '<p>Esto es un test</p>', NULL, '1000.00', NULL, 'Administrador', 'admin@demosite.com', NULL, NULL, NULL, 3837213, 68.5364, 31.5375, '127.0.0.1', 1, NULL, NULL, 'da5b6a4559880a24389efa0ec3c24d98', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2019-04-14 01:32:31', '2019-04-15 22:57:15', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 3, 'Private', NULL, NULL, NULL, 1),
(2, 'en', 4, 'Professional', NULL, NULL, NULL, 1),
(3, 'es', 3, 'Private', NULL, NULL, NULL, 1),
(4, 'es', 4, 'Professional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_values`
--

CREATE TABLE `post_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 6, 'Fraud'),
(2, 'en', 7, 'Duplicate'),
(3, 'en', 8, 'Spam'),
(4, 'en', 9, 'Wrong category'),
(5, 'en', 10, 'Other'),
(6, 'es', 6, 'Fraud'),
(7, 'es', 7, 'Duplicate'),
(8, 'es', 8, 'Spam'),
(9, 'es', 9, 'Wrong category'),
(10, 'es', 10, 'Other');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'super-admin', 'web', '2019-04-02 16:27:36', '2019-04-02 16:27:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saved_search`
--

CREATE TABLE `saved_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"LOGIDAT\",\"app_name\":\"Divisas\",\"slogan\":\"Clasificados Online\",\"logo\":\"app\\/logo\\/logo-5cb4e07d13ee5.png\",\"favicon\":null,\"email\":\"admin@demosite.com\",\"phone_number\":null,\"auto_detect_language\":\"0\",\"default_date_format\":\"%d %B %Y\",\"default_datetime_format\":\"%d %B %Y %H:%M\",\"default_timezone\":\"America\\/New_York\",\"date_force_utf8\":\"0\",\"show_countries_charts\":\"1\",\"latest_entries_limit\":\"5\"}', 'Application Setup', NULL, 0, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', NULL, 'Style Customization', NULL, 0, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, 0, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads Single Page', '{\"publication_form_type\":\"2\",\"picture_mandatory\":\"0\",\"pictures_limit\":\"0\",\"tags_limit\":\"15\",\"guests_can_post_ads\":\"0\",\"posts_review_activation\":\"0\",\"auto_registration\":\"0\",\"simditor_wysiwyg\":\"1\",\"ckeditor_wysiwyg\":\"0\",\"guests_can_contact_ads_authors\":\"0\",\"show_post_on_googlemap\":\"0\",\"activation_facebook_comments\":\"0\"}', 'Ads Single Page Options', NULL, 0, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"email_sender\":\"admin@demosite.com\",\"driver\":\"mail\"}', 'Mail Sending Configuration', NULL, 0, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, 0, 12, 13, 1, 1, NULL, NULL),
(7, 'seo', 'SEO', NULL, 'SEO Tools', NULL, 0, 14, 15, 1, 1, NULL, NULL),
(8, 'upload', 'Upload', NULL, 'Upload Settings', NULL, 0, 16, 17, 1, 1, NULL, NULL),
(9, 'geo_location', 'Geo Location', '{\"default_country_code\":\"AR\"}', 'Geo Location Configuration', NULL, 0, 18, 19, 1, 1, NULL, NULL),
(10, 'security', 'Security', NULL, 'Security Options', NULL, 0, 20, 21, 1, 1, NULL, NULL),
(11, 'social_auth', 'Social Login', NULL, 'Social Network Login', NULL, 0, 22, 23, 1, 1, NULL, NULL),
(12, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, 0, 24, 25, 1, 1, NULL, NULL),
(13, 'other', 'Others', NULL, 'Other Options', NULL, 0, 26, 27, 1, 1, NULL, NULL),
(14, 'cron', 'Cron', NULL, 'Cron Job', NULL, 0, 28, 29, 1, 1, NULL, NULL),
(15, 'footer', 'Footer', '{\"hide_links\":\"0\",\"hide_payment_plugins_logos\":\"1\",\"hide_powered_by\":\"1\",\"powered_by_info\":null,\"tracking_code\":null}', 'Pages Footer', NULL, 0, 30, 31, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`) VALUES
(112, 'AR.14', 'AR', 'Misiones', 'Misiones', 1),
(113, 'AR.09', 'AR', 'Formosa', 'Formosa', 1),
(114, 'AR.07', 'AR', 'Buenos Aires F.D.', 'Buenos Aires F.D.', 1),
(115, 'AR.08', 'AR', 'Entre Rios', 'Entre Rios', 1),
(116, 'AR.06', 'AR', 'Corrientes', 'Corrientes', 1),
(117, 'AR.01', 'AR', 'Buenos Aires', 'Buenos Aires', 1),
(118, 'AR.24', 'AR', 'Tucuman', 'Tucuman', 1),
(119, 'AR.23', 'AR', 'Tierra del Fuego', 'Tierra del Fuego', 1),
(120, 'AR.22', 'AR', 'Santiago del Estero', 'Santiago del Estero', 1),
(121, 'AR.21', 'AR', 'Santa Fe', 'Santa Fe', 1),
(122, 'AR.20', 'AR', 'Santa Cruz', 'Santa Cruz', 1),
(123, 'AR.19', 'AR', 'San Luis', 'San Luis', 1),
(124, 'AR.18', 'AR', 'San Juan', 'San Juan', 1),
(125, 'AR.17', 'AR', 'Salta', 'Salta', 1),
(126, 'AR.16', 'AR', 'Rio Negro', 'Rio Negro', 1),
(127, 'AR.15', 'AR', 'Neuquen', 'Neuquen', 1),
(128, 'AR.13', 'AR', 'Mendoza', 'Mendoza', 1),
(129, 'AR.12', 'AR', 'La Rioja', 'La Rioja', 1),
(130, 'AR.11', 'AR', 'La Pampa', 'La Pampa', 1),
(131, 'AR.10', 'AR', 'Jujuy', 'Jujuy', 1),
(132, 'AR.05', 'AR', 'Cordoba', 'Cordoba', 1),
(133, 'AR.04', 'AR', 'Chubut', 'Chubut', 1),
(134, 'AR.03', 'AR', 'Chaco', 'Chaco', 1),
(135, 'AR.02', 'AR', 'Catamarca', 'Catamarca', 1),
(586, 'CL.01', 'CL', 'Valparaíso', 'Valparaiso', 1),
(587, 'CL.15', 'CL', 'Tarapacá', 'Tarapaca', 1),
(588, 'CL.12', 'CL', 'Santiago Metropolitan', 'Santiago Metropolitan', 1),
(589, 'CL.11', 'CL', 'Maule', 'Maule', 1),
(590, 'CL.14', 'CL', 'Los Lagos', 'Los Lagos', 1),
(591, 'CL.08', 'CL', 'O\'Higgins Region', 'O\'Higgins Region', 1),
(592, 'CL.07', 'CL', 'Coquimbo', 'Coquimbo', 1),
(593, 'CL.06', 'CL', 'Biobío', 'Biobio', 1),
(594, 'CL.05', 'CL', 'Atacama', 'Atacama', 1),
(595, 'CL.04', 'CL', 'Araucanía', 'Araucania', 1),
(596, 'CL.03', 'CL', 'Antofagasta', 'Antofagasta', 1),
(597, 'CL.02', 'CL', 'Aysén', 'Aysen', 1),
(598, 'CL.10', 'CL', 'Magallanes', 'Magallanes', 1),
(599, 'CL.16', 'CL', 'Arica y Parinacota', 'Arica y Parinacota', 1),
(600, 'CL.17', 'CL', 'Los Ríos', 'Los Rios', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`) VALUES
(708, 'AR.01.06882', 'AR', 'AR.01', 'Partido de Zárate', 'Partido de Zarate', 1),
(709, 'AR.08.30113', 'AR', 'AR.08', 'Departamento de Villaguay', 'Departamento de Villaguay', 1),
(710, 'AR.01.06861', 'AR', 'AR.01', 'Partido de Vicente López', 'Partido de Vicente Lopez', 1),
(711, 'AR.03.22168', 'AR', 'AR.03', 'Veinticinco de Mayo', 'Veinticinco de Mayo', 1),
(712, 'AR.14.54119', 'AR', 'AR.14', 'Departamento de Veinticinco de Mayo', 'Departamento de Veinticinco de Mayo', 1),
(713, 'AR.08.30098', 'AR', 'AR.08', 'Departamento de Uruguay', 'Departamento de Uruguay', 1),
(714, 'AR.01.06840', 'AR', 'AR.01', 'Partido de Tres de Febrero', 'Partido de Tres de Febrero', 1),
(715, 'AR.01.06812', 'AR', 'AR.01', 'Partido de Tordillo', 'Partido de Tordillo', 1),
(716, 'AR.01.06805', 'AR', 'AR.01', 'Partido de Tigre', 'Partido de Tigre', 1),
(717, 'AR.03.22161', 'AR', 'AR.03', 'Departamento de Tapenagá', 'Departamento de Tapenaga', 1),
(718, 'AR.01.06791', 'AR', 'AR.01', 'Partido de Tandil', 'Partido de Tandil', 1),
(719, 'AR.08.30091', 'AR', 'AR.08', 'Departamento de Tala', 'Departamento de Tala', 1),
(720, 'AR.01.06784', 'AR', 'AR.01', 'Partido de Suipacha', 'Partido de Suipacha', 1),
(721, 'AR.06.18175', 'AR', 'AR.06', 'Departamento de Sauce', 'Departamento de Sauce', 1),
(722, 'AR.03.22154', 'AR', 'AR.03', 'Departamento de Sargento Cabral', 'Departamento de Sargento Cabral', 1),
(723, 'AR.01.06778', 'AR', 'AR.01', 'Partido de San Vicente', 'Partido de San Vicente', 1),
(724, 'AR.06.18168', 'AR', 'AR.06', 'Departamento de Santo Tomé', 'Departamento de Santo Tome', 1),
(725, 'AR.06.18161', 'AR', 'AR.06', 'Departamento de San Roque', 'Departamento de San Roque', 1),
(726, 'AR.01.06770', 'AR', 'AR.01', 'Partido de San Pedro', 'Partido de San Pedro', 1),
(727, 'AR.14.54112', 'AR', 'AR.14', 'Departamento de San Pedro', 'Departamento de San Pedro', 1),
(728, 'AR.06.18154', 'AR', 'AR.06', 'Departamento de San Miguel', 'Departamento de San Miguel', 1),
(729, 'AR.06.18147', 'AR', 'AR.06', 'Departamento de San Martín', 'Departamento de San Martin', 1),
(730, 'AR.06.18140', 'AR', 'AR.06', 'Departamento de San Luis del Palmar', 'Departamento de San Luis del Palmar', 1),
(731, 'AR.21.82098', 'AR', 'AR.21', 'Departamento de San Javier', 'Departamento de San Javier', 1),
(732, 'AR.14.54105', 'AR', 'AR.14', 'Departamento de San Javier', 'Departamento de San Javier', 1),
(733, 'AR.01.06756', 'AR', 'AR.01', 'Partido de San Isidro', 'Partido de San Isidro', 1),
(734, 'AR.14.54098', 'AR', 'AR.14', 'Departamento de San Ignacio', 'Departamento de San Ignacio', 1),
(735, 'AR.01.06749', 'AR', 'AR.01', 'Partido de San Fernando', 'Partido de San Fernando', 1),
(736, 'AR.03.22140', 'AR', 'AR.03', 'Departamento de San Fernando', 'Departamento de San Fernando', 1),
(737, 'AR.06.18133', 'AR', 'AR.06', 'Departamento de San Cosme', 'Departamento de San Cosme', 1),
(738, 'AR.01.06742', 'AR', 'AR.01', 'Partido de San Cayetano', 'Partido de San Cayetano', 1),
(739, 'AR.01.06735', 'AR', 'AR.01', 'San Antonio de Areco', 'San Antonio de Areco', 1),
(740, 'AR.01.06728', 'AR', 'AR.01', 'Partido de San Andrés de Giles', 'Partido de San Andres de Giles', 1),
(741, 'AR.01.06707', 'AR', 'AR.01', 'Partido de Saladillo', 'Partido de Saladillo', 1),
(742, 'AR.06.18126', 'AR', 'AR.06', 'Departamento de Saladas', 'Departamento de Saladas', 1),
(743, 'AR.01.06693', 'AR', 'AR.01', 'Partido de Roque Pérez', 'Partido de Roque Perez', 1),
(744, 'AR.01.06672', 'AR', 'AR.01', 'Partido de Rauch', 'Partido de Rauch', 1),
(745, 'AR.01.06658', 'AR', 'AR.01', 'Partido de Quilmes', 'Partido de Quilmes', 1),
(746, 'AR.03.22126', 'AR', 'AR.03', 'Departamento del Primero de Mayo', 'Departamento del Primero de Mayo', 1),
(747, 'AR.03.22119', 'AR', 'AR.03', 'Departamento de Presidencia de la Plaza', 'Departamento de Presidencia de la Plaza', 1),
(748, 'AR.09.34056', 'AR', 'AR.09', 'Departamento de Pirané', 'Departamento de Pirane', 1),
(749, 'AR.09.34049', 'AR', 'AR.09', 'Departamento de Pilcomayo', 'Departamento de Pilcomayo', 1),
(750, 'AR.01.06638', 'AR', 'AR.01', 'Partido de Pilar', 'Partido de Pilar', 1),
(751, 'AR.09.34042', 'AR', 'AR.09', 'Departamento de Pilagás', 'Departamento de Pilagas', 1),
(752, 'AR.01.06630', 'AR', 'AR.01', 'Partido de Pila', 'Partido de Pila', 1),
(753, 'AR.09.34035', 'AR', 'AR.09', 'Departamento de Patiño', 'Departamento de Patino', 1),
(754, 'AR.06.18119', 'AR', 'AR.06', 'Departamento de Paso de los Libres', 'Departamento de Paso de los Libres', 1),
(755, 'AR.08.30084', 'AR', 'AR.08', 'Departamento de Paraná', 'Departamento de Parana', 1),
(756, 'AR.14.54091', 'AR', 'AR.14', 'Departamento de Oberá', 'Departamento de Obera', 1),
(757, 'AR.08.30077', 'AR', 'AR.08', 'Departamento de Nogoyá', 'Departamento de Nogoya', 1),
(758, 'AR.01.06581', 'AR', 'AR.01', 'Partido de Necochea', 'Partido de Necochea', 1),
(759, 'AR.01.06574', 'AR', 'AR.01', 'Partido de Navarro', 'Partido de Navarro', 1),
(760, 'AR.01.06568', 'AR', 'AR.01', 'Partido de Morón', 'Partido de Moron', 1),
(761, 'AR.01.06560', 'AR', 'AR.01', 'Partido de Moreno', 'Partido de Moreno', 1),
(762, 'AR.06.18112', 'AR', 'AR.06', 'Departamento de Monte Caseros', 'Departamento de Monte Caseros', 1),
(763, 'AR.14.54084', 'AR', 'AR.14', 'Departamento de Montecarlo', 'Departamento de Montecarlo', 1),
(764, 'AR.01.06547', 'AR', 'AR.01', 'Partido de Monte', 'Partido de Monte', 1),
(765, 'AR.01.06539', 'AR', 'AR.01', 'Partido de Merlo', 'Partido de Merlo', 1),
(766, 'AR.01.06532', 'AR', 'AR.01', 'Partido de Mercedes', 'Partido de Mercedes', 1),
(767, 'AR.06.18105', 'AR', 'AR.06', 'Departamento de Mercedes', 'Departamento de Mercedes', 1),
(768, 'AR.06.18098', 'AR', 'AR.06', 'Departamento de Mburucuyá', 'Departamento de Mburucuya', 1),
(769, 'AR.01.06427', 'AR', 'AR.01', 'Partido de La Matanza', 'Partido de La Matanza', 1),
(770, 'AR.01.06648', 'AR', 'AR.01', 'Partido de Presidente Perón', 'Partido de Presidente Peron', 1),
(771, 'AR.01.06644', 'AR', 'AR.01', 'Partido de Pinamar', 'Partido de Pinamar', 1),
(772, 'AR.01.06525', 'AR', 'AR.01', 'Partido de Marcos Paz', 'Partido de Marcos Paz', 1),
(773, 'AR.01.06518', 'AR', 'AR.01', 'Partido de Mar Chiquita', 'Partido de Mar Chiquita', 1),
(774, 'AR.01.06511', 'AR', 'AR.01', 'Partido de Maipú', 'Partido de Maipu', 1),
(775, 'AR.01.06505', 'AR', 'AR.01', 'Partido de Magdalena', 'Partido de Magdalena', 1),
(776, 'AR.01.06497', 'AR', 'AR.01', 'Partido de Luján', 'Partido de Lujan', 1),
(777, 'AR.01.06490', 'AR', 'AR.01', 'Partido de Lomas de Zamora', 'Partido de Lomas de Zamora', 1),
(778, 'AR.01.06483', 'AR', 'AR.01', 'Partido de Lobos', 'Partido de Lobos', 1),
(779, 'AR.01.06476', 'AR', 'AR.01', 'Partido de Lobería', 'Partido de Loberia', 1),
(780, 'AR.03.22084', 'AR', 'AR.03', 'Departamento de Libertador General San Martín', 'Departamento de Libertador General San Martin', 1),
(781, 'AR.14.54077', 'AR', 'AR.14', 'Departamento de Libertador General San Martín', 'Departamento de Libertador General San Martin', 1),
(782, 'AR.03.22077', 'AR', 'AR.03', 'Departamento de Libertad', 'Departamento de Libertad', 1),
(783, 'AR.14.54070', 'AR', 'AR.14', 'Departamento de Leandro N. Alem', 'Departamento de Leandro N. Alem', 1),
(784, 'AR.06.18091', 'AR', 'AR.06', 'Departamento de Lavalle', 'Departamento de Lavalle', 1),
(785, 'AR.01.06455', 'AR', 'AR.01', 'Partido de Las Flores', 'Partido de Las Flores', 1),
(786, 'AR.01.06441', 'AR', 'AR.01', 'Partido de La Plata', 'Partido de La Plata', 1),
(787, 'AR.08.30070', 'AR', 'AR.08', 'Departamento de La Paz', 'Departamento de La Paz', 1),
(788, 'AR.01.06434', 'AR', 'AR.01', 'Partido de Lanús', 'Partido de Lanus', 1),
(789, 'AR.09.34021', 'AR', 'AR.09', 'Departamento de Laishí', 'Departamento de Laishi', 1),
(790, 'AR.01.06084', 'AR', 'AR.01', 'Partido de Benito Juárez', 'Partido de Benito Juarez', 1),
(791, 'AR.01.06412', 'AR', 'AR.01', 'Partido de José C. Paz', 'Partido de Jose C. Paz', 1),
(792, 'AR.06.18084', 'AR', 'AR.06', 'Departamento de Ituzaingó', 'Departamento de Ituzaingo', 1),
(793, 'AR.06.18077', 'AR', 'AR.06', 'Departamento de Itatí', 'Departamento de Itati', 1),
(794, 'AR.01.06655', 'AR', 'AR.01', 'Partido de Punta Indio', 'Partido de Punta Indio', 1),
(795, 'AR.14.54063', 'AR', 'AR.14', 'Departamento de Iguazú', 'Departamento de Iguazu', 1),
(796, 'AR.14.54056', 'AR', 'AR.14', 'Departamento de Guaraní', 'Departamento de Guarani', 1),
(797, 'AR.08.30056', 'AR', 'AR.08', 'Departamento de Gualeguaychú', 'Departamento de Gualeguaychu', 1),
(798, 'AR.08.30049', 'AR', 'AR.08', 'Departamento de Gualeguay', 'Departamento de Gualeguay', 1),
(799, 'AR.06.18070', 'AR', 'AR.06', 'Departamento de Goya', 'Departamento de Goya', 1),
(800, 'AR.01.06371', 'AR', 'AR.01', 'Partido de General San Martín', 'Partido de General San Martin', 1),
(801, 'AR.01.06364', 'AR', 'AR.01', 'Partido de General Rodríguez', 'Partido de General Rodriguez', 1),
(802, 'AR.01.06357', 'AR', 'AR.01', 'Partido de General Pueyrredón', 'Partido de General Pueyrredon', 1),
(803, 'AR.01.06343', 'AR', 'AR.01', 'Partido de General Paz', 'Partido de General Paz', 1),
(804, 'AR.06.18063', 'AR', 'AR.06', 'Departamento de General Paz', 'Departamento de General Paz', 1),
(805, 'AR.21.82049', 'AR', 'AR.21', 'General Obligado Department', 'General Obligado Department', 1),
(806, 'AR.14.54049', 'AR', 'AR.14', 'Departamento de General Manuel Belgrano', 'Departamento de General Manuel Belgrano', 1),
(807, 'AR.01.06336', 'AR', 'AR.01', 'Partido de General Lavalle', 'Partido de General Lavalle', 1),
(808, 'AR.01.06329', 'AR', 'AR.01', 'Partido de General Las Heras', 'Partido de General Las Heras', 1),
(809, 'AR.01.06315', 'AR', 'AR.01', 'Partido de General Madariaga', 'Partido de General Madariaga', 1),
(810, 'AR.01.06308', 'AR', 'AR.01', 'Partido de General Guido', 'Partido de General Guido', 1),
(811, 'AR.03.22056', 'AR', 'AR.03', 'Departamento de General Donovan', 'Departamento de General Donovan', 1),
(812, 'AR.01.06301', 'AR', 'AR.01', 'Partido de General Belgrano', 'Partido de General Belgrano', 1),
(813, 'AR.06.18056', 'AR', 'AR.06', 'Departamento de General Alvear', 'Departamento de General Alvear', 1),
(814, 'AR.01.06280', 'AR', 'AR.01', 'Partido de General Alvarado', 'Partido de General Alvarado', 1),
(815, 'AR.09.34014', 'AR', 'AR.09', 'Departamento de Formosa', 'Departamento de Formosa', 1),
(816, 'AR.01.06274', 'AR', 'AR.01', 'Partido de Florencio Varela', 'Partido de Florencio Varela', 1),
(817, 'AR.08.30042', 'AR', 'AR.08', 'Departamento de Feliciano', 'Departamento de Feliciano', 1),
(818, 'AR.08.30028', 'AR', 'AR.08', 'Departamento de Federación', 'Departamento de Federacion', 1),
(819, 'AR.01.06266', 'AR', 'AR.01', 'Partido de Exaltación de la Cruz', 'Partido de Exaltacion de la Cruz', 1),
(820, 'AR.01.06260', 'AR', 'AR.01', 'Partido de Esteban Echeverría', 'Partido de Esteban Echeverria', 1),
(821, 'AR.06.18049', 'AR', 'AR.06', 'Departamento de Esquina', 'Departamento de Esquina', 1),
(822, 'AR.01.06252', 'AR', 'AR.01', 'Partido de Escobar', 'Partido de Escobar', 1),
(823, 'AR.01.06245', 'AR', 'AR.01', 'Partido de Ensenada', 'Partido de Ensenada', 1),
(824, 'AR.06.18042', 'AR', 'AR.06', 'Departamento de Empedrado', 'Departamento de Empedrado', 1),
(825, 'AR.14.54042', 'AR', 'AR.14', 'Departamento de Eldorado', 'Departamento de Eldorado', 1),
(826, 'AR.01.06238', 'AR', 'AR.01', 'Partido de Dolores', 'Partido de Dolores', 1),
(827, 'AR.06.18035', 'AR', 'AR.06', 'Departamento de Curuzú Cuatiá', 'Departamento de Curuzu Cuatia', 1),
(828, 'AR.08.30015', 'AR', 'AR.08', 'Departamento de Concordia', 'Departamento de Concordia', 1),
(829, 'AR.06.18028', 'AR', 'AR.06', 'Departamento de Concepción', 'Departamento de Concepcion', 1),
(830, 'AR.14.54035', 'AR', 'AR.14', 'Departamento de Concepción de la Sierra', 'Departamento de Concepcion de la Sierra', 1),
(831, 'AR.08.30008', 'AR', 'AR.08', 'Departamento de Colón', 'Departamento de Colon', 1),
(832, 'AR.01.06224', 'AR', 'AR.01', 'Partido de Chivilcoy', 'Partido de Chivilcoy', 1),
(833, 'AR.01.06218', 'AR', 'AR.01', 'Partido de Chascomús', 'Partido de Chascomus', 1),
(834, 'AR.01.06168', 'AR', 'AR.01', 'Partido de Castelli', 'Partido de Castelli', 1),
(835, 'AR.01.06161', 'AR', 'AR.01', 'Partido de Carmen de Areco', 'Partido de Carmen de Areco', 1),
(836, 'AR.01.06140', 'AR', 'AR.01', 'Partido de Capitán Sarmiento', 'Partido de Capitan Sarmiento', 1),
(837, 'AR.06.18021', 'AR', 'AR.06', 'Departamento de Capital', 'Departamento de Capital', 1),
(838, 'AR.14.54028', 'AR', 'AR.14', 'Departamento de Capital', 'Departamento de Capital', 1),
(839, 'AR.01.06134', 'AR', 'AR.01', 'Partido de Canuelas', 'Partido de Canuelas', 1),
(840, 'AR.14.54021', 'AR', 'AR.14', 'Departamento de Candelaria', 'Departamento de Candelaria', 1),
(841, 'AR.01.06126', 'AR', 'AR.01', 'Partido de Campana', 'Partido de Campana', 1),
(842, 'AR.14.54014', 'AR', 'AR.14', 'Departamento de Cainguás', 'Departamento de Cainguas', 1),
(843, 'AR.01.06119', 'AR', 'AR.01', 'Partido de Brandsen', 'Partido de Brandsen', 1),
(844, 'AR.06.18014', 'AR', 'AR.06', 'Departamento de Berón de Astrada', 'Departamento de Beron de Astrada', 1),
(845, 'AR.03.22014', 'AR', 'AR.03', 'Departamento de Bermejo', 'Departamento de Bermejo', 1),
(846, 'AR.01.06098', 'AR', 'AR.01', 'Partido de Berisso', 'Partido de Berisso', 1),
(847, 'AR.01.06091', 'AR', 'AR.01', 'Partido de Berazategui', 'Partido de Berazategui', 1),
(848, 'AR.06.18007', 'AR', 'AR.06', 'Departamento de Bella Vista', 'Departamento de Bella Vista', 1),
(849, 'AR.01.06077', 'AR', 'AR.01', 'Partido de Arrecifes', 'Partido de Arrecifes', 1),
(850, 'AR.01.06070', 'AR', 'AR.01', 'Partido de Baradero', 'Partido de Baradero', 1),
(851, 'AR.01.06063', 'AR', 'AR.01', 'Partido de Balcarce', 'Partido de Balcarce', 1),
(852, 'AR.01.06049', 'AR', 'AR.01', 'Partido de Azul', 'Partido de Azul', 1),
(853, 'AR.01.06042', 'AR', 'AR.01', 'Partido de Ayacucho', 'Partido de Ayacucho', 1),
(854, 'AR.01.06035', 'AR', 'AR.01', 'Partido de Avellaneda', 'Partido de Avellaneda', 1),
(855, 'AR.14.54007', 'AR', 'AR.14', 'Departamento de Apóstoles', 'Departamento de Apostoles', 1),
(856, 'AR.01.06028', 'AR', 'AR.01', 'Partido de Almirante Brown', 'Partido de Almirante Brown', 1),
(857, 'AR.18.70133', 'AR', 'AR.18', 'Departamento de Zonda', 'Departamento de Zonda', 1),
(858, 'AR.15.58112', 'AR', 'AR.15', 'Departamento de Zapala', 'Departamento de Zapala', 1),
(859, 'AR.10.38112', 'AR', 'AR.10', 'Departamento de Yaví', 'Departamento de Yavi', 1),
(860, 'AR.01.06875', 'AR', 'AR.01', 'Partido de Villarino', 'Partido de Villarino', 1),
(861, 'AR.08.30105', 'AR', 'AR.08', 'Departamento de Victoria', 'Departamento de Victoria', 1),
(862, 'AR.21.82133', 'AR', 'AR.21', 'Departamento de Vera', 'Departamento de Vera', 1),
(863, 'AR.12.46056', 'AR', 'AR.12', 'Departamento de General Angel Peñaloza', 'Departamento de General Angel Penaloza', 1),
(864, 'AR.01.06854', 'AR', 'AR.01', 'Partido de Veinticinco de Mayo', 'Partido de Veinticinco de Mayo', 1),
(865, 'AR.16.62091', 'AR', 'AR.16', 'Departamento de Veinticinco de Mayo', 'Departamento de Veinticinco de Mayo', 1),
(866, 'AR.18.70126', 'AR', 'AR.18', 'Departamento de Veinticinco de Mayo', 'Departamento de Veinticinco de Mayo', 1),
(867, 'AR.02.10112', 'AR', 'AR.02', 'Departamento de Valle Viejo', 'Departamento de Valle Viejo', 1),
(868, 'AR.10.38105', 'AR', 'AR.10', 'Departamento de Valle Grande', 'Departamento de Valle Grande', 1),
(869, 'AR.18.70119', 'AR', 'AR.18', 'Departamento de Valle Fértil', 'Departamento de Valle Fertil', 1),
(870, 'AR.16.62084', 'AR', 'AR.16', 'Departamento de Valcheta', 'Departamento de Valcheta', 1),
(871, 'AR.11.42154', 'AR', 'AR.11', 'Departamento de Utracán', 'Departamento de Utracan', 1),
(872, 'AR.23.94014', 'AR', 'AR.23', 'Departamento de Ushuaia', 'Departamento de Ushuaia', 1),
(873, 'AR.05.14182', 'AR', 'AR.05', 'Departamento de Unión', 'Departamento de Union', 1),
(874, 'AR.18.70112', 'AR', 'AR.18', 'Departamento de Ullúm', 'Departamento de Ullum', 1),
(875, 'AR.13.50126', 'AR', 'AR.13', 'Departamento de Tupungato', 'Departamento de Tupungato', 1),
(876, 'AR.13.50119', 'AR', 'AR.13', 'Departamento de Tunuyán', 'Departamento de Tunuyan', 1),
(877, 'AR.10.38098', 'AR', 'AR.10', 'Departamento de Tumbaya', 'Departamento de Tumbaya', 1),
(878, 'AR.05.14175', 'AR', 'AR.05', 'Departamento de Tulumba', 'Departamento de Tulumba', 1),
(879, 'AR.01.06833', 'AR', 'AR.01', 'Partido de Tres Arroyos', 'Partido de Tres Arroyos', 1),
(880, 'AR.01.06826', 'AR', 'AR.01', 'Partido de Trenque Lauquen', 'Partido de Trenque Lauquen', 1),
(881, 'AR.11.42147', 'AR', 'AR.11', 'Departamento de Trenel', 'Departamento de Trenel', 1),
(882, 'AR.24.90112', 'AR', 'AR.24', 'Departamento de Trancas', 'Departamento de Trancas', 1),
(883, 'AR.05.14168', 'AR', 'AR.05', 'Departamento de Totoral', 'Departamento de Totoral', 1),
(884, 'AR.01.06819', 'AR', 'AR.01', 'Partido de Tornquist', 'Partido de Tornquist', 1),
(885, 'AR.11.42140', 'AR', 'AR.11', 'Departamento de Toay', 'Departamento de Toay', 1),
(886, 'AR.02.10105', 'AR', 'AR.02', 'Departamento de Tinogasta', 'Departamento de Tinogasta', 1),
(887, 'AR.10.38094', 'AR', 'AR.10', 'Departamento de Tilcara', 'Departamento de Tilcara', 1),
(888, 'AR.05.14161', 'AR', 'AR.05', 'Departamento de Tercero Arriba', 'Departamento de Tercero Arriba', 1),
(889, 'AR.04.26105', 'AR', 'AR.04', 'Departamento de Telsen', 'Departamento de Telsen', 1),
(890, 'AR.04.26098', 'AR', 'AR.04', 'Departamento de Tehuelches', 'Departamento de Tehuelches', 1),
(891, 'AR.01.06798', 'AR', 'AR.01', 'Partido de Tapalqué', 'Partido de Tapalque', 1),
(892, 'AR.10.38084', 'AR', 'AR.10', 'Departamento de Susques', 'Departamento de Susques', 1),
(893, 'AR.05.14154', 'AR', 'AR.05', 'Departamento de Sobremonte', 'Departamento de Sobremonte', 1),
(894, 'AR.22.86189', 'AR', 'AR.22', 'Departamento de Silípica', 'Departamento de Silipica', 1),
(895, 'AR.04.26091', 'AR', 'AR.04', 'Departamento de Sarmiento', 'Departamento de Sarmiento', 1),
(896, 'AR.18.70105', 'AR', 'AR.18', 'Departamento de Sarmiento', 'Departamento de Sarmiento', 1),
(897, 'AR.22.86182', 'AR', 'AR.22', 'Departamento de Sarmiento', 'Departamento de Sarmiento', 1),
(898, 'AR.17.66161', 'AR', 'AR.17', 'Departamento de Santa Victoria', 'Departamento de Santa Victoria', 1),
(899, 'AR.13.50112', 'AR', 'AR.13', 'Departamento de Santa Rosa', 'Departamento de Santa Rosa', 1),
(900, 'AR.02.10098', 'AR', 'AR.02', 'Departamento de Santa Rosa', 'Departamento de Santa Rosa', 1),
(901, 'AR.05.14147', 'AR', 'AR.05', 'Departamento de Santa María', 'Departamento de Santa Maria', 1),
(902, 'AR.02.10091', 'AR', 'AR.02', 'Departamento de Santa María', 'Departamento de Santa Maria', 1),
(903, 'AR.18.70098', 'AR', 'AR.18', 'Departamento de Santa Lucía', 'Departamento de Santa Lucia', 1),
(904, 'AR.10.38077', 'AR', 'AR.10', 'Departamento de Santa Catalina', 'Departamento de Santa Catalina', 1),
(905, 'AR.10.38070', 'AR', 'AR.10', 'Departamento de Santa Bárbara', 'Departamento de Santa Barbara', 1),
(906, 'AR.23.94007', 'AR', 'AR.23', 'Departamento de Río Grande', 'Departamento de Rio Grande', 1),
(907, 'AR.13.50105', 'AR', 'AR.13', 'Departamento de San Rafael', 'Departamento de San Rafael', 1),
(908, 'AR.10.38063', 'AR', 'AR.10', 'Departamento de San Pedro', 'Departamento de San Pedro', 1),
(909, 'AR.01.06763', 'AR', 'AR.01', 'Partido de San Nicolás', 'Partido de San Nicolas', 1),
(910, 'AR.13.50098', 'AR', 'AR.13', 'Departamento de San Martín', 'Departamento de San Martin', 1),
(911, 'AR.19.74063', 'AR', 'AR.19', 'Departamento de Libertador General San Martín', 'Departamento de Libertador General San Martin', 1),
(912, 'AR.21.82126', 'AR', 'AR.21', 'Departamento de San Martín', 'Departamento de San Martin', 1),
(913, 'AR.18.70091', 'AR', 'AR.18', 'Departamento de San Martín', 'Departamento de San Martin', 1),
(914, 'AR.22.86175', 'AR', 'AR.22', 'Departamento de San Martín', 'Departamento de San Martin', 1),
(915, 'AR.03.22147', 'AR', 'AR.03', 'Departamento de San Lorenzo', 'Departamento de San Lorenzo', 1),
(916, 'AR.21.82119', 'AR', 'AR.21', 'Departamento de San Lorenzo', 'Departamento de San Lorenzo', 1),
(917, 'AR.05.14140', 'AR', 'AR.05', 'Departamento de San Justo', 'Departamento de San Justo', 1),
(918, 'AR.21.82112', 'AR', 'AR.21', 'Departamento de San Justo', 'Departamento de San Justo', 1),
(919, 'AR.21.82105', 'AR', 'AR.21', 'San Jerónimo Department', 'San Jeronimo Department', 1),
(920, 'AR.05.14133', 'AR', 'AR.05', 'Departamento de San Javier', 'Departamento de San Javier', 1),
(921, 'AR.21.82091', 'AR', 'AR.21', 'Departamento de San Cristóbal', 'Departamento de San Cristobal', 1),
(922, 'AR.13.50091', 'AR', 'AR.13', 'Departamento de San Carlos', 'Departamento de San Carlos', 1),
(923, 'AR.17.66154', 'AR', 'AR.17', 'Departamento de San Carlos', 'Departamento de San Carlos', 1),
(924, 'AR.12.46119', 'AR', 'AR.12', 'Departamento de San Blas de los Sauces', 'Departamento de San Blas de los Sauces', 1),
(925, 'AR.16.62077', 'AR', 'AR.16', 'Departamento de San Antonio', 'Departamento de San Antonio', 1),
(926, 'AR.10.38056', 'AR', 'AR.10', 'Departamento de San Antonio', 'Departamento de San Antonio', 1),
(927, 'AR.05.14126', 'AR', 'AR.05', 'Departamento de San Alberto', 'Departamento de San Alberto', 1),
(928, 'AR.12.46126', 'AR', 'AR.12', 'Departamento de Sanagasta', 'Departamento de Sanagasta', 1),
(929, 'AR.01.06714', 'AR', 'AR.01', 'Partido de Salto', 'Partido de Salto', 1),
(930, 'AR.01.06721', 'AR', 'AR.01', 'Partido de Salliqueló', 'Partido de Salliquelo', 1),
(931, 'AR.22.86168', 'AR', 'AR.22', 'Departamento de Salavina', 'Departamento de Salavina', 1),
(932, 'AR.01.06700', 'AR', 'AR.01', 'Partido de Saavedra', 'Partido de Saavedra', 1),
(933, 'AR.17.66147', 'AR', 'AR.17', 'Departamento de Rosario de Lerma', 'Departamento de Rosario de Lerma', 1),
(934, 'AR.17.66140', 'AR', 'AR.17', 'Departamento de Rosario de la Frontera', 'Departamento de Rosario de la Frontera', 1),
(935, 'AR.21.82084', 'AR', 'AR.21', 'Rosario Department', 'Rosario Department', 1),
(936, 'AR.01.06686', 'AR', 'AR.01', 'Partido de Rojas', 'Partido de Rojas', 1),
(937, 'AR.22.86161', 'AR', 'AR.22', 'Departamento de Robles', 'Departamento de Robles', 1),
(938, 'AR.01.06679', 'AR', 'AR.01', 'Partido de Rivadavia', 'Partido de Rivadavia', 1),
(939, 'AR.12.46070', 'AR', 'AR.12', 'Departamento de General Juan F. Quiroga', 'Departamento de General Juan F. Quiroga', 1),
(940, 'AR.18.70084', 'AR', 'AR.18', 'Departamento de Rivadavia', 'Departamento de Rivadavia', 1),
(941, 'AR.13.50084', 'AR', 'AR.13', 'Departamento de Rivadavia', 'Departamento de Rivadavia', 1),
(942, 'AR.22.86154', 'AR', 'AR.22', 'Departamento de Rivadavia', 'Departamento de Rivadavia', 1),
(943, 'AR.17.66133', 'AR', 'AR.17', 'Departamento de Rivadavia', 'Departamento de Rivadavia', 1),
(944, 'AR.04.26084', 'AR', 'AR.04', 'Departamento de Río Senguerr', 'Departamento de Rio Senguerr', 1),
(945, 'AR.05.14119', 'AR', 'AR.05', 'Departamento de Río Segundo', 'Departamento de Rio Segundo', 1),
(946, 'AR.05.14112', 'AR', 'AR.05', 'Departamento de Río Seco', 'Departamento de Rio Seco', 1),
(947, 'AR.05.14105', 'AR', 'AR.05', 'Departamento de Río Primero', 'Departamento de Rio Primero', 1),
(948, 'AR.22.86147', 'AR', 'AR.22', 'Departamento de Río Hondo', 'Departamento de Rio Hondo', 1),
(949, 'AR.05.14098', 'AR', 'AR.05', 'Departamento de Río Cuarto', 'Departamento de Rio Cuarto', 1),
(950, 'AR.20.78049', 'AR', 'AR.20', 'Departamento de Río Chico', 'Departamento de Rio Chico', 1),
(951, 'AR.24.90077', 'AR', 'AR.24', 'Departamento de Río Chico', 'Departamento de Rio Chico', 1),
(952, 'AR.10.38049', 'AR', 'AR.10', 'Departamento de Rinconada', 'Departamento de Rinconada', 1),
(953, 'AR.11.42133', 'AR', 'AR.11', 'Departamento de Realicó', 'Departamento de Realico', 1),
(954, 'AR.04.26077', 'AR', 'AR.04', 'Departamento de Rawson', 'Departamento de Rawson', 1),
(955, 'AR.18.70077', 'AR', 'AR.18', 'Departamento de Rawson', 'Departamento de Rawson', 1),
(956, 'AR.11.42126', 'AR', 'AR.11', 'Departamento de Rancul', 'Departamento de Rancul', 1),
(957, 'AR.09.34063', 'AR', 'AR.09', 'Departamento de Ramón Lista', 'Departamento de Ramon Lista', 1),
(958, 'AR.01.06665', 'AR', 'AR.01', 'Partido de Ramallo', 'Partido de Ramallo', 1),
(959, 'AR.03.22133', 'AR', 'AR.03', 'Departamento de Quitilipi', 'Departamento de Quitilipi', 1),
(960, 'AR.11.42119', 'AR', 'AR.11', 'Departamento de Quemú Quemú', 'Departamento de Quemu Quemu', 1),
(961, 'AR.22.86140', 'AR', 'AR.22', 'Departamento de Quebrachos', 'Departamento de Quebrachos', 1),
(962, 'AR.05.14091', 'AR', 'AR.05', 'Departamento de Punilla', 'Departamento de Punilla', 1),
(963, 'AR.11.42112', 'AR', 'AR.11', 'Departamento de Puelén', 'Departamento de Puelen', 1),
(964, 'AR.01.06651', 'AR', 'AR.01', 'Partido de Puan', 'Partido de Puan', 1),
(965, 'AR.19.74021', 'AR', 'AR.19', 'Coronel Pringles', 'Coronel Pringles', 1),
(966, 'AR.05.14084', 'AR', 'AR.05', 'Departamento de Presidente Roque Sáenz Peña', 'Departamento de Presidente Roque Saenz Pena', 1),
(967, 'AR.02.10084', 'AR', 'AR.02', 'Departamento de Pomán', 'Departamento de Poman', 1),
(968, 'AR.18.70070', 'AR', 'AR.18', 'Departamento de Pocito', 'Departamento de Pocito', 1),
(969, 'AR.05.14077', 'AR', 'AR.05', 'Departamento de Pocho', 'Departamento de Pocho', 1),
(970, 'AR.16.62070', 'AR', 'AR.16', 'Departamento de Pilcaniyeu', 'Departamento de Pilcaniyeu', 1),
(971, 'AR.15.58098', 'AR', 'AR.15', 'Departamento de Picún Leufú', 'Departamento de Picun Leufu', 1),
(972, 'AR.15.58105', 'AR', 'AR.15', 'Departamento de Picunches', 'Departamento de Picunches', 1),
(973, 'AR.16.62063', 'AR', 'AR.16', 'Departamento de Pichi Mahuida', 'Departamento de Pichi Mahuida', 1),
(974, 'AR.01.06623', 'AR', 'AR.01', 'Partido de Pergamino', 'Partido de Pergamino', 1),
(975, 'AR.01.06616', 'AR', 'AR.01', 'Partido de Pellegrini', 'Partido de Pellegrini', 1),
(976, 'AR.22.86133', 'AR', 'AR.22', 'Departamento de Pellegrini', 'Departamento de Pellegrini', 1),
(977, 'AR.15.58091', 'AR', 'AR.15', 'Departamento de Pehuenches', 'Departamento de Pehuenches', 1),
(978, 'AR.01.06609', 'AR', 'AR.01', 'Partido de Pehuajó', 'Partido de Pehuajo', 1),
(979, 'AR.01.06602', 'AR', 'AR.01', 'Partido de Patagones', 'Partido de Patagones', 1),
(980, 'AR.04.26070', 'AR', 'AR.04', 'Departamento de Paso de Indios', 'Departamento de Paso de Indios', 1),
(981, 'AR.02.10077', 'AR', 'AR.02', 'Departamento de Paclín', 'Departamento de Paclin', 1),
(982, 'AR.17.66126', 'AR', 'AR.17', 'Departamento de Orán', 'Departamento de Oran', 1),
(983, 'AR.01.06595', 'AR', 'AR.01', 'Partido de Olavarría', 'Partido de Olavarria', 1),
(984, 'AR.22.86126', 'AR', 'AR.22', 'Departamento de Ojo de Agua', 'Departamento de Ojo de Agua', 1),
(985, 'AR.03.22112', 'AR', 'AR.03', 'Departamento de O’Higgins', 'Departamento de O\'Higgins', 1),
(986, 'AR.01.06588', 'AR', 'AR.01', 'Partido de Nueve de Julio', 'Partido de Nueve de Julio', 1),
(987, 'AR.03.22105', 'AR', 'AR.03', 'Departamento de Nueve de Julio', 'Departamento de Nueve de Julio', 1),
(988, 'AR.16.62049', 'AR', 'AR.16', 'Departamento de Nueve de Julio', 'Departamento de Nueve de Julio', 1),
(989, 'AR.18.70063', 'AR', 'AR.18', 'Departamento de Nueve de Julio', 'Departamento de Nueve de Julio', 1),
(990, 'AR.21.82077', 'AR', 'AR.21', 'Departamento de Nueve de Julio', 'Departamento de Nueve de Julio', 1),
(991, 'AR.16.62056', 'AR', 'AR.16', 'Departamento de Ñorquincó', 'Departamento de Norquinco', 1),
(992, 'AR.15.58084', 'AR', 'AR.15', 'Departamento de Ñorquín', 'Departamento de Norquin', 1),
(993, 'AR.22.86119', 'AR', 'AR.22', 'Departamento de Moreno', 'Departamento de Moreno', 1),
(994, 'AR.24.90070', 'AR', 'AR.24', 'Departamento de Monteros', 'Departamento de Monteros', 1),
(995, 'AR.17.66119', 'AR', 'AR.17', 'Departamento de Molinos', 'Departamento de Molinos', 1),
(996, 'AR.22.86112', 'AR', 'AR.22', 'Departamento de Mitre', 'Departamento de Mitre', 1),
(997, 'AR.15.58077', 'AR', 'AR.15', 'Departamento de Minas', 'Departamento de Minas', 1),
(998, 'AR.05.14070', 'AR', 'AR.05', 'Departamento de Minas', 'Departamento de Minas', 1),
(999, 'AR.17.66112', 'AR', 'AR.17', 'Departamento de Metán', 'Departamento de Metan', 1),
(1000, 'AR.03.22098', 'AR', 'AR.03', 'Departamento de Mayor Luis J. Fontana', 'Departamento de Mayor Luis J. Fontana', 1),
(1001, 'AR.22.86098', 'AR', 'AR.22', 'Departamento de Juan F. Ibarra', 'Departamento de Juan F. Ibarra', 1),
(1002, 'AR.09.34028', 'AR', 'AR.09', 'Departamento de Matacos', 'Departamento de Matacos', 1),
(1003, 'AR.04.26063', 'AR', 'AR.04', 'Departamento de Mártires', 'Departamento de Martires', 1),
(1004, 'AR.05.14063', 'AR', 'AR.05', 'Departamento de Marcos Juárez', 'Departamento de Marcos Juarez', 1),
(1005, 'AR.11.42105', 'AR', 'AR.11', 'Departamento de Maracó', 'Departamento de Maraco', 1),
(1006, 'AR.13.50077', 'AR', 'AR.13', 'Departamento de Malargüe', 'Departamento de Malarguee', 1),
(1007, 'AR.03.22091', 'AR', 'AR.03', 'Departamento de Maipú', 'Departamento de Maipu', 1),
(1008, 'AR.13.50070', 'AR', 'AR.13', 'Departamento de Maipú', 'Departamento de Maipu', 1),
(1009, 'AR.20.78042', 'AR', 'AR.20', 'Departamento de Magallanes', 'Departamento de Magallanes', 1),
(1010, 'AR.13.50063', 'AR', 'AR.13', 'Departamento de Luján', 'Departamento de Lujan', 1),
(1011, 'AR.15.58070', 'AR', 'AR.15', 'Departamento de Los Lagos', 'Departamento de Los Lagos', 1),
(1012, 'AR.17.66105', 'AR', 'AR.17', 'Departamento de Los Andes', 'Departamento de Los Andes', 1),
(1013, 'AR.22.86105', 'AR', 'AR.22', 'Departamento de Loreto', 'Departamento de Loreto', 1),
(1014, 'AR.15.58063', 'AR', 'AR.15', 'Departamento de Loncopué', 'Departamento de Loncopue', 1),
(1015, 'AR.01.06469', 'AR', 'AR.01', 'Partido de Lincoln', 'Partido de Lincoln', 1),
(1016, 'AR.11.42091', 'AR', 'AR.11', 'Departamento de Limay Mahuida', 'Departamento de Limay Mahuida', 1),
(1017, 'AR.11.42084', 'AR', 'AR.11', 'Departamento de Lihuel-Calel', 'Departamento de Lihuel-Calel', 1),
(1018, 'AR.11.42098', 'AR', 'AR.11', 'Departamento de Loventué', 'Departamento de Loventue', 1),
(1019, 'AR.10.38035', 'AR', 'AR.10', 'Departamento de Ledesma', 'Departamento de Ledesma', 1),
(1020, 'AR.01.06462', 'AR', 'AR.01', 'Partido de Leandro N. Alem', 'Partido de Leandro N. Alem', 1),
(1021, 'AR.24.90056', 'AR', 'AR.24', 'Departamento de Leales', 'Departamento de Leales', 1),
(1022, 'AR.17.66098', 'AR', 'AR.17', 'Departamento de La Viña', 'Departamento de La Vina', 1),
(1023, 'AR.13.50056', 'AR', 'AR.13', 'Departamento de Lavalle', 'Departamento de Lavalle', 1),
(1024, 'AR.13.50049', 'AR', 'AR.13', 'Departamento de Las Heras', 'Departamento de Las Heras', 1),
(1025, 'AR.21.82070', 'AR', 'AR.21', 'Las Colonias Department', 'Las Colonias Department', 1),
(1026, 'AR.01.06448', 'AR', 'AR.01', 'Partido de Laprida', 'Partido de Laprida', 1),
(1027, 'AR.17.66091', 'AR', 'AR.17', 'Departamento de La Poma', 'Departamento de La Poma', 1),
(1028, 'AR.13.50042', 'AR', 'AR.13', 'Departamento de La Paz', 'Departamento de La Paz', 1),
(1029, 'AR.02.10070', 'AR', 'AR.02', 'Departamento de La Paz', 'Departamento de La Paz', 1),
(1030, 'AR.04.26056', 'AR', 'AR.04', 'Departamento de Languiñeo', 'Departamento de Languineo', 1),
(1031, 'AR.20.78035', 'AR', 'AR.20', 'Departamento de Lago Buenos Aires', 'Departamento de Lago Buenos Aires', 1),
(1032, 'AR.20.78028', 'AR', 'AR.20', 'Departamento de Lago Argentino', 'Departamento de Lago Argentino', 1),
(1033, 'AR.15.58056', 'AR', 'AR.15', 'Departamento de Lácar', 'Departamento de Lacar', 1),
(1034, 'AR.21.82063', 'AR', 'AR.21', 'Departamento de La Capital', 'Departamento de La Capital', 1),
(1035, 'AR.01.06413', 'AR', 'AR.01', 'Partido de Junín', 'Partido de Junin', 1),
(1036, 'AR.13.50035', 'AR', 'AR.13', 'Departamento de Junín', 'Departamento de Junin', 1),
(1037, 'AR.19.74049', 'AR', 'AR.19', 'Departamento de Junín', 'Departamento de Junin', 1),
(1038, 'AR.05.14056', 'AR', 'AR.05', 'Departamento de Juárez Celman', 'Departamento de Juarez Celman', 1),
(1039, 'AR.22.86091', 'AR', 'AR.22', 'Departamento de Jiménez', 'Departamento de Jimenez', 1),
(1040, 'AR.18.70056', 'AR', 'AR.18', 'Departamento de Jáchal', 'Departamento de Jachal', 1),
(1041, 'AR.05.14049', 'AR', 'AR.05', 'Departamento de Ischilín', 'Departamento de Ischilin', 1),
(1042, 'AR.17.66070', 'AR', 'AR.17', 'Departamento de Iruya', 'Departamento de Iruya', 1),
(1043, 'AR.21.82056', 'AR', 'AR.21', 'Iriondo Department', 'Iriondo Department', 1),
(1044, 'AR.03.22070', 'AR', 'AR.03', 'Departamento de Independencia', 'Departamento de Independencia', 1),
(1045, 'AR.12.46105', 'AR', 'AR.12', 'Departamento de Independencia', 'Departamento de Independencia', 1),
(1046, 'AR.18.70049', 'AR', 'AR.18', 'Departamento de Iglesia', 'Departamento de Iglesia', 1),
(1047, 'AR.10.38028', 'AR', 'AR.10', 'Departamento de Humahuaca', 'Departamento de Humahuaca', 1),
(1048, 'AR.15.58049', 'AR', 'AR.15', 'Departamento de Huiliches', 'Departamento de Huiliches', 1),
(1049, 'AR.11.42077', 'AR', 'AR.11', 'Departamento de Hucal', 'Departamento de Hucal', 1),
(1050, 'AR.01.06406', 'AR', 'AR.01', 'Partido de Hipólito Yrigoyen', 'Partido de Hipolito Yrigoyen', 1),
(1051, 'AR.20.78021', 'AR', 'AR.20', 'Departamento de Güer Aike', 'Departamento de Gueer Aike', 1),
(1052, 'AR.13.50028', 'AR', 'AR.13', 'Departamento de Guaymallén', 'Departamento de Guaymallen', 1),
(1053, 'AR.11.42070', 'AR', 'AR.11', 'Departamento de Guatraché', 'Departamento de Guatrache', 1),
(1054, 'AR.22.86084', 'AR', 'AR.22', 'Departamento de Guasayán', 'Departamento de Guasayan', 1),
(1055, 'AR.01.06399', 'AR', 'AR.01', 'Partido de Guaminí', 'Partido de Guamini', 1),
(1056, 'AR.17.66063', 'AR', 'AR.17', 'Departamento de Guachipas', 'Departamento de Guachipas', 1),
(1057, 'AR.24.90035', 'AR', 'AR.24', 'Departamento de Graneros', 'Departamento de Graneros', 1),
(1058, 'AR.01.06014', 'AR', 'AR.01', 'Partido de Adolfo González Chaves', 'Partido de Adolfo Gonzalez Chaves', 1),
(1059, 'AR.13.50021', 'AR', 'AR.13', 'Departamento de Godoy Cruz', 'Departamento de Godoy Cruz', 1),
(1060, 'AR.19.74042', 'AR', 'AR.19', 'Departamento de Gobernador Vicente Dupuy', 'Departamento de Gobernador Vicente Dupuy', 1),
(1061, 'AR.12.46035', 'AR', 'AR.12', 'Departamento de Chamical', 'Departamento de Chamical', 1),
(1062, 'AR.01.06392', 'AR', 'AR.01', 'Partido de General Villegas', 'Partido de General Villegas', 1),
(1063, 'AR.01.06385', 'AR', 'AR.01', 'Partido de General Viamonte', 'Partido de General Viamonte', 1),
(1064, 'AR.22.86077', 'AR', 'AR.22', 'Departamento de General Taboada', 'Departamento de General Taboada', 1),
(1065, 'AR.12.46098', 'AR', 'AR.12', 'Departamento de Vinchina', 'Departamento de Vinchina', 1),
(1066, 'AR.05.14042', 'AR', 'AR.05', 'Departamento de General San Martín', 'Departamento de General San Martin', 1),
(1067, 'AR.12.46091', 'AR', 'AR.12', 'Departamento de General San Martín', 'Departamento de General San Martin', 1),
(1068, 'AR.16.62042', 'AR', 'AR.16', 'Departamento de General Roca', 'Departamento de General Roca', 1),
(1069, 'AR.05.14035', 'AR', 'AR.05', 'Departamento de General Roca', 'Departamento de General Roca', 1),
(1070, 'AR.12.46112', 'AR', 'AR.12', 'Departamento de Rosario Vera Peñaloza', 'Departamento de Rosario Vera Penaloza', 1),
(1071, 'AR.01.06351', 'AR', 'AR.01', 'Partido de General Pinto', 'Partido de General Pinto', 1),
(1072, 'AR.19.74035', 'AR', 'AR.19', 'Departamento de General Pedernera', 'Departamento de General Pedernera', 1),
(1073, 'AR.12.46084', 'AR', 'AR.12', 'Departamento de General Ocampo', 'Departamento de General Ocampo', 1),
(1074, 'AR.17.66049', 'AR', 'AR.17', 'Departamento de General Güemes', 'Departamento de General Gueemes', 1),
(1075, 'AR.21.82042', 'AR', 'AR.21', 'General López Department', 'General Lopez Department', 1),
(1076, 'AR.12.46028', 'AR', 'AR.12', 'Departamento de Coronel Felipe Varela', 'Departamento de Coronel Felipe Varela', 1),
(1077, 'AR.01.06322', 'AR', 'AR.01', 'Partido de General La Madrid', 'Partido de General La Madrid', 1),
(1078, 'AR.12.46077', 'AR', 'AR.12', 'Departamento de General Lamadrid', 'Departamento de General Lamadrid', 1),
(1079, 'AR.17.66056', 'AR', 'AR.17', 'Departamento de General José de San Martín', 'Departamento de General Jose de San Martin', 1),
(1080, 'AR.03.22063', 'AR', 'AR.03', 'Departamento de General Güemes', 'Departamento de General Gueemes', 1),
(1081, 'AR.03.22049', 'AR', 'AR.03', 'Departamento de General Belgrano', 'Departamento de General Belgrano', 1),
(1082, 'AR.12.46063', 'AR', 'AR.12', 'Departamento de General Belgrano', 'Departamento de General Belgrano', 1),
(1083, 'AR.01.06294', 'AR', 'AR.01', 'Partido de General Arenales', 'Partido de General Arenales', 1),
(1084, 'AR.01.06287', 'AR', 'AR.01', 'Partido de General Alvear', 'Partido de General Alvear', 1),
(1085, 'AR.13.50014', 'AR', 'AR.13', 'Departamento de General Alvear', 'Departamento de General Alvear', 1),
(1086, 'AR.04.26049', 'AR', 'AR.04', 'Departamento de Gastre', 'Departamento de Gastre', 1),
(1087, 'AR.21.82035', 'AR', 'AR.21', 'Garay Department', 'Garay Department', 1),
(1088, 'AR.04.26042', 'AR', 'AR.04', 'Departamento de Gaimán', 'Departamento de Gaiman', 1),
(1089, 'AR.04.26035', 'AR', 'AR.04', 'Departamento de Futaleufú', 'Departamento de Futaleufu', 1),
(1090, 'AR.02.10063', 'AR', 'AR.02', 'Departamento de Fray Mamerto Esquiú', 'Departamento de Fray Mamerto Esquiu', 1),
(1091, 'AR.03.22043', 'AR', 'AR.03', 'Fray Justo Santa María de Oro', 'Fray Justo Santa Maria de Oro', 1),
(1092, 'AR.04.26028', 'AR', 'AR.04', 'Departamento de Florentino Ameghino', 'Departamento de Florentino Ameghino', 1),
(1093, 'AR.22.86070', 'AR', 'AR.22', 'Departamento de Figueroa', 'Departamento de Figueroa', 1),
(1094, 'AR.12.46049', 'AR', 'AR.12', 'Departamento de Famatina', 'Departamento de Famatina', 1),
(1095, 'AR.24.90028', 'AR', 'AR.24', 'Departamento de Famaillá', 'Departamento de Famailla', 1),
(1096, 'AR.04.26021', 'AR', 'AR.04', 'Departamento de Escalante', 'Departamento de Escalante', 1),
(1097, 'AR.16.62035', 'AR', 'AR.16', 'Departamento de El Cuy', 'Departamento de El Cuy', 1),
(1098, 'AR.10.38014', 'AR', 'AR.10', 'Departamento de El Carmen', 'Departamento de El Carmen', 1),
(1099, 'AR.02.10056', 'AR', 'AR.02', 'Departamento de El Alto', 'Departamento de El Alto', 1),
(1100, 'AR.03.22036', 'AR', 'AR.03', 'Departamento de Doce de Octubre', 'Departamento de Doce de Octubre', 1),
(1101, 'AR.08.30021', 'AR', 'AR.08', 'Departamento de Diamante', 'Departamento de Diamante', 1),
(1102, 'AR.20.78014', 'AR', 'AR.20', 'Departamento de Deseado', 'Departamento de Deseado', 1),
(1103, 'AR.04.26014', 'AR', 'AR.04', 'Departamento de Cushamen', 'Departamento de Cushamen', 1),
(1104, 'AR.11.42042', 'AR', 'AR.11', 'Departamento de Curacó', 'Departamento de Curaco', 1),
(1105, 'AR.05.14028', 'AR', 'AR.05', 'Departamento de Cruz del Eje', 'Departamento de Cruz del Eje', 1),
(1106, 'AR.24.90014', 'AR', 'AR.24', 'Departamento de Cruz Alta', 'Departamento de Cruz Alta', 1),
(1107, 'AR.20.78007', 'AR', 'AR.20', 'Departamento de Corpen Aike', 'Departamento de Corpen Aike', 1),
(1108, 'AR.01.06203', 'AR', 'AR.01', 'Partido de Coronel Suárez', 'Partido de Coronel Suarez', 1),
(1109, 'AR.01.06196', 'AR', 'AR.01', 'Partido de Coronel Pringles', 'Partido de Coronel Pringles', 1),
(1110, 'AR.01.06189', 'AR', 'AR.01', 'Partido de Coronel Dorrego', 'Partido de Coronel Dorrego', 1),
(1111, 'AR.01.06182', 'AR', 'AR.01', 'Partido de Coronel Rosales', 'Partido de Coronel Rosales', 1),
(1112, 'AR.22.86056', 'AR', 'AR.22', 'Departamento de Copo', 'Departamento de Copo', 1),
(1113, 'AR.21.82028', 'AR', 'AR.21', 'Departamento de Constitución', 'Departamento de Constitucion', 1),
(1114, 'AR.11.42035', 'AR', 'AR.11', 'Departamento de Conhelo', 'Departamento de Conhelo', 1),
(1115, 'AR.15.58035', 'AR', 'AR.15', 'Departamento de Confluencia', 'Departamento de Confluencia', 1),
(1116, 'AR.16.62028', 'AR', 'AR.16', 'Departamento de Conesa', 'Departamento de Conesa', 1),
(1117, 'AR.03.22021', 'AR', 'AR.03', 'Departamento de Comandante Fernández', 'Departamento de Comandante Fernandez', 1),
(1118, 'AR.01.06175', 'AR', 'AR.01', 'Partido de Colón', 'Partido de Colon', 1),
(1119, 'AR.05.14021', 'AR', 'AR.05', 'Departamento de Colón', 'Departamento de Colon', 1),
(1120, 'AR.15.58028', 'AR', 'AR.15', 'Departamento de Collón-Curá', 'Departamento de Collon-Cura', 1),
(1121, 'AR.10.38007', 'AR', 'AR.10', 'Departamento de Cochinoca', 'Departamento de Cochinoca', 1),
(1122, 'AR.22.86063', 'AR', 'AR.22', 'Departamento de Choya', 'Departamento de Choya', 1),
(1123, 'AR.15.58042', 'AR', 'AR.15', 'Departamento de Chos-Malal', 'Departamento de Chos-Malal', 1),
(1124, 'AR.18.70042', 'AR', 'AR.18', 'Departamento de Chimbas', 'Departamento de Chimbas', 1),
(1125, 'AR.12.46042', 'AR', 'AR.12', 'Departamento de Chilecito', 'Departamento de Chilecito', 1),
(1126, 'AR.17.66042', 'AR', 'AR.17', 'Departamento de Chicoana', 'Departamento de Chicoana', 1),
(1127, 'AR.24.90021', 'AR', 'AR.24', 'Departamento de Chicligasta', 'Departamento de Chicligasta', 1),
(1128, 'AR.11.42063', 'AR', 'AR.11', 'Departamento de Chical-Có', 'Departamento de Chical-Co', 1),
(1129, 'AR.11.42056', 'AR', 'AR.11', 'Departamento de Chapaleufú', 'Departamento de Chapaleufu', 1),
(1130, 'AR.11.42049', 'AR', 'AR.11', 'Departamento de Chalileo', 'Departamento de Chalileo', 1),
(1131, 'AR.01.06210', 'AR', 'AR.01', 'Partido de Chacabuco', 'Partido de Chacabuco', 1),
(1132, 'AR.03.22028', 'AR', 'AR.03', 'Chacabuco', 'Chacabuco', 1),
(1133, 'AR.19.74028', 'AR', 'AR.19', 'Departamento de Chacabuco', 'Departamento de Chacabuco', 1),
(1134, 'AR.17.66035', 'AR', 'AR.17', 'Departamento de Cerrillos', 'Departamento de Cerrillos', 1),
(1135, 'AR.18.70035', 'AR', 'AR.18', 'Departamento de Caucete', 'Departamento de Caucete', 1),
(1136, 'AR.11.42028', 'AR', 'AR.11', 'Departamento de Catriló', 'Departamento de Catrilo', 1),
(1137, 'AR.15.58021', 'AR', 'AR.15', 'Departamento de Catán-Lil', 'Departamento de Catan-Lil', 1),
(1138, 'AR.12.46021', 'AR', 'AR.12', 'Departamento de Castro Barros', 'Departamento de Castro Barros', 1),
(1139, 'AR.21.82021', 'AR', 'AR.21', 'Departamento de Castellanos', 'Departamento de Castellanos', 1),
(1140, 'AR.01.06231', 'AR', 'AR.01', 'Partido de Daireaux', 'Partido de Daireaux', 1),
(1141, 'AR.21.82014', 'AR', 'AR.21', 'Departamento de Caseros', 'Departamento de Caseros', 1),
(1142, 'AR.01.06154', 'AR', 'AR.01', 'Partido de Carlos Tejedor', 'Partido de Carlos Tejedor', 1),
(1143, 'AR.01.06147', 'AR', 'AR.01', 'Partido de Carlos Casares', 'Partido de Carlos Casares', 1),
(1144, 'AR.11.42021', 'AR', 'AR.11', 'Departamento de Capital', 'Departamento de Capital', 1),
(1145, 'AR.13.50007', 'AR', 'AR.13', 'Departamento de Capital', 'Departamento de Capital', 1),
(1146, 'AR.18.70028', 'AR', 'AR.18', 'Departamento de Capital', 'Departamento de Capital', 1),
(1147, 'AR.05.14014', 'AR', 'AR.05', 'Departamento de Capital', 'Departamento de Capital', 1),
(1148, 'AR.12.46014', 'AR', 'AR.12', 'Departamento de Capital', 'Departamento de Capital', 1),
(1149, 'AR.02.10049', 'AR', 'AR.02', 'Departamento de Capital', 'Departamento de Capital', 1),
(1150, 'AR.22.86049', 'AR', 'AR.22', 'Departamento de Capital', 'Departamento de Capital', 1),
(1151, 'AR.24.90084', 'AR', 'AR.24', 'Departamento de Capital', 'Departamento de Capital', 1),
(1152, 'AR.17.66028', 'AR', 'AR.17', 'Departamento Capital', 'Departamento Capital', 1),
(1153, 'AR.10.38021', 'AR', 'AR.10', 'Departamento de Doctor Manuel Belgrano', 'Departamento de Doctor Manuel Belgrano', 1),
(1154, 'AR.02.10042', 'AR', 'AR.02', 'Departamento de Capayán', 'Departamento de Capayan', 1),
(1155, 'AR.18.70021', 'AR', 'AR.18', 'Departamento de Calingasta', 'Departamento de Calingasta', 1),
(1156, 'AR.11.42014', 'AR', 'AR.11', 'Departamento de Caleu-Caleu', 'Departamento de Caleu-Caleu', 1),
(1157, 'AR.17.66077', 'AR', 'AR.17', 'La Caldera', 'La Caldera', 1),
(1158, 'AR.05.14007', 'AR', 'AR.05', 'Departamento de Calamuchita', 'Departamento de Calamuchita', 1),
(1159, 'AR.17.66021', 'AR', 'AR.17', 'Cafayate', 'Cafayate', 1),
(1160, 'AR.17.66014', 'AR', 'AR.17', 'Departamento de Cachí', 'Departamento de Cachi', 1),
(1161, 'AR.24.90007', 'AR', 'AR.24', 'Departamento de Burruyacú', 'Departamento de Burruyacu', 1),
(1162, 'AR.01.06112', 'AR', 'AR.01', 'Partido de Bragado', 'Partido de Bragado', 1),
(1163, 'AR.01.06105', 'AR', 'AR.01', 'Partido de Bolívar', 'Partido de Bolivar', 1),
(1164, 'AR.04.26007', 'AR', 'AR.04', 'Departamento de Biedma', 'Departamento de Biedma', 1),
(1165, 'AR.09.34007', 'AR', 'AR.09', 'Departamento de Bermejo', 'Departamento de Bermejo', 1),
(1166, 'AR.19.74014', 'AR', 'AR.19', 'Departamento de Belgrano', 'Departamento de Belgrano', 1),
(1167, 'AR.21.82007', 'AR', 'AR.21', 'Departamento de Belgrano', 'Departamento de Belgrano', 1),
(1168, 'AR.22.86042', 'AR', 'AR.22', 'Departamento de Belgrano', 'Departamento de Belgrano', 1),
(1169, 'AR.02.10035', 'AR', 'AR.02', 'Departamento de Belén', 'Departamento de Belen', 1),
(1170, 'AR.16.62021', 'AR', 'AR.16', 'Departamento de Bariloche', 'Departamento de Bariloche', 1),
(1171, 'AR.22.86035', 'AR', 'AR.22', 'Departamento de Banda', 'Departamento de Banda', 1),
(1172, 'AR.01.06553', 'AR', 'AR.01', 'Partido de Monte Hermoso', 'Partido de Monte Hermoso', 1),
(1173, 'AR.01.06056', 'AR', 'AR.01', 'Partido de Bahía Blanca', 'Partido de Bahia Blanca', 1),
(1174, 'AR.19.74007', 'AR', 'AR.19', 'Departamento de Ayacucho', 'Departamento de Ayacucho', 1),
(1175, 'AR.16.62014', 'AR', 'AR.16', 'Departamento de Avellaneda', 'Departamento de Avellaneda', 1),
(1176, 'AR.22.86028', 'AR', 'AR.22', 'Departamento de Avellaneda', 'Departamento de Avellaneda', 1),
(1177, 'AR.11.42007', 'AR', 'AR.11', 'Departamento de Atreucó', 'Departamento de Atreuco', 1),
(1178, 'AR.22.86021', 'AR', 'AR.22', 'Departamento de Atamisqui', 'Departamento de Atamisqui', 1),
(1179, 'AR.12.46007', 'AR', 'AR.12', 'Departamento de Arauco', 'Departamento de Arauco', 1),
(1180, 'AR.02.10028', 'AR', 'AR.02', 'Departamento de Antofagasta de la Sierra', 'Departamento de Antofagasta de la Sierra', 1),
(1181, 'AR.17.66007', 'AR', 'AR.17', 'Departamento de Anta', 'Departamento de Anta', 1),
(1182, 'AR.18.70014', 'AR', 'AR.18', 'Departamento de Angaco', 'Departamento de Angaco', 1),
(1183, 'AR.15.58014', 'AR', 'AR.15', 'Departamento de Añelo', 'Departamento de Anelo', 1),
(1184, 'AR.02.10021', 'AR', 'AR.02', 'Departamento de Andalgalá', 'Departamento de Andalgala', 1),
(1185, 'AR.02.10014', 'AR', 'AR.02', 'Departamento de Ancasti', 'Departamento de Ancasti', 1),
(1186, 'AR.02.10007', 'AR', 'AR.02', 'Departamento de Ambato', 'Departamento de Ambato', 1),
(1187, 'AR.15.58007', 'AR', 'AR.15', 'Departamento de Aluminé', 'Departamento de Alumine', 1),
(1188, 'AR.03.22007', 'AR', 'AR.03', 'Departamento de Almirante Brown', 'Departamento de Almirante Brown', 1),
(1189, 'AR.01.06021', 'AR', 'AR.01', 'Partido de Alberti', 'Partido de Alberti', 1),
(1190, 'AR.22.86014', 'AR', 'AR.22', 'Departamento de Alberdi', 'Departamento de Alberdi', 1),
(1191, 'AR.18.70007', 'AR', 'AR.18', 'Departamento de Albardón', 'Departamento de Albardon', 1),
(1192, 'AR.22.86007', 'AR', 'AR.22', 'Departamento de Aguirre', 'Departamento de Aguirre', 1),
(1193, 'AR.01.06007', 'AR', 'AR.01', 'Partido de Adolfo Alsina', 'Partido de Adolfo Alsina', 1),
(1194, 'AR.16.62007', 'AR', 'AR.16', 'Departamento de Adolfo Alsina', 'Departamento de Adolfo Alsina', 1),
(1195, 'AR.01.06760', 'AR', 'AR.01', 'Partido de San Miguel', 'Partido de San Miguel', 1),
(1196, 'AR.01.06420', 'AR', 'AR.01', 'Partido de La Costa', 'Partido de La Costa', 1),
(1197, 'AR.01.06270', 'AR', 'AR.01', 'Partido de Ezeiza', 'Partido de Ezeiza', 1),
(1198, 'AR.01.06277', 'AR', 'AR.01', 'Partido de Florentino Ameghino', 'Partido de Florentino Ameghino', 1),
(1199, 'AR.01.06408', 'AR', 'AR.01', 'Partido de Hurlingham', 'Partido de Hurlingham', 1),
(1200, 'AR.01.06410', 'AR', 'AR.01', 'Partido de Ituzaingó', 'Partido de Ituzaingo', 1),
(1201, 'AR.01.06847', 'AR', 'AR.01', 'Partido de Tres Lomas', 'Partido de Tres Lomas', 1),
(1202, 'AR.01.06868', 'AR', 'AR.01', 'Partido de Villa Gesell', 'Partido de Villa Gesell', 1),
(1203, 'AR.24.90098', 'AR', 'AR.24', 'Departamento de Tafí del Valle', 'Departamento de Tafi del Valle', 1),
(1204, 'AR.24.90049', 'AR', 'AR.24', 'Departamento de La Cocha', 'Departamento de La Cocha', 1),
(1205, 'AR.24.90091', 'AR', 'AR.24', 'Departamento de Simoca', 'Departamento de Simoca', 1),
(1206, 'AR.24.90105', 'AR', 'AR.24', 'Departamento de Tafí Viejo', 'Departamento de Tafi Viejo', 1),
(1207, 'AR.24.90119', 'AR', 'AR.24', 'Departamento de Yerba Buena', 'Departamento de Yerba Buena', 1),
(1208, 'AR.24.90063', 'AR', 'AR.24', 'Departamento de Lules', 'Departamento de Lules', 1),
(1209, 'AR.03.22039', 'AR', 'AR.03', 'Departamento de Dos de Abril', 'Departamento de Dos de Abril', 1),
(1210, 'AR.08.30035', 'AR', 'AR.08', 'Departamento de Federal', 'Departamento de Federal', 1),
(1211, 'AR.08.30063', 'AR', 'AR.08', 'Departamento de Islas del Ibicuy', 'Departamento de Islas del Ibicuy', 1),
(1212, 'AR.08.30088', 'AR', 'AR.08', 'Departamento de San Salvador', 'Departamento de San Salvador', 1),
(1213, 'AR.10.38042', 'AR', 'AR.10', 'Departamento de Palpalá', 'Departamento de Palpala', 1),
(1214, 'AR.24.90042', 'AR', 'AR.24', 'Departamento de Juan B. Alberdi', 'Departamento de Juan B. Alberdi', 1),
(1215, 'AR.01.06515', 'AR', 'AR.01', 'Partido de Malvinas Argentinas', 'Partido de Malvinas Argentinas', 1),
(1216, 'AR.01.06466', 'AR', 'AR.01', 'Partido de Lezama', 'Partido de Lezama', 1),
(1217, 'AR.17.66084', 'AR', 'AR.17', 'La Candelaria', 'La Candelaria', 1),
(1218, 'AR.19.74056', 'AR', 'AR.19', 'Juan Martín de Pueyrredón', 'Juan Martin de Pueyrredon', 1),
(1219, 'AR.07.02012', 'AR', 'AR.07', 'Comuna 12', 'Comuna 12', 1),
(1220, 'AR.07.02003', 'AR', 'AR.07', 'Comuna 3', 'Comuna 3', 1),
(1221, 'AR.07.02008', 'AR', 'AR.07', 'Comuna 8', 'Comuna 8', 1),
(1222, 'AR.07.02004', 'AR', 'AR.07', 'Comuna 4', 'Comuna 4', 1),
(1223, 'AR.07.02005', 'AR', 'AR.07', 'Comuna 5', 'Comuna 5', 1),
(1224, 'AR.23.94028', 'AR', 'AR.23', 'Antártida Argentina', 'Antartida Argentina', 1),
(1225, 'AR.23.94021', 'AR', 'AR.23', 'Islas del Atlántico Sur', 'Islas del Atlantico Sur', 1),
(1226, 'AR.07.02013', 'AR', 'AR.07', 'Comuna 13', 'Comuna 13', 1),
(1227, 'AR.07.02014', 'AR', 'AR.07', 'Comuna 14', 'Comuna 14', 1),
(1228, 'AR.07.02001', 'AR', 'AR.07', 'Comuna 1', 'Comuna 1', 1),
(1229, 'AR.07.02006', 'AR', 'AR.07', 'Comuna 6', 'Comuna 6', 1),
(1230, 'AR.07.02002', 'AR', 'AR.07', 'Comuna 2', 'Comuna 2', 1),
(1231, 'AR.07.02009', 'AR', 'AR.07', 'Comuna 9', 'Comuna 9', 1),
(1232, 'AR.07.02007', 'AR', 'AR.07', 'Comuna 7', 'Comuna 7', 1),
(1233, 'AR.07.02010', 'AR', 'AR.07', 'Comuna 10', 'Comuna 10', 1),
(1234, 'AR.07.02011', 'AR', 'AR.07', 'Comuna 11', 'Comuna 11', 1);
INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`) VALUES
(1235, 'AR.07.02015', 'AR', 'AR.07', 'Comuna 15', 'Comuna 15', 1),
(9367, 'CL.01.51', 'CL', 'CL.01', 'Provincia de Valparaíso', 'Provincia de Valparaiso', 1),
(9368, 'CL.17.141', 'CL', 'CL.17', 'Provincia de Valdivia', 'Provincia de Valdivia', 1),
(9369, 'CL.10.124', 'CL', 'CL.10', 'Provincia de Última Esperanza', 'Provincia de Ultima Esperanza', 1),
(9370, 'CL.03.23', 'CL', 'CL.03', 'Provincia de Tocopilla', 'Provincia de Tocopilla', 1),
(9371, 'CL.10.123', 'CL', 'CL.10', 'Provincia de Tierra del Fuego', 'Provincia de Tierra del Fuego', 1),
(9372, 'CL.11.71', 'CL', 'CL.11', 'Provincia de Talca', 'Provincia de Talca', 1),
(9373, 'CL.12.136', 'CL', 'CL.12', 'Provincia de Talagante', 'Provincia de Talagante', 1),
(9374, 'CL.12.131', 'CL', 'CL.12', 'Provincia de Santiago', 'Provincia de Santiago', 1),
(9375, 'CL.01.57', 'CL', 'CL.01', 'Provincia de San Felipe', 'Provincia de San Felipe', 1),
(9376, 'CL.01.56', 'CL', 'CL.01', 'San Antonio Province', 'San Antonio Province', 1),
(9377, 'CL.01.55', 'CL', 'CL.01', 'Provincia de Quillota', 'Provincia de Quillota', 1),
(9378, 'CL.01.54', 'CL', 'CL.01', 'Petorca Province', 'Petorca Province', 1),
(9379, 'CL.14.103', 'CL', 'CL.14', 'Provincia de Osorno', 'Provincia de Osorno', 1),
(9380, 'CL.06.84', 'CL', 'CL.06', 'Provincia de Ñuble', 'Provincia de Nuble', 1),
(9381, 'CL.12.135', 'CL', 'CL.12', 'Provincia de Melipilla', 'Provincia de Melipilla', 1),
(9382, 'CL.04.92', 'CL', 'CL.04', 'Provincia de Malleco', 'Provincia de Malleco', 1),
(9383, 'CL.12.134', 'CL', 'CL.12', 'Provincia de Maipo', 'Provincia de Maipo', 1),
(9384, 'CL.10.121', 'CL', 'CL.10', 'Provincia de Magallanes', 'Provincia de Magallanes', 1),
(9385, 'CL.01.53', 'CL', 'CL.01', 'Provincia de Los Andes', 'Provincia de Los Andes', 1),
(9386, 'CL.14.101', 'CL', 'CL.14', 'Provincia de Llanquihue', 'Provincia de Llanquihue', 1),
(9387, 'CL.11.74', 'CL', 'CL.11', 'Provincia de Linares', 'Provincia de Linares', 1),
(9388, 'CL.07.43', 'CL', 'CL.07', 'Provincia de Limarí', 'Provincia de Limari', 1),
(9389, 'CL.15.11', 'CL', 'CL.15', 'Provincia de Iquique', 'Provincia de Iquique', 1),
(9390, 'CL.05.33', 'CL', 'CL.05', 'Provincia de Huasco', 'Provincia de Huasco', 1),
(9391, 'CL.02.114', 'CL', 'CL.02', 'Provincia General Carrera', 'Provincia General Carrera', 1),
(9392, 'CL.07.41', 'CL', 'CL.07', 'Provincia de Elqui', 'Provincia de Elqui', 1),
(9393, 'CL.03.22', 'CL', 'CL.03', 'Provincia de El Loa', 'Provincia de El Loa', 1),
(9394, 'CL.11.73', 'CL', 'CL.11', 'Provincia de Curicó', 'Provincia de Curico', 1),
(9395, 'CL.05.31', 'CL', 'CL.05', 'Provincia de Copiapó', 'Provincia de Copiapo', 1),
(9396, 'CL.06.81', 'CL', 'CL.06', 'Provincia de Concepción', 'Provincia de Concepcion', 1),
(9397, 'CL.08.63', 'CL', 'CL.08', 'Provincia de Colchagua', 'Provincia de Colchagua', 1),
(9398, 'CL.07.42', 'CL', 'CL.07', 'Provincia de Choapa', 'Provincia de Choapa', 1),
(9399, 'CL.14.102', 'CL', 'CL.14', 'Provincia de Chiloé', 'Provincia de Chiloe', 1),
(9400, 'CL.05.32', 'CL', 'CL.05', 'Provincia de Chañaral', 'Provincia de Chanaral', 1),
(9401, 'CL.04.91', 'CL', 'CL.04', 'Provincia de Cautín', 'Provincia de Cautin', 1),
(9402, 'CL.02.113', 'CL', 'CL.02', 'Provincia Capitán Prat', 'Provincia Capitan Prat', 1),
(9403, 'CL.08.61', 'CL', 'CL.08', 'Provincia de Cachapoal', 'Provincia de Cachapoal', 1),
(9404, 'CL.06.83', 'CL', 'CL.06', 'Provincia de Biobío', 'Provincia de Biobio', 1),
(9405, 'CL.16.151', 'CL', 'CL.16', 'Provincia de Arica', 'Provincia de Arica', 1),
(9406, 'CL.06.82', 'CL', 'CL.06', 'Provincia de Arauco', 'Provincia de Arauco', 1),
(9407, 'CL.03.21', 'CL', 'CL.03', 'Provincia de Antofagasta', 'Provincia de Antofagasta', 1),
(9408, 'CL.02.112', 'CL', 'CL.02', 'Provincia de Aisén', 'Provincia de Aisen', 1),
(9409, 'CL.01.52', 'CL', 'CL.01', 'Provincia de Isla de Pascua', 'Provincia de Isla de Pascua', 1),
(9410, 'CL.10.122', 'CL', 'CL.10', 'Provincia Antártica Chilena', 'Provincia Antartica Chilena', 1),
(9411, 'CL.17.142', 'CL', 'CL.17', 'Provincia del Ranco', 'Provincia del Ranco', 1),
(9412, 'CL.16.152', 'CL', 'CL.16', 'Provincia de Parinacota', 'Provincia de Parinacota', 1),
(9413, 'CL.15.14', 'CL', 'CL.15', 'Provincia del Tamarugal', 'Provincia del Tamarugal', 1),
(9414, 'CL.01.58', 'CL', 'CL.01', 'Provincia de Marga Marga', 'Provincia de Marga Marga', 1),
(9415, 'CL.08.62', 'CL', 'CL.08', 'Provincia de Cardenal Caro', 'Provincia de Cardenal Caro', 1),
(9416, 'CL.11.72', 'CL', 'CL.11', 'Provincia de Cauquenes', 'Provincia de Cauquenes', 1),
(9417, 'CL.14.104', 'CL', 'CL.14', 'Provincia de Palena', 'Provincia de Palena', 1),
(9418, 'CL.02.111', 'CL', 'CL.02', 'Provincia de Coyhaique', 'Provincia de Coyhaique', 1),
(9419, 'CL.12.132', 'CL', 'CL.12', 'Provincia de Cordillera', 'Provincia de Cordillera', 1),
(9420, 'CL.12.133', 'CL', 'CL.12', 'Provincia de Chacabuco', 'Provincia de Chacabuco', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_zone_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `gmt` double DEFAULT NULL,
  `dst` double DEFAULT NULL,
  `raw` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `time_zones`
--

INSERT INTO `time_zones` (`id`, `country_code`, `time_zone_id`, `gmt`, `dst`, `raw`) VALUES
(1, 'CI', 'Africa/Abidjan', 0, 0, 0),
(2, 'GH', 'Africa/Accra', 0, 0, 0),
(3, 'ET', 'Africa/Addis_Ababa', 3, 3, 3),
(4, 'DZ', 'Africa/Algiers', 1, 1, 1),
(5, 'ER', 'Africa/Asmara', 3, 3, 3),
(6, 'ML', 'Africa/Bamako', 0, 0, 0),
(7, 'CF', 'Africa/Bangui', 1, 1, 1),
(8, 'GM', 'Africa/Banjul', 0, 0, 0),
(9, 'GW', 'Africa/Bissau', 0, 0, 0),
(10, 'MW', 'Africa/Blantyre', 2, 2, 2),
(11, 'CG', 'Africa/Brazzaville', 1, 1, 1),
(12, 'BI', 'Africa/Bujumbura', 2, 2, 2),
(13, 'EG', 'Africa/Cairo', 2, 2, 2),
(14, 'MA', 'Africa/Casablanca', 0, 1, 0),
(15, 'ES', 'Africa/Ceuta', 1, 2, 1),
(16, 'GN', 'Africa/Conakry', 0, 0, 0),
(17, 'SN', 'Africa/Dakar', 0, 0, 0),
(18, 'TZ', 'Africa/Dar_es_Salaam', 3, 3, 3),
(19, 'DJ', 'Africa/Djibouti', 3, 3, 3),
(20, 'CM', 'Africa/Douala', 1, 1, 1),
(21, 'EH', 'Africa/El_Aaiun', 0, 1, 0),
(22, 'SL', 'Africa/Freetown', 0, 0, 0),
(23, 'BW', 'Africa/Gaborone', 2, 2, 2),
(24, 'ZW', 'Africa/Harare', 2, 2, 2),
(25, 'ZA', 'Africa/Johannesburg', 2, 2, 2),
(26, 'SS', 'Africa/Juba', 3, 3, 3),
(27, 'UG', 'Africa/Kampala', 3, 3, 3),
(28, 'SD', 'Africa/Khartoum', 3, 3, 3),
(29, 'RW', 'Africa/Kigali', 2, 2, 2),
(30, 'CD', 'Africa/Kinshasa', 1, 1, 1),
(31, 'NG', 'Africa/Lagos', 1, 1, 1),
(32, 'GA', 'Africa/Libreville', 1, 1, 1),
(33, 'TG', 'Africa/Lome', 0, 0, 0),
(34, 'AO', 'Africa/Luanda', 1, 1, 1),
(35, 'CD', 'Africa/Lubumbashi', 2, 2, 2),
(36, 'ZM', 'Africa/Lusaka', 2, 2, 2),
(37, 'GQ', 'Africa/Malabo', 1, 1, 1),
(38, 'MZ', 'Africa/Maputo', 2, 2, 2),
(39, 'LS', 'Africa/Maseru', 2, 2, 2),
(40, 'SZ', 'Africa/Mbabane', 2, 2, 2),
(41, 'SO', 'Africa/Mogadishu', 3, 3, 3),
(42, 'LR', 'Africa/Monrovia', 0, 0, 0),
(43, 'KE', 'Africa/Nairobi', 3, 3, 3),
(44, 'TD', 'Africa/Ndjamena', 1, 1, 1),
(45, 'NE', 'Africa/Niamey', 1, 1, 1),
(46, 'MR', 'Africa/Nouakchott', 0, 0, 0),
(47, 'BF', 'Africa/Ouagadougou', 0, 0, 0),
(48, 'BJ', 'Africa/Porto-Novo', 1, 1, 1),
(49, 'ST', 'Africa/Sao_Tome', 0, 0, 0),
(50, 'LY', 'Africa/Tripoli', 2, 2, 2),
(51, 'TN', 'Africa/Tunis', 1, 1, 1),
(52, 'NA', 'Africa/Windhoek', 2, 1, 1),
(53, 'US', 'America/Adak', -10, -9, -10),
(54, 'US', 'America/Anchorage', -9, -8, -9),
(55, 'AI', 'America/Anguilla', -4, -4, -4),
(56, 'AG', 'America/Antigua', -4, -4, -4),
(57, 'BR', 'America/Araguaina', -3, -3, -3),
(58, 'AR', 'America/Argentina/Buenos_Aires', -3, -3, -3),
(59, 'AR', 'America/Argentina/Catamarca', -3, -3, -3),
(60, 'AR', 'America/Argentina/Cordoba', -3, -3, -3),
(61, 'AR', 'America/Argentina/Jujuy', -3, -3, -3),
(62, 'AR', 'America/Argentina/La_Rioja', -3, -3, -3),
(63, 'AR', 'America/Argentina/Mendoza', -3, -3, -3),
(64, 'AR', 'America/Argentina/Rio_Gallegos', -3, -3, -3),
(65, 'AR', 'America/Argentina/Salta', -3, -3, -3),
(66, 'AR', 'America/Argentina/San_Juan', -3, -3, -3),
(67, 'AR', 'America/Argentina/San_Luis', -3, -3, -3),
(68, 'AR', 'America/Argentina/Tucuman', -3, -3, -3),
(69, 'AR', 'America/Argentina/Ushuaia', -3, -3, -3),
(70, 'AW', 'America/Aruba', -4, -4, -4),
(71, 'PY', 'America/Asuncion', -3, -4, -4),
(72, 'CA', 'America/Atikokan', -5, -5, -5),
(73, 'BR', 'America/Bahia', -3, -3, -3),
(74, 'MX', 'America/Bahia_Banderas', -6, -5, -6),
(75, 'BB', 'America/Barbados', -4, -4, -4),
(76, 'BR', 'America/Belem', -3, -3, -3),
(77, 'BZ', 'America/Belize', -6, -6, -6),
(78, 'CA', 'America/Blanc-Sablon', -4, -4, -4),
(79, 'BR', 'America/Boa_Vista', -4, -4, -4),
(80, 'CO', 'America/Bogota', -5, -5, -5),
(81, 'US', 'America/Boise', -7, -6, -7),
(82, 'CA', 'America/Cambridge_Bay', -7, -6, -7),
(83, 'BR', 'America/Campo_Grande', -3, -4, -4),
(84, 'MX', 'America/Cancun', -5, -5, -5),
(85, 'VE', 'America/Caracas', -4, -4, -4),
(86, 'GF', 'America/Cayenne', -3, -3, -3),
(87, 'KY', 'America/Cayman', -5, -5, -5),
(88, 'US', 'America/Chicago', -6, -5, -6),
(89, 'MX', 'America/Chihuahua', -7, -6, -7),
(90, 'CR', 'America/Costa_Rica', -6, -6, -6),
(91, 'CA', 'America/Creston', -7, -7, -7),
(92, 'BR', 'America/Cuiaba', -3, -4, -4),
(93, 'CW', 'America/Curacao', -4, -4, -4),
(94, 'GL', 'America/Danmarkshavn', 0, 0, 0),
(95, 'CA', 'America/Dawson', -8, -7, -8),
(96, 'CA', 'America/Dawson_Creek', -7, -7, -7),
(97, 'US', 'America/Denver', -7, -6, -7),
(98, 'US', 'America/Detroit', -5, -4, -5),
(99, 'DM', 'America/Dominica', -4, -4, -4),
(100, 'CA', 'America/Edmonton', -7, -6, -7),
(101, 'BR', 'America/Eirunepe', -5, -5, -5),
(102, 'SV', 'America/El_Salvador', -6, -6, -6),
(103, 'CA', 'America/Fort_Nelson', -7, -7, -7),
(104, 'BR', 'America/Fortaleza', -3, -3, -3),
(105, 'CA', 'America/Glace_Bay', -4, -3, -4),
(106, 'GL', 'America/Godthab', -3, -2, -3),
(107, 'CA', 'America/Goose_Bay', -4, -3, -4),
(108, 'TC', 'America/Grand_Turk', -4, -4, -4),
(109, 'GD', 'America/Grenada', -4, -4, -4),
(110, 'GP', 'America/Guadeloupe', -4, -4, -4),
(111, 'GT', 'America/Guatemala', -6, -6, -6),
(112, 'EC', 'America/Guayaquil', -5, -5, -5),
(113, 'GY', 'America/Guyana', -4, -4, -4),
(114, 'CA', 'America/Halifax', -4, -3, -4),
(115, 'CU', 'America/Havana', -5, -4, -5),
(116, 'MX', 'America/Hermosillo', -7, -7, -7),
(117, 'US', 'America/Indiana/Indianapolis', -5, -4, -5),
(118, 'US', 'America/Indiana/Knox', -6, -5, -6),
(119, 'US', 'America/Indiana/Marengo', -5, -4, -5),
(120, 'US', 'America/Indiana/Petersburg', -5, -4, -5),
(121, 'US', 'America/Indiana/Tell_City', -6, -5, -6),
(122, 'US', 'America/Indiana/Vevay', -5, -4, -5),
(123, 'US', 'America/Indiana/Vincennes', -5, -4, -5),
(124, 'US', 'America/Indiana/Winamac', -5, -4, -5),
(125, 'CA', 'America/Inuvik', -7, -6, -7),
(126, 'CA', 'America/Iqaluit', -5, -4, -5),
(127, 'JM', 'America/Jamaica', -5, -5, -5),
(128, 'US', 'America/Juneau', -9, -8, -9),
(129, 'US', 'America/Kentucky/Louisville', -5, -4, -5),
(130, 'US', 'America/Kentucky/Monticello', -5, -4, -5),
(131, 'BQ', 'America/Kralendijk', -4, -4, -4),
(132, 'BO', 'America/La_Paz', -4, -4, -4),
(133, 'PE', 'America/Lima', -5, -5, -5),
(134, 'US', 'America/Los_Angeles', -8, -7, -8),
(135, 'SX', 'America/Lower_Princes', -4, -4, -4),
(136, 'BR', 'America/Maceio', -3, -3, -3),
(137, 'NI', 'America/Managua', -6, -6, -6),
(138, 'BR', 'America/Manaus', -4, -4, -4),
(139, 'MF', 'America/Marigot', -4, -4, -4),
(140, 'MQ', 'America/Martinique', -4, -4, -4),
(141, 'MX', 'America/Matamoros', -6, -5, -6),
(142, 'MX', 'America/Mazatlan', -7, -6, -7),
(143, 'US', 'America/Menominee', -6, -5, -6),
(144, 'MX', 'America/Merida', -6, -5, -6),
(145, 'US', 'America/Metlakatla', -9, -8, -9),
(146, 'MX', 'America/Mexico_City', -6, -5, -6),
(147, 'PM', 'America/Miquelon', -3, -2, -3),
(148, 'CA', 'America/Moncton', -4, -3, -4),
(149, 'MX', 'America/Monterrey', -6, -5, -6),
(150, 'UY', 'America/Montevideo', -3, -3, -3),
(151, 'MS', 'America/Montserrat', -4, -4, -4),
(152, 'BS', 'America/Nassau', -5, -4, -5),
(153, 'US', 'America/New_York', -5, -4, -5),
(154, 'CA', 'America/Nipigon', -5, -4, -5),
(155, 'US', 'America/Nome', -9, -8, -9),
(156, 'BR', 'America/Noronha', -2, -2, -2),
(157, 'US', 'America/North_Dakota/Beulah', -6, -5, -6),
(158, 'US', 'America/North_Dakota/Center', -6, -5, -6),
(159, 'US', 'America/North_Dakota/New_Salem', -6, -5, -6),
(160, 'MX', 'America/Ojinaga', -7, -6, -7),
(161, 'PA', 'America/Panama', -5, -5, -5),
(162, 'CA', 'America/Pangnirtung', -5, -4, -5),
(163, 'SR', 'America/Paramaribo', -3, -3, -3),
(164, 'US', 'America/Phoenix', -7, -7, -7),
(165, 'HT', 'America/Port-au-Prince', -5, -4, -5),
(166, 'TT', 'America/Port_of_Spain', -4, -4, -4),
(167, 'BR', 'America/Porto_Velho', -4, -4, -4),
(168, 'PR', 'America/Puerto_Rico', -4, -4, -4),
(169, 'CL', 'America/Punta_Arenas', -3, -3, -3),
(170, 'CA', 'America/Rainy_River', -6, -5, -6),
(171, 'CA', 'America/Rankin_Inlet', -6, -5, -6),
(172, 'BR', 'America/Recife', -3, -3, -3),
(173, 'CA', 'America/Regina', -6, -6, -6),
(174, 'CA', 'America/Resolute', -6, -5, -6),
(175, 'BR', 'America/Rio_Branco', -5, -5, -5),
(176, 'BR', 'America/Santarem', -3, -3, -3),
(177, 'CL', 'America/Santiago', -3, -4, -4),
(178, 'DO', 'America/Santo_Domingo', -4, -4, -4),
(179, 'BR', 'America/Sao_Paulo', -2, -3, -3),
(180, 'GL', 'America/Scoresbysund', -1, 0, -1),
(181, 'US', 'America/Sitka', -9, -8, -9),
(182, 'BL', 'America/St_Barthelemy', -4, -4, -4),
(183, 'CA', 'America/St_Johns', -3.5, -2.5, -3.5),
(184, 'KN', 'America/St_Kitts', -4, -4, -4),
(185, 'LC', 'America/St_Lucia', -4, -4, -4),
(186, 'VI', 'America/St_Thomas', -4, -4, -4),
(187, 'VC', 'America/St_Vincent', -4, -4, -4),
(188, 'CA', 'America/Swift_Current', -6, -6, -6),
(189, 'HN', 'America/Tegucigalpa', -6, -6, -6),
(190, 'GL', 'America/Thule', -4, -3, -4),
(191, 'CA', 'America/Thunder_Bay', -5, -4, -5),
(192, 'MX', 'America/Tijuana', -8, -7, -8),
(193, 'CA', 'America/Toronto', -5, -4, -5),
(194, 'VG', 'America/Tortola', -4, -4, -4),
(195, 'CA', 'America/Vancouver', -8, -7, -8),
(196, 'CA', 'America/Whitehorse', -8, -7, -8),
(197, 'CA', 'America/Winnipeg', -6, -5, -6),
(198, 'US', 'America/Yakutat', -9, -8, -9),
(199, 'CA', 'America/Yellowknife', -7, -6, -7),
(200, 'AQ', 'Antarctica/Casey', 11, 11, 11),
(201, 'AQ', 'Antarctica/Davis', 7, 7, 7),
(202, 'AQ', 'Antarctica/DumontDUrville', 10, 10, 10),
(203, 'AU', 'Antarctica/Macquarie', 11, 11, 11),
(204, 'AQ', 'Antarctica/Mawson', 5, 5, 5),
(205, 'AQ', 'Antarctica/McMurdo', 13, 12, 12),
(206, 'AQ', 'Antarctica/Palmer', -3, -3, -3),
(207, 'AQ', 'Antarctica/Rothera', -3, -3, -3),
(208, 'AQ', 'Antarctica/Syowa', 3, 3, 3),
(209, 'AQ', 'Antarctica/Troll', 0, 2, 0),
(210, 'AQ', 'Antarctica/Vostok', 6, 6, 6),
(211, 'SJ', 'Arctic/Longyearbyen', 1, 2, 1),
(212, 'YE', 'Asia/Aden', 3, 3, 3),
(213, 'KZ', 'Asia/Almaty', 6, 6, 6),
(214, 'JO', 'Asia/Amman', 2, 3, 2),
(215, 'RU', 'Asia/Anadyr', 12, 12, 12),
(216, 'KZ', 'Asia/Aqtau', 5, 5, 5),
(217, 'KZ', 'Asia/Aqtobe', 5, 5, 5),
(218, 'TM', 'Asia/Ashgabat', 5, 5, 5),
(219, 'KZ', 'Asia/Atyrau', 5, 5, 5),
(220, 'IQ', 'Asia/Baghdad', 3, 3, 3),
(221, 'BH', 'Asia/Bahrain', 3, 3, 3),
(222, 'AZ', 'Asia/Baku', 4, 4, 4),
(223, 'TH', 'Asia/Bangkok', 7, 7, 7),
(224, 'RU', 'Asia/Barnaul', 7, 7, 7),
(225, 'LB', 'Asia/Beirut', 2, 3, 2),
(226, 'KG', 'Asia/Bishkek', 6, 6, 6),
(227, 'BN', 'Asia/Brunei', 8, 8, 8),
(228, 'RU', 'Asia/Chita', 9, 9, 9),
(229, 'MN', 'Asia/Choibalsan', 8, 8, 8),
(230, 'LK', 'Asia/Colombo', 5.5, 5.5, 5.5),
(231, 'SY', 'Asia/Damascus', 2, 3, 2),
(232, 'BD', 'Asia/Dhaka', 6, 6, 6),
(233, 'TL', 'Asia/Dili', 9, 9, 9),
(234, 'AE', 'Asia/Dubai', 4, 4, 4),
(235, 'TJ', 'Asia/Dushanbe', 5, 5, 5),
(236, 'CY', 'Asia/Famagusta', 3, 3, 3),
(237, 'PS', 'Asia/Gaza', 2, 3, 2),
(238, 'PS', 'Asia/Hebron', 2, 3, 2),
(239, 'VN', 'Asia/Ho_Chi_Minh', 7, 7, 7),
(240, 'HK', 'Asia/Hong_Kong', 8, 8, 8),
(241, 'MN', 'Asia/Hovd', 7, 7, 7),
(242, 'RU', 'Asia/Irkutsk', 8, 8, 8),
(243, 'ID', 'Asia/Jakarta', 7, 7, 7),
(244, 'ID', 'Asia/Jayapura', 9, 9, 9),
(245, 'IL', 'Asia/Jerusalem', 2, 3, 2),
(246, 'AF', 'Asia/Kabul', 4.5, 4.5, 4.5),
(247, 'RU', 'Asia/Kamchatka', 12, 12, 12),
(248, 'PK', 'Asia/Karachi', 5, 5, 5),
(249, 'NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
(250, 'RU', 'Asia/Khandyga', 9, 9, 9),
(251, 'IN', 'Asia/Kolkata', 5.5, 5.5, 5.5),
(252, 'RU', 'Asia/Krasnoyarsk', 7, 7, 7),
(253, 'MY', 'Asia/Kuala_Lumpur', 8, 8, 8),
(254, 'MY', 'Asia/Kuching', 8, 8, 8),
(255, 'KW', 'Asia/Kuwait', 3, 3, 3),
(256, 'MO', 'Asia/Macau', 8, 8, 8),
(257, 'RU', 'Asia/Magadan', 11, 11, 11),
(258, 'ID', 'Asia/Makassar', 8, 8, 8),
(259, 'PH', 'Asia/Manila', 8, 8, 8),
(260, 'OM', 'Asia/Muscat', 4, 4, 4),
(261, 'CY', 'Asia/Nicosia', 2, 3, 2),
(262, 'RU', 'Asia/Novokuznetsk', 7, 7, 7),
(263, 'RU', 'Asia/Novosibirsk', 7, 7, 7),
(264, 'RU', 'Asia/Omsk', 6, 6, 6),
(265, 'KZ', 'Asia/Oral', 5, 5, 5),
(266, 'KH', 'Asia/Phnom_Penh', 7, 7, 7),
(267, 'ID', 'Asia/Pontianak', 7, 7, 7),
(268, 'KP', 'Asia/Pyongyang', 8.5, 8.5, 8.5),
(269, 'QA', 'Asia/Qatar', 3, 3, 3),
(270, 'KZ', 'Asia/Qyzylorda', 6, 6, 6),
(271, 'SA', 'Asia/Riyadh', 3, 3, 3),
(272, 'RU', 'Asia/Sakhalin', 11, 11, 11),
(273, 'UZ', 'Asia/Samarkand', 5, 5, 5),
(274, 'KR', 'Asia/Seoul', 9, 9, 9),
(275, 'CN', 'Asia/Shanghai', 8, 8, 8),
(276, 'SG', 'Asia/Singapore', 8, 8, 8),
(277, 'RU', 'Asia/Srednekolymsk', 11, 11, 11),
(278, 'TW', 'Asia/Taipei', 8, 8, 8),
(279, 'UZ', 'Asia/Tashkent', 5, 5, 5),
(280, 'GE', 'Asia/Tbilisi', 4, 4, 4),
(281, 'IR', 'Asia/Tehran', 3.5, 4.5, 3.5),
(282, 'BT', 'Asia/Thimphu', 6, 6, 6),
(283, 'JP', 'Asia/Tokyo', 9, 9, 9),
(284, 'RU', 'Asia/Tomsk', 7, 7, 7),
(285, 'MN', 'Asia/Ulaanbaatar', 8, 8, 8),
(286, 'CN', 'Asia/Urumqi', 6, 6, 6),
(287, 'RU', 'Asia/Ust-Nera', 10, 10, 10),
(288, 'LA', 'Asia/Vientiane', 7, 7, 7),
(289, 'RU', 'Asia/Vladivostok', 10, 10, 10),
(290, 'RU', 'Asia/Yakutsk', 9, 9, 9),
(291, 'MM', 'Asia/Yangon', 6.5, 6.5, 6.5),
(292, 'RU', 'Asia/Yekaterinburg', 5, 5, 5),
(293, 'AM', 'Asia/Yerevan', 4, 4, 4),
(294, 'PT', 'Atlantic/Azores', -1, 0, -1),
(295, 'BM', 'Atlantic/Bermuda', -4, -3, -4),
(296, 'ES', 'Atlantic/Canary', 0, 1, 0),
(297, 'CV', 'Atlantic/Cape_Verde', -1, -1, -1),
(298, 'FO', 'Atlantic/Faroe', 0, 1, 0),
(299, 'PT', 'Atlantic/Madeira', 0, 1, 0),
(300, 'IS', 'Atlantic/Reykjavik', 0, 0, 0),
(301, 'GS', 'Atlantic/South_Georgia', -2, -2, -2),
(302, 'SH', 'Atlantic/St_Helena', 0, 0, 0),
(303, 'FK', 'Atlantic/Stanley', -3, -3, -3),
(304, 'AU', 'Australia/Adelaide', 10.5, 9.5, 9.5),
(305, 'AU', 'Australia/Brisbane', 10, 10, 10),
(306, 'AU', 'Australia/Broken_Hill', 10.5, 9.5, 9.5),
(307, 'AU', 'Australia/Currie', 11, 10, 10),
(308, 'AU', 'Australia/Darwin', 9.5, 9.5, 9.5),
(309, 'AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
(310, 'AU', 'Australia/Hobart', 11, 10, 10),
(311, 'AU', 'Australia/Lindeman', 10, 10, 10),
(312, 'AU', 'Australia/Lord_Howe', 11, 10.5, 10.5),
(313, 'AU', 'Australia/Melbourne', 11, 10, 10),
(314, 'AU', 'Australia/Perth', 8, 8, 8),
(315, 'AU', 'Australia/Sydney', 11, 10, 10),
(316, 'NL', 'Europe/Amsterdam', 1, 2, 1),
(317, 'AD', 'Europe/Andorra', 1, 2, 1),
(318, 'RU', 'Europe/Astrakhan', 4, 4, 4),
(319, 'GR', 'Europe/Athens', 2, 3, 2),
(320, 'RS', 'Europe/Belgrade', 1, 2, 1),
(321, 'DE', 'Europe/Berlin', 1, 2, 1),
(322, 'SK', 'Europe/Bratislava', 1, 2, 1),
(323, 'BE', 'Europe/Brussels', 1, 2, 1),
(324, 'RO', 'Europe/Bucharest', 2, 3, 2),
(325, 'HU', 'Europe/Budapest', 1, 2, 1),
(326, 'DE', 'Europe/Busingen', 1, 2, 1),
(327, 'MD', 'Europe/Chisinau', 2, 3, 2),
(328, 'DK', 'Europe/Copenhagen', 1, 2, 1),
(329, 'IE', 'Europe/Dublin', 0, 1, 0),
(330, 'GI', 'Europe/Gibraltar', 1, 2, 1),
(331, 'GG', 'Europe/Guernsey', 0, 1, 0),
(332, 'FI', 'Europe/Helsinki', 2, 3, 2),
(333, 'IM', 'Europe/Isle_of_Man', 0, 1, 0),
(334, 'TR', 'Europe/Istanbul', 3, 3, 3),
(335, 'JE', 'Europe/Jersey', 0, 1, 0),
(336, 'RU', 'Europe/Kaliningrad', 2, 2, 2),
(337, 'UA', 'Europe/Kiev', 2, 3, 2),
(338, 'RU', 'Europe/Kirov', 3, 3, 3),
(339, 'PT', 'Europe/Lisbon', 0, 1, 0),
(340, 'SI', 'Europe/Ljubljana', 1, 2, 1),
(341, 'UK', 'Europe/London', 0, 1, 0),
(342, 'LU', 'Europe/Luxembourg', 1, 2, 1),
(343, 'ES', 'Europe/Madrid', 1, 2, 1),
(344, 'MT', 'Europe/Malta', 1, 2, 1),
(345, 'AX', 'Europe/Mariehamn', 2, 3, 2),
(346, 'BY', 'Europe/Minsk', 3, 3, 3),
(347, 'MC', 'Europe/Monaco', 1, 2, 1),
(348, 'RU', 'Europe/Moscow', 3, 3, 3),
(349, 'NO', 'Europe/Oslo', 1, 2, 1),
(350, 'FR', 'Europe/Paris', 1, 2, 1),
(351, 'ME', 'Europe/Podgorica', 1, 2, 1),
(352, 'CZ', 'Europe/Prague', 1, 2, 1),
(353, 'LV', 'Europe/Riga', 2, 3, 2),
(354, 'IT', 'Europe/Rome', 1, 2, 1),
(355, 'RU', 'Europe/Samara', 4, 4, 4),
(356, 'SM', 'Europe/San_Marino', 1, 2, 1),
(357, 'BA', 'Europe/Sarajevo', 1, 2, 1),
(358, 'RU', 'Europe/Saratov', 4, 4, 4),
(359, 'RU', 'Europe/Simferopol', 3, 3, 3),
(360, 'MK', 'Europe/Skopje', 1, 2, 1),
(361, 'BG', 'Europe/Sofia', 2, 3, 2),
(362, 'SE', 'Europe/Stockholm', 1, 2, 1),
(363, 'EE', 'Europe/Tallinn', 2, 3, 2),
(364, 'AL', 'Europe/Tirane', 1, 2, 1),
(365, 'RU', 'Europe/Ulyanovsk', 4, 4, 4),
(366, 'UA', 'Europe/Uzhgorod', 2, 3, 2),
(367, 'LI', 'Europe/Vaduz', 1, 2, 1),
(368, 'VA', 'Europe/Vatican', 1, 2, 1),
(369, 'AT', 'Europe/Vienna', 1, 2, 1),
(370, 'LT', 'Europe/Vilnius', 2, 3, 2),
(371, 'RU', 'Europe/Volgograd', 3, 3, 3),
(372, 'PL', 'Europe/Warsaw', 1, 2, 1),
(373, 'HR', 'Europe/Zagreb', 1, 2, 1),
(374, 'UA', 'Europe/Zaporozhye', 2, 3, 2),
(375, 'CH', 'Europe/Zurich', 1, 2, 1),
(376, 'MG', 'Indian/Antananarivo', 3, 3, 3),
(377, 'IO', 'Indian/Chagos', 6, 6, 6),
(378, 'CX', 'Indian/Christmas', 7, 7, 7),
(379, 'CC', 'Indian/Cocos', 6.5, 6.5, 6.5),
(380, 'KM', 'Indian/Comoro', 3, 3, 3),
(381, 'TF', 'Indian/Kerguelen', 5, 5, 5),
(382, 'SC', 'Indian/Mahe', 4, 4, 4),
(383, 'MV', 'Indian/Maldives', 5, 5, 5),
(384, 'MU', 'Indian/Mauritius', 4, 4, 4),
(385, 'YT', 'Indian/Mayotte', 3, 3, 3),
(386, 'RE', 'Indian/Reunion', 4, 4, 4),
(387, 'WS', 'Pacific/Apia', 14, 13, 13),
(388, 'NZ', 'Pacific/Auckland', 13, 12, 12),
(389, 'PG', 'Pacific/Bougainville', 11, 11, 11),
(390, 'NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
(391, 'FM', 'Pacific/Chuuk', 10, 10, 10),
(392, 'CL', 'Pacific/Easter', -5, -6, -6),
(393, 'VU', 'Pacific/Efate', 11, 11, 11),
(394, 'KI', 'Pacific/Enderbury', 13, 13, 13),
(395, 'TK', 'Pacific/Fakaofo', 13, 13, 13),
(396, 'FJ', 'Pacific/Fiji', 13, 12, 12),
(397, 'TV', 'Pacific/Funafuti', 12, 12, 12),
(398, 'EC', 'Pacific/Galapagos', -6, -6, -6),
(399, 'PF', 'Pacific/Gambier', -9, -9, -9),
(400, 'SB', 'Pacific/Guadalcanal', 11, 11, 11),
(401, 'GU', 'Pacific/Guam', 10, 10, 10),
(402, 'US', 'Pacific/Honolulu', -10, -10, -10),
(403, 'KI', 'Pacific/Kiritimati', 14, 14, 14),
(404, 'FM', 'Pacific/Kosrae', 11, 11, 11),
(405, 'MH', 'Pacific/Kwajalein', 12, 12, 12),
(406, 'MH', 'Pacific/Majuro', 12, 12, 12),
(407, 'PF', 'Pacific/Marquesas', -9.5, -9.5, -9.5),
(408, 'UM', 'Pacific/Midway', -11, -11, -11),
(409, 'NR', 'Pacific/Nauru', 12, 12, 12),
(410, 'NU', 'Pacific/Niue', -11, -11, -11),
(411, 'NF', 'Pacific/Norfolk', 11, 11, 11),
(412, 'NC', 'Pacific/Noumea', 11, 11, 11),
(413, 'AS', 'Pacific/Pago_Pago', -11, -11, -11),
(414, 'PW', 'Pacific/Palau', 9, 9, 9),
(415, 'PN', 'Pacific/Pitcairn', -8, -8, -8),
(416, 'FM', 'Pacific/Pohnpei', 11, 11, 11),
(417, 'PG', 'Pacific/Port_Moresby', 10, 10, 10),
(418, 'CK', 'Pacific/Rarotonga', -10, -10, -10),
(419, 'MP', 'Pacific/Saipan', 10, 10, 10),
(420, 'PF', 'Pacific/Tahiti', -10, -10, -10),
(421, 'KI', 'Pacific/Tarawa', 12, 12, 12),
(422, 'TO', 'Pacific/Tongatapu', 14, 13, 13),
(423, 'UM', 'Pacific/Wake', 12, 12, 12),
(424, 'WF', 'Pacific/Wallis', 12, 12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT '1',
  `disable_comments` tinyint(1) UNSIGNED DEFAULT '0',
  `receive_newsletter` tinyint(1) UNSIGNED DEFAULT '1',
  `receive_advice` tinyint(1) UNSIGNED DEFAULT '1',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` int(10) UNSIGNED DEFAULT NULL,
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '1',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '0',
  `blocked` tinyint(1) UNSIGNED DEFAULT '0',
  `closed` tinyint(1) UNSIGNED DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `receive_newsletter`, `receive_advice`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `blocked`, `closed`, `last_login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AR', NULL, 1, 3, 'Administrador', NULL, 'Administrator', NULL, 0, NULL, 'admin@demosite.com', '$2y$10$EN4cBAUQxViuPGdTsml1AeWA1JJuz8R2bDR5RroMEvAy2WWqRMBFq', 'd8Nc7mW8gXB4v60umPuhRbfzNhfyaXyR9U8vdzNPOLODBGDEWKe9BwaLuEVF', NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2019-04-15 19:53:22', NULL, '2019-04-15 22:53:22', NULL),
(2, 'AR', 'es', NULL, NULL, 'Ramiro Martinez', NULL, NULL, NULL, NULL, NULL, 'logidatweb@gmail.com', '$2y$10$shwUfWVLh4dUJ3DKaHHL7.R2WBYA0DxEl6aJU/K.XKXzk9PVxkQty', '7D6EbCpun5ybyV7ImfiPrWGhQAGOcgby8U1NGh4i4Rs9929rEBP16Y4f715n', 0, 1, 0, 1, 1, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2019-04-15 19:56:36', '2019-04-06 15:52:33', '2019-04-15 22:56:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`entry`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `slug` (`slug`);

--
-- Indices de la tabla `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`field_id`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `subadmin2_code` (`subadmin2_code`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indices de la tabla `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `belongs_to` (`belongs_to`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indices de la tabla `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indices de la tabla `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abbr` (`abbr`),
  ADD KEY `active` (`active`),
  ADD KEY `default` (`default`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indices de la tabla `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indices de la tabla `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `package_id` (`package_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indices de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_ccbox` (`has_ccbox`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lat` (`lon`,`lat`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `title` (`title`),
  ADD KEY `address` (`address`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `featured` (`featured`),
  ADD KEY `post_type_id` (`post_type_id`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `contact_name` (`contact_name`),
  ADD KEY `tags` (`tags`);

--
-- Indices de la tabla `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indices de la tabla `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indices de la tabla `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_zone_id` (`time_zone_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `phone` (`phone`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `can_be_impersonated` (`can_be_impersonated`);

--
-- Indices de la tabla `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;
--
-- AUTO_INCREMENT de la tabla `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT de la tabla `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;
--
-- AUTO_INCREMENT de la tabla `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT de la tabla `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9421;
--
-- AUTO_INCREMENT de la tabla `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
