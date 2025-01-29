-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 29, 2025 at 09:36 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UV_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `acordes_linea`
--

CREATE TABLE `acordes_linea` (
  `id_acordes_linea` int NOT NULL,
  `id_lineas_canciones` int NOT NULL,
  `ubicacion` int NOT NULL,
  `grado` int NOT NULL,
  `id_triadas` int DEFAULT NULL,
  `id_extensiones` int DEFAULT NULL,
  `duracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acordes_linea`
--

INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(1, 5, 0, 10, 1, NULL, 0),
(2, 5, 18, 6, NULL, NULL, 0),
(3, 6, 0, 10, 1, NULL, 0),
(4, 6, 20, 6, NULL, NULL, 0),
(5, 7, 0, 10, 1, NULL, 0),
(6, 7, 10, 6, NULL, NULL, 0),
(7, 8, 8, 1, NULL, NULL, 0),
(8, 8, 15, 8, NULL, NULL, 0),
(9, 9, 1, 1, NULL, NULL, 0),
(10, 10, 4, 10, 1, NULL, 0),
(11, 11, 6, 6, NULL, NULL, 0),
(12, 11, 17, 1, NULL, NULL, 0),
(13, 1, 1, 1, NULL, NULL, 0),
(14, 2, 1, 1, NULL, NULL, 0),
(15, 1, 9, 6, NULL, NULL, 0),
(16, 1, 17, 8, NULL, NULL, 0),
(17, 74, 4, 10, 1, NULL, 0),
(18, 74, 24, 6, NULL, NULL, 0),
(19, 75, 1, 1, NULL, NULL, 0),
(20, 75, 15, 8, NULL, NULL, 0),
(21, 76, 4, 10, 1, NULL, 0),
(22, 76, 20, 6, NULL, NULL, 0),
(23, 77, 1, 1, NULL, NULL, 0),
(24, 77, 15, 8, NULL, NULL, 0),
(25, 78, 8, 10, 1, NULL, 0),
(26, 78, 20, 6, NULL, NULL, 0),
(27, 79, 10, 1, NULL, NULL, 0),
(28, 79, 25, 8, NULL, NULL, 0),
(29, 80, 7, 10, 1, NULL, 0),
(30, 80, 20, 6, NULL, NULL, 0),
(31, 81, 9, 1, NULL, NULL, 0),
(32, 81, 24, 8, NULL, NULL, 0),
(33, 82, 7, 10, 1, NULL, 0),
(34, 82, 16, 6, NULL, NULL, 0),
(35, 83, 8, 1, NULL, NULL, 0),
(36, 83, 22, 8, NULL, NULL, 0),
(37, 84, 8, 10, 1, NULL, 0),
(38, 84, 20, 6, NULL, NULL, 0),
(39, 85, 11, 1, NULL, NULL, 0),
(40, 85, 22, 8, NULL, NULL, 0),
(58, 34, 1, 1, NULL, NULL, 0),
(59, 34, 2, 6, NULL, NULL, 0),
(60, 34, 3, 3, 1, NULL, 0),
(61, 34, 4, 11, NULL, NULL, 0),
(62, 34, 1, 1, NULL, NULL, 0),
(63, 34, 2, 6, NULL, NULL, 0),
(64, 34, 1, 3, 1, NULL, 0),
(65, 34, 2, 11, NULL, NULL, 0),
(66, 34, 1, 1, NULL, NULL, 0),
(67, 34, 2, 6, NULL, NULL, 0),
(68, 34, 1, 3, 1, NULL, 0),
(69, 34, 2, 11, NULL, NULL, 0),
(70, 34, 1, 1, NULL, NULL, 0),
(71, 34, 1, 8, NULL, NULL, 0),
(72, 34, 1, 10, 1, NULL, 0),
(73, 34, 2, 6, NULL, NULL, 0),
(74, 34, 1, 1, NULL, NULL, 0),
(123, 110, 1, 1, NULL, NULL, 0),
(124, 110, 5, 6, NULL, NULL, 0),
(125, 110, 8, 3, 1, NULL, 0),
(126, 110, 13, 11, NULL, NULL, 0),
(127, 111, 1, 1, NULL, NULL, 0),
(128, 111, 15, 6, NULL, NULL, 0),
(129, 112, 5, 3, 1, NULL, 0),
(130, 112, 19, 11, NULL, NULL, 0),
(131, 113, 1, 1, NULL, NULL, 0),
(132, 113, 8, 6, NULL, NULL, 0),
(133, 114, 6, 3, 1, NULL, 0),
(134, 114, 20, 11, NULL, NULL, 0),
(135, 115, 2, 1, NULL, NULL, 0),
(136, 116, 3, 8, NULL, NULL, 0),
(137, 117, 2, 10, 1, NULL, 0),
(138, 117, 19, 6, NULL, NULL, 0),
(139, 118, 2, 1, NULL, NULL, 0),
(140, 118, 18, 8, NULL, NULL, 0),
(141, 119, 2, 10, NULL, NULL, 0),
(142, 119, 12, 6, NULL, NULL, 0),
(143, 120, 1, 1, NULL, NULL, 0),
(144, 120, 29, 11, NULL, NULL, 0),
(145, 121, 1, 10, 1, NULL, 0),
(146, 121, 29, 6, NULL, NULL, 0),
(147, 122, 8, 1, NULL, NULL, 0),
(148, 122, 25, 3, 1, NULL, 0),
(149, 123, 2, 8, NULL, NULL, 0),
(150, 123, 19, 1, NULL, NULL, 0),
(151, 124, 8, 1, NULL, NULL, 0),
(152, 124, 22, 3, 1, NULL, 0),
(153, 125, 3, 3, NULL, NULL, 0),
(154, 125, 18, 8, NULL, NULL, 0),
(155, 126, 8, 1, NULL, NULL, 0),
(156, 126, 22, 3, 1, NULL, 0),
(157, 127, 3, 8, NULL, NULL, 0),
(158, 127, 17, 1, NULL, NULL, 0),
(159, 128, 4, 1, NULL, NULL, 0),
(160, 128, 18, 3, 1, NULL, 0),
(161, 129, 5, 3, NULL, NULL, 0),
(162, 129, 17, 8, NULL, NULL, 0),
(163, 130, 12, 5, 1, NULL, 0),
(164, 130, 18, 10, 1, NULL, 0),
(165, 130, 23, 3, 1, NULL, 0),
(166, 130, 33, 8, NULL, NULL, 0),
(167, 131, 1, 5, NULL, NULL, 0),
(168, 131, 12, 10, 1, NULL, 0),
(169, 131, 22, 6, NULL, NULL, 0),
(170, 131, 37, 8, NULL, NULL, 0),
(171, 132, 12, 5, 1, NULL, 0),
(172, 132, 18, 10, 1, NULL, 0),
(173, 132, 23, 3, 1, NULL, 0),
(174, 132, 33, 8, NULL, NULL, 0),
(175, 133, 5, 5, NULL, NULL, 0),
(176, 133, 20, 10, 1, NULL, 0),
(177, 133, 31, 3, 1, NULL, 0),
(178, 133, 40, 8, NULL, NULL, 0),
(179, 133, 45, 1, NULL, NULL, 0),
(246, 158, 4, 1, NULL, NULL, 0),
(247, 158, 13, 5, NULL, NULL, 0),
(248, 158, 21, 10, 1, NULL, 0),
(249, 159, 9, 6, NULL, NULL, 0),
(250, 159, 19, 8, NULL, NULL, 0),
(251, 159, 28, 1, NULL, NULL, 0),
(252, 160, 4, 5, NULL, NULL, 0),
(253, 161, 11, 10, 1, NULL, 0),
(254, 161, 23, 3, NULL, NULL, 0),
(255, 162, 11, 3, 1, NULL, 0),
(256, 162, 22, 1, NULL, NULL, 0),
(257, 162, 34, 11, NULL, NULL, 0),
(258, 162, 37, 8, NULL, NULL, 0),
(259, 163, 4, 1, NULL, NULL, 0),
(260, 163, 13, 5, NULL, NULL, 0),
(261, 163, 21, 10, 1, NULL, 0),
(262, 164, 9, 6, NULL, NULL, 0),
(263, 164, 19, 8, NULL, NULL, 0),
(264, 164, 28, 1, NULL, NULL, 0),
(265, 165, 4, 5, NULL, NULL, 0),
(266, 166, 11, 10, 1, NULL, 0),
(267, 166, 23, 3, NULL, NULL, 0),
(268, 167, 11, 6, NULL, NULL, 0),
(269, 167, 22, 8, NULL, NULL, 0),
(270, 167, 34, 1, NULL, NULL, 0),
(271, 167, 42, 10, 1, NULL, 0),
(272, 168, 11, 6, NULL, NULL, 0),
(273, 168, 22, 8, NULL, NULL, 0),
(274, 168, 34, 1, NULL, NULL, 0),
(275, 168, 42, 10, 1, NULL, 0),
(276, 169, 11, 6, NULL, NULL, 0),
(277, 169, 22, 8, NULL, NULL, 0),
(278, 169, 34, 1, NULL, NULL, 0),
(279, 170, 1, 6, NULL, NULL, 0),
(280, 170, 14, 8, NULL, NULL, 0),
(281, 170, 27, 1, NULL, NULL, 0),
(282, 171, 1, 6, NULL, NULL, 0),
(283, 171, 10, 8, NULL, NULL, 0),
(284, 171, 21, 1, NULL, NULL, 0),
(285, 172, 1, 6, NULL, NULL, 0),
(286, 172, 14, 8, NULL, NULL, 0),
(287, 172, 26, 1, NULL, NULL, 0),
(288, 172, 32, 10, 1, NULL, 0),
(289, 173, 1, 3, 1, NULL, 0),
(290, 173, 24, 6, NULL, NULL, 0),
(291, 173, 26, 8, NULL, NULL, 0),
(292, 174, 1, 6, NULL, NULL, 0),
(293, 174, 12, 8, NULL, NULL, 0),
(294, 174, 25, 1, NULL, NULL, 0),
(295, 175, 1, 6, NULL, NULL, 0),
(296, 175, 16, 8, NULL, NULL, 0),
(297, 175, 26, 1, NULL, NULL, 0),
(298, 176, 1, 6, NULL, NULL, 0),
(299, 176, 18, 8, NULL, NULL, 0),
(300, 176, 27, 1, NULL, NULL, 0),
(301, 176, 32, 10, 1, NULL, 0),
(302, 177, 1, 3, 1, NULL, 0),
(303, 177, 29, 6, NULL, NULL, 0),
(304, 177, 31, 8, NULL, NULL, 0),
(305, 178, 1, 1, NULL, NULL, 0),
(306, 178, 19, 8, NULL, NULL, 0),
(307, 178, 30, 3, 1, NULL, 0),
(308, 179, 13, 6, NULL, NULL, 0),
(309, 179, 20, 8, NULL, NULL, 0),
(310, 179, 25, 1, NULL, NULL, 0),
(311, 180, 14, 8, NULL, NULL, 0),
(312, 180, 27, 3, 1, NULL, 0),
(313, 181, 17, 6, NULL, NULL, 0),
(314, 181, 21, 8, NULL, NULL, 0),
(315, 181, 27, 6, NULL, NULL, 0),
(316, 181, 29, 8, NULL, NULL, 0),
(317, 182, 1, 6, NULL, NULL, 0),
(318, 182, 14, 8, NULL, NULL, 0),
(319, 182, 27, 1, NULL, NULL, 0),
(320, 183, 1, 6, NULL, NULL, 0),
(321, 183, 15, 8, NULL, NULL, 0),
(322, 183, 28, 1, NULL, NULL, 0),
(323, 184, 1, 6, NULL, NULL, 0),
(324, 184, 15, 8, NULL, NULL, 0),
(325, 184, 31, 1, NULL, NULL, 0),
(326, 185, 1, 3, 1, NULL, 0),
(327, 185, 29, 6, NULL, NULL, 0),
(328, 185, 31, 8, NULL, NULL, 0),
(329, 186, 1, 1, NULL, NULL, 0),
(330, 186, 20, 6, NULL, NULL, 0),
(331, 186, 25, 8, NULL, NULL, 0),
(332, 186, 27, 1, NULL, NULL, 0),
(333, 187, 17, 6, NULL, NULL, 0),
(334, 187, 20, 8, NULL, NULL, 0),
(335, 187, 22, 1, NULL, NULL, 0),
(336, 188, 11, 8, NULL, NULL, 0),
(337, 188, 16, 10, 1, NULL, 0),
(338, 189, 6, 8, NULL, NULL, 0),
(339, 189, 13, 6, NULL, NULL, 0),
(340, 190, 9, 3, 1, NULL, 0),
(341, 190, 14, 1, NULL, NULL, 0),
(342, 190, 19, 8, NULL, NULL, 0),
(343, 191, 18, 6, NULL, NULL, 0),
(344, 191, 23, 8, NULL, NULL, 0),
(345, 191, 25, 1, NULL, NULL, 0),
(346, 192, 17, 6, NULL, NULL, 0),
(347, 192, 20, 8, NULL, NULL, 0),
(348, 192, 22, 1, NULL, NULL, 0),
(349, 193, 14, 8, NULL, NULL, 0),
(350, 193, 21, 10, 1, NULL, 0),
(351, 194, 4, 8, NULL, NULL, 0),
(352, 194, 14, 6, NULL, NULL, 0),
(353, 195, 8, 3, 1, NULL, 0),
(354, 195, 14, 1, NULL, NULL, 0),
(355, 195, 20, 8, NULL, NULL, 0),
(356, 196, 2, 1, NULL, NULL, 0),
(357, 196, 15, 8, NULL, NULL, 0),
(358, 197, 1, 3, 1, NULL, 0),
(359, 197, 9, 1, NULL, NULL, 0),
(360, 197, 16, 6, NULL, NULL, 0),
(361, 198, 2, 8, NULL, NULL, 0),
(362, 198, 11, 1, NULL, NULL, 0),
(363, 198, 17, 6, NULL, NULL, 0),
(364, 199, 2, 3, 1, NULL, 0),
(365, 199, 12, 1, NULL, NULL, 0),
(366, 199, 17, 8, NULL, NULL, 0),
(367, 200, 1, 1, NULL, NULL, 0),
(368, 200, 19, 8, NULL, NULL, 0),
(369, 201, 1, 3, 1, NULL, 0),
(370, 201, 6, 1, NULL, NULL, 0),
(371, 201, 11, 6, NULL, NULL, 0),
(372, 202, 4, 8, NULL, NULL, 0),
(373, 202, 17, 6, NULL, NULL, 0),
(374, 202, 24, 1, NULL, NULL, 0),
(375, 202, 29, 6, NULL, NULL, 0),
(376, 203, 1, 8, NULL, NULL, 0),
(377, 203, 17, 3, 1, NULL, 0),
(378, 203, 21, 1, NULL, NULL, 0),
(379, 203, 23, 8, NULL, NULL, 0),
(380, 204, 1, 8, NULL, NULL, 0),
(381, 204, 17, 3, 1, NULL, 0),
(382, 204, 21, 1, NULL, NULL, 0),
(383, 204, 23, 8, NULL, NULL, 0),
(384, 205, 17, 1, NULL, NULL, 0),
(385, 206, 1, 1, NULL, NULL, 0),
(386, 206, 20, 6, NULL, NULL, 0),
(387, 206, 25, 8, NULL, NULL, 0),
(388, 206, 27, 1, NULL, NULL, 0),
(389, 207, 17, 6, NULL, NULL, 0),
(390, 207, 20, 8, NULL, NULL, 0),
(391, 207, 22, 1, NULL, NULL, 0),
(392, 208, 11, 8, NULL, NULL, 0),
(393, 208, 16, 10, 1, NULL, 0),
(394, 209, 6, 8, NULL, NULL, 0),
(395, 209, 13, 6, NULL, NULL, 0),
(396, 210, 9, 3, 1, NULL, 0),
(397, 210, 14, 1, NULL, NULL, 0),
(398, 210, 19, 8, NULL, NULL, 0),
(399, 211, 18, 6, NULL, NULL, 0),
(400, 211, 23, 8, NULL, NULL, 0),
(401, 211, 25, 1, NULL, NULL, 0),
(402, 212, 17, 6, NULL, NULL, 0),
(403, 212, 20, 8, NULL, NULL, 0),
(404, 212, 22, 1, NULL, NULL, 0),
(405, 213, 14, 8, NULL, NULL, 0),
(406, 213, 21, 10, 1, NULL, 0),
(407, 214, 4, 8, NULL, NULL, 0),
(408, 214, 14, 6, NULL, NULL, 0),
(409, 215, 8, 3, 1, NULL, 0),
(410, 215, 14, 1, NULL, NULL, 0),
(411, 215, 20, 8, NULL, NULL, 0),
(412, 216, 2, 1, NULL, NULL, 0),
(413, 216, 15, 8, NULL, NULL, 0),
(414, 217, 1, 3, 1, NULL, 0),
(415, 217, 9, 1, NULL, NULL, 0),
(416, 217, 16, 6, NULL, NULL, 0),
(417, 218, 2, 8, NULL, NULL, 0),
(418, 218, 11, 1, NULL, NULL, 0),
(419, 218, 17, 6, NULL, NULL, 0),
(420, 219, 2, 3, 1, NULL, 0),
(421, 219, 12, 1, NULL, NULL, 0),
(422, 219, 17, 8, NULL, NULL, 0),
(423, 220, 1, 1, NULL, NULL, 0),
(424, 220, 19, 8, NULL, NULL, 0),
(425, 221, 1, 3, 1, NULL, 0),
(426, 221, 6, 1, NULL, NULL, 0),
(427, 221, 11, 6, NULL, NULL, 0),
(428, 222, 4, 8, NULL, NULL, 0),
(429, 222, 17, 6, NULL, NULL, 0),
(430, 222, 24, 1, NULL, NULL, 0),
(431, 222, 29, 6, NULL, NULL, 0),
(432, 223, 1, 8, NULL, NULL, 0),
(433, 223, 17, 3, 1, NULL, 0),
(434, 223, 21, 1, NULL, NULL, 0),
(435, 223, 23, 8, NULL, NULL, 0),
(436, 224, 1, 8, NULL, NULL, 0),
(437, 224, 17, 3, 1, NULL, 0),
(438, 224, 21, 1, NULL, NULL, 0),
(439, 224, 23, 8, NULL, NULL, 0),
(440, 225, 17, 1, NULL, NULL, 0),
(441, 226, 6, 1, NULL, NULL, 0),
(442, 226, 27, 6, NULL, NULL, 0),
(443, 227, 7, 3, 1, NULL, 0),
(444, 227, 10, 8, NULL, NULL, 0),
(445, 227, 31, 1, NULL, NULL, 0),
(446, 227, 36, 8, NULL, NULL, 0),
(447, 228, 12, 1, NULL, NULL, 0),
(448, 228, 28, 1, NULL, 2, 0),
(449, 229, 8, 6, NULL, NULL, 0),
(450, 229, 12, 3, 1, NULL, 0),
(451, 229, 22, 1, NULL, NULL, 0),
(452, 229, 27, 10, 1, NULL, 0),
(453, 230, 8, 3, 1, NULL, 0),
(454, 230, 15, 8, NULL, NULL, 0),
(455, 230, 18, 1, NULL, NULL, 0),
(456, 231, 1, 6, NULL, NULL, 0),
(457, 231, 15, 8, NULL, NULL, 0),
(458, 231, 25, 1, NULL, NULL, 0),
(459, 232, 1, 6, NULL, NULL, 0),
(460, 232, 10, 8, NULL, NULL, 0),
(461, 232, 19, 1, NULL, NULL, 0),
(462, 233, 1, 6, NULL, NULL, 0),
(463, 233, 13, 8, NULL, NULL, 0),
(464, 233, 23, 10, 1, NULL, 0),
(465, 234, 6, 6, 1, NULL, 0),
(466, 234, 20, 8, NULL, NULL, 0),
(467, 235, 1, 6, NULL, NULL, 0),
(468, 235, 10, 8, NULL, NULL, 0),
(469, 235, 17, 1, NULL, NULL, 0),
(470, 236, 1, 6, NULL, NULL, 0),
(471, 236, 12, 8, NULL, NULL, 0),
(472, 236, 20, 1, NULL, NULL, 0),
(473, 237, 1, 6, NULL, NULL, 0),
(474, 237, 13, 8, NULL, NULL, 0),
(475, 237, 23, 10, 1, NULL, 0),
(476, 238, 10, 6, NULL, NULL, 0),
(477, 238, 20, 8, NULL, NULL, 0),
(478, 239, 7, 1, NULL, NULL, 0),
(479, 239, 17, 8, NULL, NULL, 0),
(480, 239, 27, 10, 1, NULL, 0),
(481, 239, 46, 6, NULL, NULL, 0),
(482, 240, 7, 1, NULL, NULL, 0),
(483, 240, 17, 8, NULL, NULL, 0),
(484, 240, 28, 10, 1, NULL, 0),
(485, 240, 52, 6, NULL, NULL, 0),
(486, 241, 7, 3, 1, NULL, 0),
(487, 241, 16, 8, NULL, NULL, 0),
(488, 241, 28, 6, NULL, NULL, 0),
(489, 241, 42, 8, NULL, NULL, 0),
(490, 242, 1, 1, NULL, NULL, 0),
(491, 242, 12, 10, 1, NULL, 0),
(492, 243, 1, 3, 1, NULL, 0),
(493, 243, 9, 8, NULL, NULL, 0),
(494, 244, 1, 6, NULL, NULL, 0),
(495, 244, 14, 8, NULL, NULL, 0),
(496, 245, 1, 1, NULL, NULL, 0),
(497, 245, 16, 1, NULL, 2, 0),
(498, 246, 1, 6, NULL, NULL, 0),
(499, 246, 18, 6, 1, NULL, 0),
(500, 247, 5, 1, NULL, NULL, 0),
(501, 247, 11, 5, 1, NULL, 0),
(502, 247, 17, 10, 1, NULL, 0),
(503, 248, 6, 6, NULL, NULL, 0),
(504, 248, 12, 1, NULL, NULL, 0),
(505, 249, 1, 8, NULL, NULL, 0),
(506, 249, 17, 1, NULL, NULL, 0),
(507, 250, 5, 1, NULL, NULL, 0),
(508, 250, 27, 8, NULL, NULL, 0),
(509, 250, 37, 1, NULL, NULL, 0),
(510, 251, 5, 6, NULL, NULL, 0),
(511, 251, 13, 1, NULL, NULL, 0),
(512, 251, 22, 3, NULL, NULL, 0),
(513, 251, 33, 8, NULL, NULL, 0),
(514, 252, 5, 1, NULL, NULL, 0),
(515, 252, 25, 8, NULL, NULL, 0),
(516, 252, 37, 1, NULL, NULL, 0),
(517, 253, 1, 1, NULL, 2, 0),
(518, 253, 6, 6, NULL, NULL, 0),
(519, 253, 14, 1, NULL, NULL, 0),
(520, 253, 27, 8, NULL, NULL, 0),
(521, 253, 38, 1, NULL, NULL, 0),
(522, 254, 13, 1, NULL, NULL, 0),
(523, 254, 29, 1, NULL, NULL, 0),
(524, 255, 9, 1, NULL, NULL, 0),
(525, 255, 19, 8, NULL, NULL, 0),
(526, 256, 9, 3, 1, NULL, 0),
(527, 256, 17, 3, 1, NULL, 0),
(528, 256, 26, 8, NULL, NULL, 0),
(529, 256, 37, 1, NULL, NULL, 0),
(530, 257, 4, 1, NULL, NULL, 0),
(531, 257, 29, 8, NULL, NULL, 0),
(532, 257, 38, 1, NULL, NULL, 0),
(533, 258, 1, 1, NULL, 2, 0),
(534, 258, 6, 6, NULL, NULL, 0),
(535, 258, 14, 1, NULL, NULL, 0),
(536, 258, 24, 8, NULL, NULL, 0),
(537, 258, 36, 1, NULL, NULL, 0),
(538, 259, 1, 1, NULL, NULL, 0),
(539, 259, 23, 8, NULL, NULL, 0),
(540, 259, 33, 1, NULL, NULL, 0),
(541, 260, 1, 6, NULL, NULL, 0),
(542, 260, 9, 1, NULL, NULL, 0),
(543, 260, 18, 3, NULL, NULL, 0),
(544, 260, 29, 8, NULL, NULL, 0),
(545, 261, 1, 1, NULL, NULL, 0),
(546, 261, 21, 8, NULL, NULL, 0),
(547, 261, 33, 1, NULL, NULL, 0),
(548, 262, 1, 1, NULL, 2, 0),
(549, 262, 6, 6, NULL, NULL, 0),
(550, 262, 14, 1, NULL, NULL, 0),
(551, 262, 27, 8, NULL, NULL, 0),
(552, 262, 38, 1, NULL, NULL, 0),
(553, 263, 1, 1, NULL, NULL, 0),
(554, 263, 17, 1, NULL, NULL, 0),
(555, 264, 1, 1, NULL, NULL, 0),
(556, 264, 11, 8, NULL, NULL, 0),
(557, 265, 1, 3, 1, NULL, 0),
(558, 265, 9, 3, 1, NULL, 0),
(559, 265, 18, 8, NULL, NULL, 0),
(560, 265, 29, 1, NULL, NULL, 0),
(561, 266, 1, 1, NULL, NULL, 0),
(562, 266, 26, 8, NULL, NULL, 0),
(563, 266, 35, 1, NULL, NULL, 0),
(564, 267, 1, 1, NULL, 2, 0),
(565, 267, 6, 6, NULL, NULL, 0),
(566, 267, 14, 1, NULL, NULL, 0),
(567, 267, 24, 8, NULL, NULL, 0),
(568, 267, 36, 1, NULL, NULL, 0),
(569, 268, 5, 1, NULL, NULL, 0),
(570, 268, 27, 8, NULL, NULL, 0),
(571, 268, 37, 1, NULL, NULL, 0),
(572, 269, 5, 6, NULL, NULL, 0),
(573, 269, 13, 1, NULL, NULL, 0),
(574, 269, 22, 3, NULL, NULL, 0),
(575, 269, 33, 8, NULL, NULL, 0),
(576, 270, 5, 1, NULL, NULL, 0),
(577, 270, 25, 8, NULL, NULL, 0),
(578, 270, 37, 1, NULL, NULL, 0),
(579, 271, 1, 1, NULL, 2, 0),
(580, 271, 6, 6, NULL, NULL, 0),
(581, 271, 14, 1, NULL, NULL, 0),
(582, 271, 27, 8, NULL, NULL, 0),
(583, 271, 38, 1, NULL, NULL, 0),
(584, 272, 13, 1, NULL, NULL, 0),
(585, 272, 29, 1, NULL, NULL, 0),
(586, 273, 9, 1, NULL, NULL, 0),
(587, 273, 19, 8, NULL, NULL, 0),
(588, 274, 9, 3, 1, NULL, 0),
(589, 274, 17, 3, 1, NULL, 0),
(590, 274, 26, 8, NULL, NULL, 0),
(591, 274, 37, 1, NULL, NULL, 0),
(592, 275, 4, 1, NULL, NULL, 0),
(593, 275, 29, 8, NULL, NULL, 0),
(594, 275, 38, 1, NULL, NULL, 0),
(595, 276, 1, 1, NULL, 2, 0),
(596, 276, 6, 6, NULL, NULL, 0),
(597, 276, 14, 1, NULL, NULL, 0),
(598, 276, 24, 8, NULL, NULL, 0),
(599, 276, 36, 1, NULL, NULL, 0),
(600, 277, 2, 1, NULL, NULL, 0),
(601, 277, 13, 8, NULL, NULL, 0),
(602, 278, 9, 6, NULL, NULL, 0),
(603, 278, 23, 1, NULL, NULL, 0),
(604, 279, 4, 6, NULL, NULL, 0),
(605, 279, 15, 1, NULL, NULL, 0),
(606, 279, 22, 10, 1, NULL, 0),
(607, 280, 2, 3, 1, NULL, 0),
(608, 280, 12, 8, NULL, NULL, 0),
(609, 281, 1, 1, NULL, NULL, 0),
(610, 281, 12, 8, NULL, NULL, 0),
(611, 282, 7, 6, NULL, NULL, 0),
(612, 282, 16, 1, NULL, NULL, 0),
(613, 283, 3, 6, NULL, NULL, 0),
(614, 283, 17, 1, NULL, NULL, 0),
(615, 283, 23, 10, 1, NULL, 0),
(616, 284, 1, 3, 1, NULL, 0),
(617, 284, 14, 5, NULL, NULL, 0),
(618, 285, 2, 6, NULL, NULL, 0),
(619, 285, 8, 8, NULL, NULL, 0),
(620, 285, 14, 1, NULL, NULL, 0),
(621, 286, 8, 9, NULL, NULL, 0),
(622, 286, 20, 11, NULL, NULL, 0),
(623, 286, 33, 1, NULL, NULL, 0),
(624, 287, 3, 9, NULL, NULL, 0),
(625, 287, 18, 11, NULL, NULL, 0),
(626, 287, 32, 1, NULL, NULL, 0),
(627, 288, 2, 6, NULL, NULL, 0),
(628, 288, 16, 8, NULL, NULL, 0),
(629, 289, 7, 1, NULL, NULL, 0),
(630, 289, 19, 10, 1, NULL, 0),
(631, 290, 1, 6, NULL, NULL, 0),
(632, 290, 9, 8, NULL, NULL, 0),
(633, 290, 21, 10, NULL, NULL, 0),
(634, 291, 1, 1, NULL, NULL, 0),
(635, 291, 16, 3, 1, NULL, 0),
(636, 292, 1, 8, NULL, NULL, 0),
(637, 292, 14, 6, NULL, NULL, 0),
(638, 292, 16, 1, NULL, NULL, 0),
(639, 293, 13, 3, 1, NULL, 0),
(640, 294, 6, 3, NULL, NULL, 0),
(641, 294, 8, 8, NULL, NULL, 0),
(642, 295, 12, 3, 1, NULL, 0),
(643, 296, 1, 8, NULL, NULL, 0),
(644, 296, 16, 6, NULL, NULL, 0),
(645, 296, 18, 1, NULL, NULL, 0),
(646, 297, 10, 3, 1, NULL, 0),
(647, 298, 10, 3, NULL, NULL, 0),
(648, 298, 13, 8, NULL, NULL, 0),
(649, 299, 4, 1, NULL, NULL, 0),
(650, 299, 10, 11, NULL, NULL, 0),
(651, 299, 19, 6, NULL, NULL, 0),
(652, 299, 25, 11, NULL, NULL, 0),
(653, 300, 5, 3, 1, NULL, 0),
(654, 300, 13, 5, 1, NULL, 0),
(655, 300, 21, 6, NULL, NULL, 0),
(656, 300, 27, 8, NULL, NULL, 0),
(657, 300, 33, 1, NULL, NULL, 0),
(658, 301, 14, 3, 1, NULL, 0),
(659, 302, 1, 8, NULL, NULL, 0),
(660, 302, 8, 6, NULL, NULL, 0),
(661, 302, 10, 1, NULL, NULL, 0),
(662, 303, 11, 3, 1, NULL, 0),
(663, 304, 9, 3, NULL, NULL, 0),
(664, 304, 12, 8, NULL, NULL, 0),
(665, 305, 8, 3, 1, NULL, 0),
(666, 306, 1, 8, NULL, NULL, 0),
(667, 306, 15, 6, NULL, NULL, 0),
(668, 306, 17, 1, NULL, NULL, 0),
(669, 307, 11, 3, 1, NULL, 0),
(670, 308, 5, 3, NULL, NULL, 0),
(671, 308, 7, 8, NULL, NULL, 0),
(672, 309, 6, 1, NULL, NULL, 0),
(673, 309, 11, 11, NULL, NULL, 0),
(674, 309, 21, 6, NULL, NULL, 0),
(675, 309, 29, 11, NULL, NULL, 0),
(676, 310, 5, 3, 1, NULL, 0),
(677, 310, 13, 5, 1, NULL, 0),
(678, 310, 21, 6, NULL, NULL, 0),
(679, 310, 27, 8, NULL, NULL, 0),
(680, 310, 33, 1, NULL, NULL, 0),
(681, 311, 1, 1, NULL, NULL, 0),
(682, 312, 1, 1, NULL, NULL, 0),
(683, 313, 1, 1, NULL, NULL, 0),
(684, 314, 1, 10, 1, NULL, 0),
(685, 315, 1, 10, 1, NULL, 0),
(686, 316, 16, 8, NULL, NULL, 0),
(687, 317, 16, 6, NULL, NULL, 0),
(688, 318, 10, 1, NULL, NULL, 0),
(689, 319, 1, 1, NULL, NULL, 0),
(690, 320, 1, 1, NULL, NULL, 0),
(691, 321, 1, 10, 1, NULL, 0),
(692, 322, 1, 10, 1, NULL, 0),
(693, 323, 16, 8, NULL, NULL, 0),
(694, 324, 16, 6, NULL, NULL, 0),
(695, 325, 10, 1, NULL, NULL, 0),
(696, 326, 7, 1, NULL, NULL, 0),
(697, 327, 7, 10, 1, NULL, 0),
(698, 328, 9, 8, NULL, NULL, 0),
(699, 328, 20, 6, NULL, NULL, 0),
(700, 328, 34, 1, NULL, NULL, 0),
(701, 329, 1, 1, NULL, NULL, 0),
(702, 329, 3, 11, NULL, NULL, 0),
(703, 329, 6, 10, 1, NULL, 0),
(704, 329, 9, 1, NULL, NULL, 0),
(705, 330, 7, 1, NULL, NULL, 0),
(706, 331, 7, 10, 1, NULL, 0),
(707, 332, 9, 8, NULL, NULL, 0),
(708, 332, 20, 6, NULL, NULL, 0),
(709, 332, 34, 1, NULL, NULL, 0),
(710, 333, 14, 1, NULL, NULL, 0),
(711, 334, 4, 6, NULL, NULL, 0),
(712, 335, 17, 1, NULL, NULL, 0),
(713, 336, 5, 6, NULL, NULL, 0),
(714, 338, 11, 10, 1, NULL, 0),
(715, 338, 15, 8, NULL, NULL, 0),
(716, 338, 19, 1, NULL, NULL, 0),
(717, 339, 18, 10, 1, NULL, 0),
(718, 339, 22, 8, NULL, NULL, 0),
(719, 339, 25, 1, NULL, NULL, 0),
(720, 340, 20, 10, 1, NULL, 0),
(721, 340, 24, 8, NULL, NULL, 0),
(722, 341, 1, 1, NULL, NULL, 0),
(723, 341, 25, 8, NULL, NULL, 0),
(724, 341, 56, 6, NULL, NULL, 0),
(725, 342, 2, 1, NULL, NULL, 0),
(726, 343, 2, 10, 1, NULL, 0),
(727, 344, 2, 8, NULL, NULL, 0),
(728, 344, 27, 6, NULL, NULL, 0),
(729, 344, 47, 1, NULL, NULL, 0),
(730, 344, 50, 8, NULL, NULL, 0),
(731, 344, 53, 6, NULL, NULL, 0),
(732, 345, 15, 1, NULL, NULL, 0),
(733, 346, 6, 6, NULL, NULL, 0),
(734, 347, 11, 1, NULL, NULL, 0),
(735, 348, 6, 6, NULL, NULL, 0),
(736, 349, 1, 1, NULL, NULL, 0),
(737, 349, 3, 8, NULL, NULL, 0),
(738, 349, 5, 6, NULL, NULL, 0),
(739, 350, 1, 1, NULL, NULL, 0),
(740, 350, 14, 8, NULL, NULL, 0),
(741, 350, 22, 3, 1, NULL, 0),
(742, 350, 35, 6, NULL, NULL, 0),
(743, 351, 5, 1, NULL, NULL, 0),
(744, 351, 13, 8, NULL, NULL, 0),
(745, 351, 26, 6, NULL, NULL, 0),
(746, 352, 5, 1, NULL, NULL, 0),
(747, 352, 14, 8, NULL, NULL, 0),
(748, 352, 27, 3, 1, NULL, 0),
(749, 352, 35, 6, NULL, NULL, 0),
(750, 353, 6, 1, NULL, NULL, 0),
(751, 353, 15, 8, NULL, NULL, 0),
(752, 353, 27, 6, NULL, NULL, 0),
(753, 354, 13, 1, NULL, NULL, 0),
(754, 354, 32, 8, NULL, NULL, 0),
(755, 355, 12, 10, 1, NULL, 0),
(756, 355, 29, 6, NULL, NULL, 0),
(757, 356, 14, 1, NULL, NULL, 0),
(758, 356, 33, 8, NULL, NULL, 0),
(759, 357, 13, 10, 1, NULL, 0),
(760, 357, 23, 6, NULL, NULL, 0),
(761, 358, 5, 8, NULL, NULL, 0),
(762, 358, 11, 10, 1, NULL, 0),
(763, 358, 24, 6, NULL, NULL, 0),
(764, 359, 6, 8, NULL, NULL, 0),
(765, 359, 12, 10, 1, NULL, 0),
(766, 359, 17, 6, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `canciones`
--

CREATE TABLE `canciones` (
  `id_canciones` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tonalidad_sugerida` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tiempo` int DEFAULT NULL,
  `autor` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `canciones`
--

INSERT INTO `canciones` (`id_canciones`, `nombre`, `tonalidad_sugerida`, `tiempo`, `autor`) VALUES
(1, 'Tu nombre levantaré', 'G', 0, 'desconocido'),
(3, 'El es el Rey', 'G', 0, 'desconocido'),
(4, 'La sangre de Jesús', 'C', 0, 'desconocido'),
(8, 'La única razón de mi adoración', 'C', 80, 'Danilo Montero'),
(12, 'Estamos adorándote', 'F#', 145, 'Iadoración'),
(13, 'Este pueblo que has formado', 'E', 75, 'desconocido'),
(16, 'Estamos reunidos', 'C', 68, 'desconocido'),
(17, 'El que lavó mis pies', 'G', 73, 'desconocido'),
(18, 'Gracias por la cruz', 'A', 75, 'desconocido'),
(19, 'Gracias por la cruz', 'A', 75, 'desconocido'),
(20, 'Tu amor nos monstro el camino', 'A', 67, 'desconocido'),
(21, 'Por mucho tiempo busqué', 'A', 75, 'desconocido'),
(22, 'Fue tan bello', 'D', 83, 'desconocido'),
(23, 'A Dios sea la gloria', 'F', 83, 'desconocido'),
(28, 'A Dios sea la gloria', 'F', 83, 'desconocido'),
(29, 'A Dios sea la gloria', 'F', 83, 'desconocido'),
(30, 'Sendas Dios hará', 'F', 83, 'desconocido'),
(31, 'Tu estás sentado sobre Tu trono', 'G', 70, 'desconocido'),
(32, 'Vamos a cantar', 'C', 85, 'En Espiritu y en Verdad'),
(33, 'NO ME SOLTARAS', 'B', 78, 'ROJO'),
(34, 'Oh, Luz del mundo(Vengo a adorarte)', 'E', 65, 'desconocido');

-- --------------------------------------------------------

--
-- Table structure for table `estructura_canciones`
--

CREATE TABLE `estructura_canciones` (
  `id_estructura_canciones` int NOT NULL,
  `id_canciones` int NOT NULL,
  `id_tipo_linea` int NOT NULL,
  `tipo_linea_numero` int NOT NULL,
  `posicion_estructura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estructura_canciones`
--

INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES
(1, 1, 1, 1, 1),
(3, 1, 2, 1, 3),
(4, 4, 1, 1, 1),
(5, 4, 1, 2, 2),
(6, 4, 1, 3, 3),
(7, 4, 1, 4, 4),
(8, 4, 2, 1, 5),
(9, 4, 1, 5, 6),
(10, 4, 1, 6, 7),
(11, 4, 2, 2, 8),
(12, 4, 3, 1, 12),
(13, 4, 2, 3, 13),
(14, 4, 3, 2, 14),
(23, 8, 1, 1, 1),
(24, 8, 3, 1, 2),
(25, 8, 2, 1, 3),
(26, 3, 1, 1, 1),
(43, 12, 4, 1, 1),
(44, 12, 1, 1, 2),
(45, 12, 2, 1, 3),
(46, 12, 3, 1, 4),
(47, 13, 1, 1, 1),
(48, 13, 1, 1, 2),
(49, 13, 2, 1, 3),
(56, 16, 1, 1, 1),
(57, 16, 1, 1, 2),
(58, 17, 1, 1, 1),
(59, 17, 1, 1, 2),
(60, 17, 2, 1, 3),
(61, 17, 1, 1, 4),
(62, 18, 1, 1, 1),
(63, 18, 1, 1, 2),
(64, 18, 2, 1, 3),
(65, 19, 1, 1, 1),
(66, 19, 1, 1, 2),
(67, 19, 2, 1, 3),
(68, 20, 1, 1, 1),
(69, 21, 1, 1, 1),
(70, 21, 1, 1, 2),
(71, 21, 2, 1, 3),
(72, 22, 1, 1, 1),
(73, 23, 1, 1, 1),
(74, 23, 2, 1, 2),
(75, 28, 1, 1, 1),
(76, 28, 2, 1, 2),
(77, 29, 1, 1, 1),
(78, 29, 2, 1, 2),
(79, 30, 1, 1, 1),
(80, 30, 1, 2, 2),
(81, 30, 2, 1, 3),
(82, 31, 1, 1, 1),
(83, 31, 1, 2, 2),
(84, 31, 2, 1, 3),
(85, 31, 1, 3, 4),
(86, 31, 1, 4, 5),
(87, 31, 2, 2, 6),
(88, 32, 4, 1, 1),
(89, 32, 1, 1, 2),
(90, 32, 1, 2, 3),
(91, 32, 2, 1, 4),
(92, 32, 3, 1, 5),
(93, 32, 2, 2, 6),
(94, 33, 1, 1, 1),
(95, 33, 2, 1, 2),
(96, 33, 1, 2, 3),
(97, 34, 4, 1, 1),
(98, 34, 1, 1, 2),
(99, 34, 2, 1, 3),
(100, 34, 3, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `extensiones`
--

CREATE TABLE `extensiones` (
  `id_extensiones` int NOT NULL,
  `extensiones` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `extensiones`
--

INSERT INTO `extensiones` (`id_extensiones`, `extensiones`, `nombre`) VALUES
(1, 'maj7', 'Septima mayor'),
(2, '7', 'Septima menor'),
(3, '9', 'Novena'),
(4, 'add9', 'Novena añadida'),
(5, '11', 'Onceaba');

-- --------------------------------------------------------

--
-- Table structure for table `Hermano`
--

CREATE TABLE `Hermano` (
  `id_hermano` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Hermano`
--

INSERT INTO `Hermano` (`id_hermano`, `nombre`, `apellido`, `direccion`, `fecha_nacimiento`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Dario', 'Colombo', 'Dupuy 11141', '1976-01-11', '', '2025-01-03', NULL),
(2, 'Andrés', 'Cano', 'desconocido', '1992-01-23', '', '2025-01-03', NULL),
(3, 'Ignacio', 'Salvatierra', 'desconocida', '2003-03-25', NULL, '2025-01-08', NULL),
(4, 'Cipriano Ramiro', 'BONGARRÁ', 'desconocida', '2008-09-22', NULL, '2025-01-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Hermano_Servicio`
--

CREATE TABLE `Hermano_Servicio` (
  `id_hermano_servicio` int NOT NULL,
  `id_hermano` int NOT NULL,
  `id_servicio` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Hermano_Servicio`
--

INSERT INTO `Hermano_Servicio` (`id_hermano_servicio`, `id_hermano`, `id_servicio`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 4, 2, NULL, '2025-01-08', NULL),
(2, 1, 2, NULL, '2025-01-08', NULL),
(3, 2, 1, NULL, '2025-01-08', NULL),
(4, 3, 1, NULL, '2025-01-08', NULL),
(5, 2, 3, NULL, '2025-01-10', NULL),
(6, 3, 3, NULL, '2025-01-10', NULL),
(7, 4, 3, NULL, '2025-01-10', NULL),
(10, 1, 4, NULL, '2025-01-10', NULL),
(11, 4, 4, NULL, '2025-01-10', NULL),
(12, 1, 5, NULL, '2025-01-16', NULL),
(13, 2, 6, NULL, '2025-01-16', NULL),
(14, 4, 7, NULL, '2025-01-16', NULL),
(15, 2, 8, NULL, '2025-01-16', NULL),
(16, 2, 9, NULL, '2025-01-16', NULL),
(17, 3, 10, NULL, '2025-01-16', NULL),
(18, 2, 11, NULL, '2025-01-16', NULL),
(19, 1, 12, NULL, '2025-01-16', NULL),
(20, 1, 13, NULL, '2025-01-16', NULL),
(21, 2, 14, NULL, '2025-01-16', NULL),
(22, 2, 15, NULL, '2025-01-16', NULL),
(23, 4, 15, NULL, '2025-01-16', NULL),
(24, 3, 15, NULL, '2025-01-16', NULL),
(25, 2, 16, NULL, '2025-01-16', NULL),
(26, 3, 16, NULL, '2025-01-16', NULL),
(27, 4, 16, NULL, '2025-01-16', NULL),
(28, 1, 16, NULL, '2025-01-16', NULL),
(29, 1, 17, NULL, '2025-01-17', NULL),
(30, 2, 17, NULL, '2025-01-17', NULL),
(31, 3, 17, NULL, '2025-01-17', NULL),
(35, 2, 20, NULL, '2025-01-17', NULL),
(36, 4, 20, NULL, '2025-01-17', NULL),
(37, 2, 22, NULL, '2025-01-23', NULL),
(38, 2, 23, NULL, '2025-01-23', NULL),
(39, 2, 24, NULL, '2025-01-24', NULL),
(40, 1, 28, NULL, '2025-01-29', NULL),
(41, 2, 28, NULL, '2025-01-29', NULL),
(42, 3, 28, NULL, '2025-01-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lineas_canciones`
--

CREATE TABLE `lineas_canciones` (
  `id_lineas_canciones` int NOT NULL,
  `linea_numero` int NOT NULL,
  `texto` varchar(100) NOT NULL,
  `id_estructura_canciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lineas_canciones`
--

INSERT INTO `lineas_canciones` (`id_lineas_canciones`, `linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(1, 1, 'Tu nombre levantare', 1),
(2, 2, 'Me deleito en adorarte', 1),
(3, 3, 'Te agradezco que en mi vida estés', 1),
(5, 1, 'El es el rey infinito en poder', 26),
(6, 2, 'El es el rey de los cielos', 26),
(7, 3, 'Seré para él siervo fiel', 26),
(8, 4, 'Pues mi vida compró con su amor', 26),
(9, 1, 'Un pecador', 4),
(10, 2, 'Ese es quien era yo', 4),
(11, 3, 'Miserable y perdido', 4),
(12, 4, 'Sin ninguna dirección', 4),
(13, 1, 'Un gran abismo', 5),
(14, 2, 'Nos quería separar', 5),
(15, 3, 'Pero cruzaste la distancia', 5),
(16, 4, 'Me viniste a rescatar', 5),
(17, 5, 'Ya no hay división', 6),
(18, 6, 'Un camino se abrió', 6),
(19, 7, 'Tu trono Dejaste', 6),
(20, 8, 'Por vivir en mi interior', 6),
(21, 1, 'Allí en la cruz', 7),
(22, 2, 'Cargaste mi dolor', 7),
(23, 3, 'Mi deuda Tú pagaste', 7),
(24, 4, 'Y me diste salvación', 7),
(25, 1, 'Te doy gracias por morir por mí', 8),
(26, 2, 'Te doy gracias nuevo soy en Ti', 8),
(27, 3, 'Te doy gracias tengo libertad', 8),
(28, 4, 'Tu sangre derramada el perdón me da', 8),
(29, 1, 'En mi lugar', 9),
(30, 2, 'Tu cuerpo herido fue', 9),
(31, 3, 'A la muerte derrotaste', 9),
(32, 4, 'Te levantaste con poder', 9),
(33, 1, 'Ya no hay aguijón', 10),
(34, 2, 'La vida triunfó', 10),
(35, 3, 'Y la sangre del cordero', 10),
(36, 4, 'Transformó mi corazón', 10),
(37, 1, 'Te doy gracias por morir por mí', 11),
(38, 2, 'Te doy gracias nuevo soy en Ti', 11),
(39, 3, 'Te doy gracias tengo libertad', 11),
(40, 4, 'Tu sangre derramada el perdón me da', 11),
(41, 1, 'Nada se compara', 12),
(42, 2, 'Al poder que hay en la sangre de Jesús, Jesús', 12),
(43, 3, 'Ahora somos hijos', 12),
(44, 4, 'Redimidos por la sangre de Jesús, Jesús', 12),
(45, 1, 'Te doy gracias por morir por mí', 13),
(46, 2, 'Te doy gracias nuevo soy en Ti', 13),
(47, 3, 'Te doy gracias tengo libertad', 13),
(48, 4, 'Tu sangre derramada el perdón me da', 13),
(49, 1, 'A Su nombre gloria', 14),
(50, 2, 'A Su nombre gloria', 14),
(51, 3, 'Ya mis maldades Él perdonó', 14),
(52, 4, 'A Su nombre gloria', 14),
(74, 1, 'La única razón de mi adoración', 23),
(75, 2, 'Eres Tú mi Señor', 23),
(76, 3, 'El único motivo para vivir', 23),
(77, 4, 'Eres Tú mi Jesús', 23),
(78, 1, 'La única verdad esta en Ti', 24),
(79, 2, 'Eres mi luz y mi salvación', 24),
(80, 3, 'Todo mi amor eres Tu Señor', 24),
(81, 4, 'Y por siempre te alabaré', 24),
(82, 1, 'Eres todo poderoso', 25),
(83, 2, 'Eres grande y majestuoso', 25),
(84, 3, 'Eres fuerte invencible', 25),
(85, 4, 'Y no hay nadie como Tu', 25),
(110, 1, '-------------', 43),
(111, 2, 'Estamos adorándote', 44),
(112, 3, 'Deseando hoy, tu rostro ver.', 44),
(113, 4, 'Y nada nos importa más', 44),
(114, 5, 'Que contemplar tu Majestad.', 44),
(115, 6, 'Ven a este lugar,', 45),
(116, 7, 'Llénanos de ti,', 45),
(117, 8, 'Ven Jesús te necesito más.', 45),
(118, 9, 'Sin comparación, único amor', 45),
(119, 10, 'Mi anhelo y adoración.', 45),
(120, 11, 'Yo quiero amarte más, deseo amarte más', 46),
(121, 12, 'Yo quiero amarte más, deseo amarte más', 46),
(122, 1, 'Este pueblo que has formado', 47),
(123, 2, 'hoy viene a entregar', 47),
(124, 3, 'las ofrendas de sus labios', 47),
(125, 4, 'puestas en Tu altar.', 47),
(126, 5, 'Este pueblo es Tu Iglesia', 48),
(127, 6, 'que viene a adorar', 48),
(128, 7, 'Al único, a su Amado,', 48),
(129, 8, 'al Rey de Libertad.', 48),
(130, 9, 'Y canta Hosa   nna, Gloria, Aleluya,', 49),
(131, 10, 'Oh Jesús Amado, Tu Amor me ha cautivado,', 49),
(132, 11, 'Y canta Hosa   nna, Gloria, Aleluya,', 49),
(133, 12, 'Alabanzas hoy yo traigo a tu Nombre   Je   sús', 49),
(158, 1, 'Estamos reunidos aquí señor', 56),
(159, 2, 'porque hemos conocido tu amor', 56),
(160, 3, 'traemos en nuestros labios', 56),
(161, 4, 'un nuevo cantico de loor', 56),
(162, 5, 'pues tu gloria a llenado este lugar..', 56),
(163, 6, 'Estamos reunidos aquí señor', 57),
(164, 7, 'porque hemos conocido tu amor', 57),
(165, 8, 'traemos en nuestros labios', 57),
(166, 9, 'un nuevo cantico de loor', 57),
(167, 10, 'pues tu gloria a llenado este lugar, aleluya', 57),
(168, 11, 'pues tu gloria a llenado este lugar, aleluya', 57),
(169, 12, 'pues tu gloria a llenado este lugar', 57),
(170, 1, '..Con toda Gloria y toda Majestad,', 58),
(171, 2, '..diseñador del universo.', 58),
(172, 3, '..Desde su trono eterno nos miró.', 58),
(173, 4, '..Y vino aquí como Cordero.', 58),
(174, 5, '..Entre nosotros quiso caminar', 59),
(175, 6, '..Buscando al más necesitado', 59),
(176, 7, '..Hasta a un leproso pudo abrazar', 59),
(177, 8, '..Llevó mi herida en su costado.', 59),
(178, 9, 'El que lavó mis pies Siendo Rey', 60),
(179, 10, 'En su mesa me dio de comer', 60),
(180, 11, 'Me hizo caminar sobre el mar', 60),
(181, 12, 'Al único que quiero adorar...', 60),
(182, 13, '..Con alto precio el nos valoró', 61),
(183, 14, '..Nos dio su vida y su cansancio.', 61),
(184, 15, '..El hizo al débil fuerte en su poder', 61),
(185, 16, '..Y vio en el pobre un heredero.', 61),
(186, 1, '..Gracias por la cruz, Dios', 62),
(187, 2, 'Por el precio, Tú pagar', 62),
(188, 3, 'Mi pecado y dolor,', 62),
(189, 4, 'tu amor quito', 62),
(190, 5, 'Dando gracia eternal', 62),
(191, 6, 'Gracias por tu amor, Dios', 63),
(192, 7, 'Por las manos que heri', 63),
(193, 8, 'Pués tu rio me limpió', 63),
(194, 9, 'y siento al fin', 63),
(195, 10, 'Tu perdón y salvación', 63),
(196, 11, 'Digno eres Señor', 64),
(197, 12, 'en tu trono estas', 64),
(198, 13, 'Coronado con poder', 64),
(199, 14, 'Reinas en majestad', 64),
(200, 15, 'Cristo, hijo de Dios,', 64),
(201, 16, 'exaltado rey', 64),
(202, 17, 'Moriste en la cruz en mi lugar', 64),
(203, 18, '. Digno eres señor  . .', 64),
(204, 19, '. Digno eres señor  . .', 64),
(205, 20, '. Digno eres señor  . .', 64),
(206, 1, '..Gracias por la cruz, Dios', 65),
(207, 2, 'Por el precio, Tú pagar', 65),
(208, 3, 'Mi pecado y dolor,', 65),
(209, 4, 'tu amor quito', 65),
(210, 5, 'Dando gracia eternal', 65),
(211, 6, 'Gracias por tu amor, Dios', 66),
(212, 7, 'Por las manos que heri', 66),
(213, 8, 'Pués tu rio me limpió', 66),
(214, 9, 'y siento al fin', 66),
(215, 10, 'Tu perdón y salvación', 66),
(216, 11, 'Digno eres Señor', 67),
(217, 12, 'en tu trono estas', 67),
(218, 13, 'Coronado con poder', 67),
(219, 14, 'Reinas en majestad', 67),
(220, 15, 'Cristo, hijo de Dios,', 67),
(221, 16, 'exaltado rey', 67),
(222, 17, 'Moriste en la cruz en mi lugar', 67),
(223, 18, '. Digno eres señor  . .', 67),
(224, 19, '. Digno eres señor  . .', 67),
(225, 20, '. Digno eres señor  . .', 67),
(226, 1, 'tu amor nos monstró el camino', 68),
(227, 2, 'tu poder transformó nuestras vidas .', 68),
(228, 3, 'y porque Cristo está en nosotros', 68),
(229, 4, 'te adoramos, no dejaremos .', 68),
(230, 5, 'de rendirte gloria.', 68),
(231, 1, '. Por mucho tiempo busqué,', 69),
(232, 2, '. una razón de vivir,', 69),
(233, 3, '. En medio de mil preguntas,', 69),
(234, 4, 'Tu amor me respondió.', 69),
(235, 5, '. Ahora veo la luz,', 70),
(236, 6, '. y ya no tengo temor,', 70),
(237, 7, '. Tu reino vino a mi vida,', 70),
(238, 8, 'y ahora vivo para Ti,', 70),
(239, 9, 'Cantaré de tu amor, rendiré mi corazón ante Ti,', 71),
(240, 10, 'Tú serás mi pasión, y mis pasos se guiaran por tu voz,', 71),
(241, 11, 'Mi Jesús y mi Rey, de tu gran amor cantaré.', 71),
(242, 1, '. Fue tan bello', 72),
(243, 2, '. fue amor', 72),
(244, 3, '. lo que me sucedió', 72),
(245, 4, '. con el salvador', 72),
(246, 5, '. Lo que yo era mi Jesús', 72),
(247, 6, 'en sus manos tomó.', 72),
(248, 7, 'hizo algo bello', 72),
(249, 8, '. y me transformó', 72),
(250, 1, 'A Dios sea la gloria, al mundo El dio', 73),
(251, 2, 'Al Hijo bendito que por nos murió;', 73),
(252, 3, 'Expió los pecados de quien en El cree,', 73),
(253, 4, 'Abriónos la senda hacia Dios por la fe.', 73),
(254, 5, '¡Gloria a Dios! ¡Gloria a Dios!', 74),
(255, 6, 'Que de tal modo amó', 74),
(256, 7, 'Al que lejos de El en pecado se halló;', 74),
(257, 8, 'Venid por el Hijo al gran Dios Salvador,', 74),
(258, 9, 'Y dadle la gloria por tan grande amor.', 74),
(259, 1, 'A Dios sea la gloria, al mundo El dio', 75),
(260, 2, 'Al Hijo bendito que por nos murió;', 75),
(261, 3, 'Expió los pecados de quien en El cree,', 75),
(262, 4, 'Abriónos la senda hacia Dios por la fe.', 75),
(263, 1, '¡Gloria a Dios! ¡Gloria a Dios!', 76),
(264, 2, 'Que de tal modo amó', 76),
(265, 3, 'Al que lejos de El en pecado se halló;', 76),
(266, 4, 'Venid por el Hijo al gran Dios Salvador,', 76),
(267, 5, 'Y dadle la gloria por tan grande amor.', 76),
(268, 1, 'A Dios sea la gloria, al mundo El dio,', 77),
(269, 2, 'Al Hijo bendito que por nos murió;', 77),
(270, 3, 'Expió los pecados de quien en El cree,', 77),
(271, 4, 'Abriónos la senda hacia Dios por la fe.', 77),
(272, 1, '¡Gloria a Dios! ¡Gloria a Dios!', 78),
(273, 2, 'Que de tal modo amó.', 78),
(274, 3, 'Al que lejos de El en pecado se halló;', 78),
(275, 4, 'Venid por el Hijo al gran Dios Salvador,', 78),
(276, 5, 'Y dadle la gloria por tan grande amor.', 78),
(277, 1, 'Sendas Dios hará,', 79),
(278, 2, 'donde piensas que no hay;', 79),
(279, 3, 'El obra de maneras que.', 79),
(280, 4, 'no podemos entender.', 79),
(281, 1, 'El me guiará,', 80),
(282, 2, 'a su lado estaré;', 80),
(283, 3, 'amor y fuerzas me  dará,', 80),
(284, 4, 'un camino hará', 80),
(285, 5, 'donde no lo hay.', 80),
(286, 1, 'Por caminos en la soledad, me guiará', 81),
(287, 2, 'Y agua en el desierto encontraré.', 81),
(288, 3, 'La tierra pasará,', 81),
(289, 4, 'Su Palabra eterna es.', 81),
(290, 5, 'El hará algo nuevo hoy.', 81),
(291, 1, '..Tu estás sentado', 82),
(292, 2, '..sobre Tu trono', 82),
(293, 3, 'siempre reinando', 82),
(294, 4, 'Soberano.', 82),
(295, 1, '..Ángeles cantan', 83),
(296, 2, '..pueblos te alaban', 83),
(297, 3, 'Dios reunido', 83),
(298, 4, 'con su pueblo.', 83),
(299, 1, 'Oh Alfa, Omega, Cristo Santo.', 84),
(300, 2, 'Oh ven, Oh ven, Oh ven Señor Jesús.', 84),
(301, 1, '..Con muchas ansias', 85),
(302, 2, '..esperamos', 85),
(303, 3, 'ese gran día', 85),
(304, 4, 'de tu vuelta', 85),
(305, 1, 'Y subiremos', 86),
(306, 2, '..a estar contigo', 86),
(307, 3, 'para siempre', 86),
(308, 4, 'aleluya.', 86),
(309, 1, 'Maranata, Oh Señor, Cristo, Santo', 87),
(310, 2, 'Oh ven, oh ven, oh ven Señor Jesús.', 87),
(311, 1, '.', 88),
(312, 1, 'Amamos todo de ti', 89),
(313, 2, 'Cielo y tierra te adoran', 89),
(314, 3, 'Los reinos se rinden', 89),
(315, 4, 'Hijo de Dios', 89),
(316, 5, 'Tú eres por quien', 89),
(317, 6, 'Tú eres por quien', 89),
(318, 7, 'Vivimos hoy', 89),
(319, 1, 'Tú eres quien nos liberta', 90),
(320, 2, 'Tú eres la Luz que guía', 90),
(321, 3, 'Como un fuego ardiente', 90),
(322, 4, 'Hijo de Dios', 90),
(323, 5, 'Tú eres por quien', 90),
(324, 6, 'Tú eres por quien', 90),
(325, 7, 'Vivimos hoy', 90),
(326, 1, 'Vamos a cantar con la música del cielo', 91),
(327, 2, 'Vamos a cantar alegres porque escuchas', 91),
(328, 3, 'Cuando cantamos para exaltar tu nombre', 91),
(329, 1, '. ,  ,  ,', 92),
(330, 1, 'Vamos a cantar con la música del cielo', 93),
(331, 2, 'Vamos a cantar alegres porque escuchas', 93),
(332, 3, 'Cuando cantamos para exaltar tu nombre', 93),
(333, 1, 'Aunque yo este en valle de la muerte y dolor,', 94),
(334, 2, 'tu amor me quita todo temor.', 94),
(335, 3, 'Y si llego a estar en el centro de la tempestad,', 94),
(336, 4, 'no dudaré por que estas aquí', 94),
(337, 5, 'puente:', 94),
(338, 6, 'Y no temeré  del mal,', 94),
(339, 7, 'pues mi Dios conmigo esta', 94),
(340, 8, 'Y si Dios conmi...go esta,', 94),
(341, 9, '¿de quien temeré?, ¿de quien temeré?', 94),
(342, 1, 'No, no, no me soltaras, en la calma o la tormenta,', 95),
(343, 2, 'No, no, no me soltaras, en lo alto en lo bajo', 95),
(344, 3, 'No, no, no me soltaras, Dios tú nunca me dejarás_____', 95),
(345, 1, 'Puedo ver la luz que se acerca al que busca de ti,', 96),
(346, 2, 'Gloriosa luz cual otra no hay.', 96),
(347, 3, 'Y terminarán los problemas mientras llega el fin,', 96),
(348, 4, 'Viviremos conociéndote a ti.', 96),
(349, 1, '. . .', 97),
(350, 1, 'Oh, luz del mundo bajaste a la oscuridad', 98),
(351, 2, 'mis ojos abriste, puedo ver.', 98),
(352, 3, 'Belleza que causa que mi ser te adore.', 98),
(353, 4, 'Esperanza de vida hay en ti.', 98),
(354, 1, 'Vengo a adorarte, vengo a postrarme', 99),
(355, 2, 'vengo a decir que eres mi Dios.', 99),
(356, 3, 'Eternamente bello, eternamente digno', 99),
(357, 4, 'Tan maravilloso para mi.', 99),
(358, 1, 'Nunca sabré cuánto costó', 100),
(359, 2, 'ver mis pecados en la cruz', 100);

-- --------------------------------------------------------

--
-- Table structure for table `Ministerio`
--

CREATE TABLE `Ministerio` (
  `id_ministerio` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Ministerio`
--

INSERT INTO `Ministerio` (`id_ministerio`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Alabanza & Adoración', 'Ministerio de música', '2020-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Responsabilidad`
--

CREATE TABLE `Responsabilidad` (
  `id_responsabilidad` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Responsabilidad`
--

INSERT INTO `Responsabilidad` (`id_responsabilidad`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Director Musical', '', '2025-01-03', NULL),
(2, 'Músico', '', '2025-01-03', NULL),
(3, 'Director vocal', '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Responsabilidad_Hermano_Ministerio`
--

CREATE TABLE `Responsabilidad_Hermano_Ministerio` (
  `id_responsabilidad_hermano_ministerio` int NOT NULL,
  `id_ministerio` int NOT NULL,
  `id_hermano` int NOT NULL,
  `id_responsabilidad` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Responsabilidad_Hermano_Ministerio`
--

INSERT INTO `Responsabilidad_Hermano_Ministerio` (`id_responsabilidad_hermano_ministerio`, `id_ministerio`, `id_hermano`, `id_responsabilidad`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(3, 1, 1, 1, '', '2025-01-03', NULL),
(4, 1, 2, 1, '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Servicio`
--

CREATE TABLE `Servicio` (
  `id_servicio` int NOT NULL,
  `id_tipo_servicio` int NOT NULL,
  `ff_programada` datetime NOT NULL,
  `ff_prueba` datetime DEFAULT NULL,
  `duracion_servicio` int DEFAULT NULL,
  `id_lugar_servicio` int DEFAULT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Servicio`
--

INSERT INTO `Servicio` (`id_servicio`, `id_tipo_servicio`, `ff_programada`, `ff_prueba`, `duracion_servicio`, `id_lugar_servicio`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 3, '2025-01-25 20:30:00', NULL, NULL, NULL, 'Reunión de jovenes de prueba', '2025-01-08', NULL),
(2, 1, '2025-01-19 09:30:00', NULL, NULL, NULL, 'reunion de cena de prueba', '2025-01-08', NULL),
(3, 3, '2025-01-23 00:00:00', NULL, NULL, NULL, NULL, '2025-01-10', '2025-01-10'),
(4, 2, '2025-02-03 00:00:00', NULL, NULL, NULL, NULL, '2025-01-10', '2025-01-16'),
(5, 2, '2025-01-14 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(6, 2, '2025-01-28 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(7, 2, '2025-02-04 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(8, 3, '2025-02-05 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', '2025-01-16'),
(9, 2, '2025-01-27 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', '2025-01-16'),
(10, 3, '2025-01-17 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(11, 1, '2025-01-20 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(12, 2, '2025-01-28 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(13, 2, '2025-01-28 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(14, 3, '2024-12-31 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', '2025-01-16'),
(15, 2, '2025-01-28 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', NULL),
(16, 2, '2025-03-18 00:00:00', NULL, NULL, NULL, NULL, '2025-01-16', '2025-01-16'),
(17, 1, '2025-01-30 16:30:30', '2025-01-30 14:00:00', 120, 5, NULL, '2025-01-17', NULL),
(20, 1, '2025-11-30 16:30:30', '2025-11-30 14:00:00', 120, 5, NULL, '2025-01-17', NULL),
(21, 1, '2025-01-19 09:30:00', '2025-01-19 08:15:00', 90, 1, NULL, '2025-01-18', NULL),
(22, 1, '2025-01-25 16:00:00', '2025-01-25 14:00:00', 120, 1, NULL, '2025-01-23', NULL),
(23, 1, '2025-01-26 19:00:00', '2025-01-26 17:00:00', 120, 1, NULL, '2025-01-23', NULL),
(24, 2, '2025-01-22 19:30:00', '2025-01-22 20:00:00', 60, 1, NULL, '2025-01-24', NULL),
(25, 1, '2025-01-27 09:30:00', NULL, 90, 1, NULL, '2025-01-26', NULL),
(27, 1, '2025-01-28 19:16:10', NULL, 90, 1, NULL, '2025-01-26', NULL),
(28, 1, '2025-01-20 16:30:30', '2025-01-30 14:00:00', 120, 5, NULL, '2025-01-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Servicio_Cancion`
--

CREATE TABLE `Servicio_Cancion` (
  `id_servicio_cancion` int NOT NULL,
  `id_servicio` int NOT NULL,
  `tonalidad` int NOT NULL,
  `id_canciones` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Servicio_Cancion`
--

INSERT INTO `Servicio_Cancion` (`id_servicio_cancion`, `id_servicio`, `tonalidad`, `id_canciones`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 2, 1, 4, NULL, '2025-01-08', NULL),
(2, 2, 1, 3, NULL, '2025-01-08', NULL),
(3, 1, 1, 1, NULL, '2025-01-08', NULL),
(4, 1, 1, 8, NULL, '2025-01-08', NULL),
(5, 3, 1, 1, NULL, '2025-01-10', NULL),
(6, 3, 1, 3, NULL, '2025-01-10', NULL),
(7, 3, 1, 4, NULL, '2025-01-10', NULL),
(10, 4, 1, 1, NULL, '2025-01-10', NULL),
(11, 4, 1, 4, NULL, '2025-01-10', NULL),
(12, 5, 1, 8, NULL, '2025-01-16', NULL),
(14, 7, 1, 8, NULL, '2025-01-16', NULL),
(19, 11, 1, 4, NULL, '2025-01-16', NULL),
(22, 14, 1, 4, NULL, '2025-01-16', NULL),
(24, 15, 1, 4, NULL, '2025-01-16', NULL),
(25, 15, 1, 1, NULL, '2025-01-16', NULL),
(27, 16, 1, 8, NULL, '2025-01-16', NULL),
(28, 16, 1, 1, NULL, '2025-01-16', NULL),
(29, 17, 5, 1, NULL, '2025-01-17', NULL),
(30, 17, 8, 3, NULL, '2025-01-17', NULL),
(32, 20, 8, 13, NULL, '2025-01-17', NULL),
(40, 20, 5, 12, NULL, '2025-01-18', NULL),
(41, 20, 8, 8, NULL, '2025-01-18', NULL),
(42, 21, 8, 13, NULL, '2025-01-18', NULL),
(43, 21, 4, 16, NULL, '2025-01-18', NULL),
(44, 21, 11, 17, NULL, '2025-01-18', NULL),
(45, 21, 9, 23, NULL, '2025-01-18', NULL),
(46, 21, 1, 18, NULL, '2025-01-18', NULL),
(47, 21, 1, 20, NULL, '2025-01-18', NULL),
(48, 21, 1, 21, NULL, '2025-01-18', NULL),
(49, 21, 6, 22, NULL, '2025-01-18', NULL),
(50, 22, 8, 23, NULL, '2025-01-23', NULL),
(51, 23, 9, 12, NULL, '2025-01-23', NULL),
(52, 24, 8, 23, NULL, '2025-01-24', NULL),
(53, 25, 11, 28, NULL, '2025-01-26', NULL),
(54, 27, 11, 29, NULL, '2025-01-26', NULL),
(55, 27, 8, 30, NULL, '2025-01-27', NULL),
(56, 27, 1, 31, NULL, '2025-01-27', NULL),
(58, 27, 1, 32, NULL, '2025-01-28', NULL),
(59, 28, 5, 1, NULL, '2025-01-29', NULL),
(60, 28, 8, 3, NULL, '2025-01-29', NULL),
(62, 27, 7, 34, NULL, '2025-01-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipos_linea`
--

CREATE TABLE `tipos_linea` (
  `id` int NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipos_linea`
--

INSERT INTO `tipos_linea` (`id`, `descripcion`) VALUES
(1, 'ESTROFA'),
(2, 'CORO'),
(3, 'PUENTE'),
(4, 'INTRODUCCION');

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Servicio`
--

CREATE TABLE `Tipo_Servicio` (
  `id_tipo_servicio` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Tipo_Servicio`
--

INSERT INTO `Tipo_Servicio` (`id_tipo_servicio`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Santa Cena', '', '2025-01-03', NULL),
(2, 'Reunión de Oración', '', '2025-01-03', NULL),
(3, 'Reunión de jóvenes', '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tonalidades`
--

CREATE TABLE `tonalidades` (
  `grado` int NOT NULL,
  `codigo` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tonalidades`
--

INSERT INTO `tonalidades` (`grado`, `codigo`) VALUES
(1, 'A'),
(2, 'A#'),
(3, 'B'),
(4, 'C'),
(5, 'C#'),
(6, 'D'),
(7, 'D#'),
(8, 'E'),
(9, 'F'),
(10, 'F#'),
(11, 'G'),
(12, 'G#'),
(13, 'A'),
(14, 'A#'),
(15, 'B'),
(16, 'C'),
(17, 'C#'),
(18, 'D'),
(19, 'D#'),
(20, 'E'),
(21, 'F'),
(22, 'F#'),
(23, 'G'),
(24, 'G#');

-- --------------------------------------------------------

--
-- Table structure for table `triadas`
--

CREATE TABLE `triadas` (
  `id_triadas` int NOT NULL,
  `triadas` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `triadas`
--

INSERT INTO `triadas` (`id_triadas`, `triadas`, `nombre`) VALUES
(1, 'm', 'Menor'),
(2, 'dis', 'Disminuido'),
(3, 'aum', 'Aumentado'),
(4, 'sus2', 'Sustituida por segunda'),
(5, 'sus4', 'Sustituida por cuarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  ADD PRIMARY KEY (`id_acordes_linea`),
  ADD KEY `id_lineas_canciones` (`id_lineas_canciones`),
  ADD KEY `id_triadas` (`id_triadas`),
  ADD KEY `id_extensiones` (`id_extensiones`);

--
-- Indexes for table `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id_canciones`);

--
-- Indexes for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  ADD PRIMARY KEY (`id_estructura_canciones`),
  ADD KEY `id_tipo_linea` (`id_tipo_linea`),
  ADD KEY `id_canciones` (`id_canciones`);

--
-- Indexes for table `extensiones`
--
ALTER TABLE `extensiones`
  ADD PRIMARY KEY (`id_extensiones`);

--
-- Indexes for table `Hermano`
--
ALTER TABLE `Hermano`
  ADD PRIMARY KEY (`id_hermano`);

--
-- Indexes for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  ADD PRIMARY KEY (`id_hermano_servicio`),
  ADD KEY `id_hermano` (`id_hermano`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indexes for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  ADD PRIMARY KEY (`id_lineas_canciones`),
  ADD KEY `id_estructura_canciones` (`id_estructura_canciones`);

--
-- Indexes for table `Ministerio`
--
ALTER TABLE `Ministerio`
  ADD PRIMARY KEY (`id_ministerio`);

--
-- Indexes for table `Responsabilidad`
--
ALTER TABLE `Responsabilidad`
  ADD PRIMARY KEY (`id_responsabilidad`);

--
-- Indexes for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  ADD PRIMARY KEY (`id_responsabilidad_hermano_ministerio`),
  ADD KEY `id_ministerio` (`id_ministerio`),
  ADD KEY `id_hermano` (`id_hermano`),
  ADD KEY `id_responsabilidad` (`id_responsabilidad`);

--
-- Indexes for table `Servicio`
--
ALTER TABLE `Servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_tipo_servicio` (`id_tipo_servicio`);

--
-- Indexes for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  ADD PRIMARY KEY (`id_servicio_cancion`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_canciones` (`id_canciones`);

--
-- Indexes for table `tipos_linea`
--
ALTER TABLE `tipos_linea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indexes for table `tonalidades`
--
ALTER TABLE `tonalidades`
  ADD PRIMARY KEY (`grado`);

--
-- Indexes for table `triadas`
--
ALTER TABLE `triadas`
  ADD PRIMARY KEY (`id_triadas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  MODIFY `id_acordes_linea` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT for table `canciones`
--
ALTER TABLE `canciones`
  MODIFY `id_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  MODIFY `id_estructura_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `extensiones`
--
ALTER TABLE `extensiones`
  MODIFY `id_extensiones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Hermano`
--
ALTER TABLE `Hermano`
  MODIFY `id_hermano` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  MODIFY `id_hermano_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  MODIFY `id_lineas_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT for table `Ministerio`
--
ALTER TABLE `Ministerio`
  MODIFY `id_ministerio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Responsabilidad`
--
ALTER TABLE `Responsabilidad`
  MODIFY `id_responsabilidad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  MODIFY `id_responsabilidad_hermano_ministerio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Servicio`
--
ALTER TABLE `Servicio`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  MODIFY `id_servicio_cancion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tipos_linea`
--
ALTER TABLE `tipos_linea`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  MODIFY `id_tipo_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `triadas`
--
ALTER TABLE `triadas`
  MODIFY `id_triadas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  ADD CONSTRAINT `acordes_linea_ibfk_1` FOREIGN KEY (`id_lineas_canciones`) REFERENCES `lineas_canciones` (`id_lineas_canciones`) ON DELETE CASCADE,
  ADD CONSTRAINT `acordes_linea_ibfk_2` FOREIGN KEY (`id_triadas`) REFERENCES `triadas` (`id_triadas`),
  ADD CONSTRAINT `acordes_linea_ibfk_3` FOREIGN KEY (`id_extensiones`) REFERENCES `extensiones` (`id_extensiones`);

--
-- Constraints for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  ADD CONSTRAINT `estructura_canciones_ibfk_1` FOREIGN KEY (`id_tipo_linea`) REFERENCES `tipos_linea` (`id`),
  ADD CONSTRAINT `estructura_canciones_ibfk_2` FOREIGN KEY (`id_canciones`) REFERENCES `canciones` (`id_canciones`);

--
-- Constraints for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  ADD CONSTRAINT `Hermano_Servicio_ibfk_1` FOREIGN KEY (`id_hermano`) REFERENCES `Hermano` (`id_hermano`),
  ADD CONSTRAINT `Hermano_Servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`);

--
-- Constraints for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  ADD CONSTRAINT `lineas_canciones_ibfk_2` FOREIGN KEY (`id_estructura_canciones`) REFERENCES `estructura_canciones` (`id_estructura_canciones`);

--
-- Constraints for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_1` FOREIGN KEY (`id_ministerio`) REFERENCES `Ministerio` (`id_ministerio`),
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_2` FOREIGN KEY (`id_hermano`) REFERENCES `Hermano` (`id_hermano`),
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_3` FOREIGN KEY (`id_responsabilidad`) REFERENCES `Responsabilidad` (`id_responsabilidad`);

--
-- Constraints for table `Servicio`
--
ALTER TABLE `Servicio`
  ADD CONSTRAINT `Servicio_ibfk_1` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `Tipo_Servicio` (`id_tipo_servicio`);

--
-- Constraints for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  ADD CONSTRAINT `Servicio_Cancion_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`),
  ADD CONSTRAINT `Servicio_Cancion_ibfk_2` FOREIGN KEY (`id_canciones`) REFERENCES `canciones` (`id_canciones`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
