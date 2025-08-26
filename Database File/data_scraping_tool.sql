-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 26, 2025 at 01:49 PM
-- Server version: 9.1.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_scraping_tool`
--

-- --------------------------------------------------------

--
-- Table structure for table `library_posts`
--

DROP TABLE IF EXISTS `library_posts`;
CREATE TABLE IF NOT EXISTS `library_posts` (
  `post_id` int NOT NULL,
  `library_id` int NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `library_posts`
--

INSERT INTO `library_posts` (`post_id`, `library_id`, `message`, `priority`) VALUES
(1, 1, 'Test 1', 1),
(2, 1, 'Test 2', 2),
(3, 1, 'Test 3', 3),
(4, 1, 'Test 4', 4),
(5, 2, 'Test 5', 1),
(6, 2, 'Test 6', 2),
(7, 2, 'Test 7', 3),
(8, 2, 'Test 8', 4),
(9, 3, 'Test 9', 1),
(10, 3, 'Test 10', 2),
(11, 4, 'Test 11', 1),
(12, 4, 'Test 12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `url_previews`
--

DROP TABLE IF EXISTS `url_previews`;
CREATE TABLE IF NOT EXISTS `url_previews` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(800) NOT NULL,
  `title` varchar(600) NOT NULL,
  `description` text,
  `image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `url_previews`
--

INSERT INTO `url_previews` (`id`, `url`, `title`, `description`, `image`, `created_at`) VALUES
(3, 'https://www.justdial.com/Surat/Pro-Start-Me-Technologies-Pvt-Ltd-Majura-Gate/0261PX261-X261-230310191811-J1Z7_BZDET', 'Pro Start Me Technologies Pvt. Ltd, Majura Gate, Surat - Justdial', 'Pro Start Me Technologies Pvt. Ltd in Majura Gate,Surat listed under  in Surat. Rated 4.1 based on 6 Customer Reviews and Ratings with 19 Photos. Visit Justdial for Address, Contact Number, Reviews &amp; Ratings, Photos, Maps of Pro Start Me Technologies Pvt. Ltd, Majura Gate, Surat.', 'https://content.jdmagicbox.com/comp/surat/z7/0261px261.x261.230310191811.j1z7/catalogue/pro-start-me-technologies-pvt-ltd-surat-2jikj85p7t.jpg', '2025-08-26 11:41:17'),
(4, 'https://prostart.me/new-home-page/team-2/', 'Team &#8211; Pro Start Me', '', '', '2025-08-26 11:42:18'),
(5, 'https://prostart.me/', 'Pro Start Me &#8211; Startups As A Service', '', '', '2025-08-26 11:42:32'),
(6, 'https://recurpost.com/blog/google-my-business-listing/', '26 Tips To Rank Higher in Google My Business Listing in 2025', 'Learn 26 actionable tips to improve your Google My Business ranking and boost local visibility. Optimize your profile to appear higher in Google Maps and search results.', 'https://recurpost.com/wp-content/uploads/2025/01/Google-My-Business-Ranking_-26-Tips-to-Rank-Higher-in-2025.png', '2025-08-26 11:43:07'),
(7, 'https://warrenaverett.com/insights/alabama-payroll-tax-for-out-of-state-workers/', 'New Alabama Law Changes Payroll Tax Rules for Out-of-State Worker', 'A new Alabama law will exempt certain out-of-state employees from state income tax and payroll withholding if they work in Alabama for 30 days or less in a year and meet specific requirements.', 'https://warrenaverett.com/wp-content/uploads/Alabama-Payroll-Tax-Image.gif', '2025-08-26 11:43:21'),
(8, 'https://warrenaverett.com/insights/one-big-beautiful-bill-compensation-benefits/', 'The One Big Beautiful Bill Breakdown: Employers’ Tax Treatment of Compensation and Benefits', 'The One Big Beautiful Bill has updated several tax rules for compensation and benefits, adding new deductions and expanding credits for employers.', 'https://warrenaverett.com/wp-content/uploads/One-Big-Beautiful-Bill-compensation-and-benefits-image.gif', '2025-08-26 11:43:58'),
(9, 'https://warrenaverett.com/insights/one-big-beautiful-bill-qualified-small-business-stock/', 'The One Big Beautiful Bill Breakdown: Qualified Small Business Stock Under Section1202', 'The One Big Beautiful Bill made significant changes to the Section 1202 rules for Qualified Small Business Stock, providing significant tax planning opportunities for both investors and businesses.', 'https://warrenaverett.com/wp-content/uploads/Section-1202.gif', '2025-08-26 11:44:09'),
(10, 'https://warrenaverett.com/insights/one-big-beautiful-bill-opportunity-zones/', 'The One Big Beautiful Bill Breakdown: Opportunity Zones 2.0', 'With the One Big Beautiful Bill (OBBB), Congress has finally passed Opportunity Zones 2.0.', 'https://warrenaverett.com/wp-content/uploads/Opportunity-zone-header.gif', '2025-08-26 11:44:28'),
(11, 'https://warrenaverett.com/insights/one-big-beautiful-bill-casualty-loss/', 'The One Big Beautiful Bill Breakdown: Natural Disasters and Theft Losses', 'The One Big Beautiful Bill has expanded tax relief for casualty losses.', 'https://warrenaverett.com/wp-content/uploads/One-Big-Beautiful-Bill-Casualty-Loss-Image.gif', '2025-08-26 11:44:37'),
(12, 'https://warrenaverett.com/insights/one-big-beautiful-bill-salt-cap-pte-payments/', 'The One Big Beautiful Bill Breakdown: State and Local Tax Individual Deductions and Pass-Through Entity Tax Payments', 'The One Big Beautiful Bill has temporarily raised the state and local tax (SALT) deduction cap for many taxpayers, while preserving the benefits of pass-through entity (PTE) tax payments.', 'https://warrenaverett.com/wp-content/uploads/SALT-Cap-1.gif', '2025-08-26 11:44:43'),
(13, 'https://warrenaverett.com/insights/one-big-beautiful-bill-business-tax-credits/', 'The One Big Beautiful Bill Breakdown: Business Tax Credits', 'The One Big Beautiful Bill has brought significant changes to the U.S. tax code, particularly in the area of business tax credits.', 'https://warrenaverett.com/wp-content/uploads/Tax-Credit-OBBB-Header-1.gif', '2025-08-26 11:44:56'),
(14, 'https://warrenaverett.com/insights/one-big-beautiful-bill-business-tax-credits/', 'The One Big Beautiful Bill Breakdown: Business Tax Credits', 'The One Big Beautiful Bill has brought significant changes to the U.S. tax code, particularly in the area of business tax credits.', 'https://warrenaverett.com/wp-content/uploads/Tax-Credit-OBBB-Header-1.gif', '2025-08-26 11:47:48'),
(15, 'https://recurpost.com/blog/google-my-business-listing/', '26 Tips To Rank Higher in Google My Business Listing in 2025', 'Learn 26 actionable tips to improve your Google My Business ranking and boost local visibility. Optimize your profile to appear higher in Google Maps and search results.', 'https://recurpost.com/wp-content/uploads/2025/01/Google-My-Business-Ranking_-26-Tips-to-Rank-Higher-in-2025.png', '2025-08-26 12:07:44'),
(16, 'https://warrenaverett.com/insights/one-big-beautiful-bill-business-tax-credits/', 'The One Big Beautiful Bill Breakdown: Business Tax Credits', 'The One Big Beautiful Bill has brought significant changes to the U.S. tax code, particularly in the area of business tax credits.', 'https://warrenaverett.com/wp-content/uploads/Tax-Credit-OBBB-Header-1.gif', '2025-08-26 13:17:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
