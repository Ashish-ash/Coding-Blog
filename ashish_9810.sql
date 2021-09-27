-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2021 at 03:48 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ashish_9810`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `date`, `phone_num`, `mes`, `email`) VALUES
(1, 'Ashish', '2021-06-01 19:34:40', '9810125073', 'You are best', 'ak9810125073@gmail.com'),
(2, 'Ashish Kumar', '2021-09-01 12:30:38', '981011', 'Hi wassup!', 'ak9810125073@gmail.com'),
(5, 'Jatin', '2021-09-01 12:31:42', '981011', 'Hi', 'JK@gmail.com'),
(6, 'Ashish Kumar', '2021-09-02 11:03:05', '981011', 'Hello', 'ak9810125073@gmail.com'),
(7, 'Ashish Kumar', '2021-09-02 11:04:28', '+919810125073', 'Hello', 'AK5474264@gmail.com'),
(8, 'Ashish Kumar', '2021-09-02 11:09:10', '+919810125073', 'Hello', 'ak9810125073@gmail.com'),
(9, 'Ashish Kumar', '2021-09-02 11:12:42', '+919810125073', 'Hello', 'ak9810125073@gmail.com'),
(10, 'Ashish Kumar', '2021-09-02 11:15:59', '981011', 'Ashish', 'ak9810125073@gmail.com'),
(11, 'Ashish Kumar', '2021-09-02 11:26:45', '981011', 'Hi', 'ak9810125073@gmail.com'),
(12, 'Ashish Kumar', '2021-09-02 11:32:21', '555', 'Hello', 'ak9810125073@gmail.com'),
(13, '\\', '2021-09-02 11:37:57', '', '', ''),
(14, '', '2021-09-02 11:38:03', '', '', ''),
(15, 'Ashish Kumar', '2021-09-02 11:42:41', '981011', 'Hi', 'ak9810125073@gmail.com'),
(16, 'Ashish Kumar', '2021-09-02 11:55:49', '981011', 'ukn', 'ak9810125073@gmail.com'),
(17, 'Ashish Kumar', '2021-09-02 11:59:56', '234', 'Hi', 'ak9810125073@gmail.com'),
(18, 'Ashish Kumar', '2021-09-02 12:03:18', '123', 'kk', 'ak9810125073@gmail.com'),
(19, 'Ashish Kumar', '2021-09-03 11:23:34', '9810125073', 'Hi I am Ashish', 'ak9810125073@gmail.com'),
(20, 'Ashish Kumar', '2021-09-27 18:22:34', 'kjbre', 'jkbkrejk', 'vanshugupta1213@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `Content` text NOT NULL,
  `Slug` varchar(30) NOT NULL,
  `Date` date DEFAULT current_timestamp(),
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `Content`, `Slug`, `Date`, `tagline`) VALUES
(1, 'This is My First Blog', 'It all starts with the first blog post.\r\n\r\nI know… I’ve been through that stage. You’ve got mixed feelings:\r\n\r\nA bit of euphoria:\r\n\r\nYou picture yourself as a successful blogger, and you believe that blogging is everything you need. But as soon as you start writing your first blog post, your feelings change. You develop:\r\n\r\nConfusion. Fear:\r\n\r\nYou feel stuck, and probably a bit depressed.\r\n\r\nI decided to write this blog post specifically for you.\r\n\r\nTo help you find your way and do only the things you need to do in order to achieve success.', 'first-post', '2021-09-27', 'Just read it once'),
(2, 'Entrepreneur', 'Entrepreneurship is the creation or extraction of value.[1][2][3] With this definition, entrepreneurship is viewed as change, generally entailing risk beyond what is normally encountered in starting a business, which may include other values than simply economic ones.\r\n\r\nMore narrow definitions have described entrepreneurship as the process of designing, launching and running a new business, which is often similar to a small business, or as the \"capacity and willingness to develop, organize and manage a business venture along with any of its risks to make a profit.\"[4] The people who create these businesses are often referred to as entrepreneurs.[5][6] While definitions of entrepreneurship typically focus on the launching and running of businesses, due to the high risks involved in launching a start-up, a significant proportion of start-up businesses have to close due to \"lack of funding, bad business decisions, government policies, an economic crisis, lack of market demand, or a combination of all of these.\"[7]\r\n\r\nIn the field of economics, the term entrepreneur is used for an entity which has the ability to translate inventions or technologies into products and services.[8] In this sense, entrepreneurship describes activities on the part of both established firms and new businesses.\r\nAs an academic field, entrepreneurship accommodates different schools of thought. It has been studied within disciplines such as economics, sociology and economic history.[9][10] Some view entrepreneurship as allocated to the entrepreneur. These scholars tend to focus on what the entrepreneur does and what traits that an entrepreneur has (see for example the text under the headings Elements below). This is sometimes referred to as the functionalistic approach to entrepreneurship. Others deviate from the individualistic perspective to turn the spotlight on the entrepreneurial process and immerse in the interplay between agency and context. This approach is sometimes referred to as the processual approach,[11] or the contextual turn/approach to entrepreneurship.', 'second-post', '2021-09-04', 'Dreams on the way !..'),
(3, 'Careers', 'Historic changes in careers\r\nFor a pre-modernist notion of \"career\", compare cursus honorum.\r\n\r\nBy the late 20th century, a wide range of variations (especially in the range of potential professions) and more widespread education had allowed it to become possible to plan (or design) a career: In this respect the careers of the career counselor and of the career advisor have grown up. It is also not uncommon for adults in the late 20th/early 21st centuries to have dual or multiple careers, either sequentially or concurrently. Thus, professional identities have become hyphenated or hybridized to reflect this shift in work ethic. Economist Richard Florida notes this trend generally and more specifically among the \"creative class\".\r\n\r\nCareer management\r\nCareer management or career development describes the active and purposeful management of a career by an individual. Ideas of what comprise \"career management skills\" are described by the Blueprint model (in the United States, Canada, Australia, Scotland, and England[6])[7] and the Seven C\'s of Digital Career Literacy (specifically relating to the Internet skills).[8]\r\n\r\nKey skills include the ability to reflect on one\'s current career, research the labour market, determine whether education is necessary, find openings, and make career changes.[citation needed]\r\n\r\nCareer choice\r\nFurther information: List of largest employers and List of professions\r\nAccording to Behling and others, an individual\'s decision to join a firm may depend on any of the three factors viz. objective factor, subjective factor and critical contact.[9]\r\n\r\nObjective factor theory assumes that the applicants are rational. The choice, therefore, is exercised after an objective assessment of the tangible benefits of the job. Factors may include the salary, other benefits, location, opportunities for career advancement, etc.\r\nSubjective factor theory suggests that decision making is dominated by social and psychological factors. The status of the job, reputation of the organization, and other similar factors plays an important role.\r\nCritical contact theory advances the idea that a candidate\'s observations while interacting with the organization plays a vital role in decision making. For example, how the recruiter keeps in touch with the candidate, the promptness of response and similar factors are important. This theory is more valid with experienced professionals.\r\nThese theories assume that candidates have a free choice of employers and careers. In reality, the scarcity of jobs and strong competition for desirable jobs severely skews the decision-making process. In many markets, employees work particular careers simply because they were forced to accept whatever work was available to them. Additionally, Ott-Holland and colleagues found that culture can have a major influence on career choice, depending on the type of culture.[10]\r\n\r\nWhen choosing a career that\'s best for you, according to US News, there are multiple things to consider. Some of those include: natural talents, work style, social interaction, work–life balance, whether or not you are looking to give back, whether you are comfortable in the public eye, dealing with stress or not, and finally, how much money you want to make. If choosing a career feels like too much pressure, here\'s another option: pick a path that feels right today by making the best decision you can, and know that you can change your mind in the future. In today\'s workplace, choosing a career doesn\'t necessarily mean you have to stick with that line of work for your entire life. Make a smart decision, and plan to re-evaluate down the line based on your long-term objectives.[11]\r\n\r\nCareer (occupation) changing\r\nChanging occupation is an important aspect of career and career management. Over a lifetime, both the individual and the labour market will change; it is to be expected that many people will change occupations during their lives. Data collected by the U.S. Bureau of Labor Statistics through the National Longitudinal Survey of Youth in 1979 showed that individuals between the ages of 18 and 38 will hold more than 10 jobs.[12]\r\n\r\nThere are various reasons why people might want to change their careers. Sometimes career change can come as the result of a long-anticipated layoff, while other times it can occur unexpectedly and without warning.[13]\r\n\r\nA survey conducted by Right Management[14] suggests the following reasons for career changing.\r\n\r\nThe downsizing or the restructuring of an organization (54%).\r\nNew challenges or opportunities that arise (30%).\r\nPoor or ineffective leadership (25%).\r\nHaving a poor relationship with a manager(s) (22%).\r\nFor the improvement of work/life balance (21%).\r\nContributions are not being recognized (21%).\r\nFor better compensation and benefits (18%),\r\nFor better alignment with personal and organizational values (17%).\r\nPersonal strengths and capabilities are not a good fit with an organization (16%).\r\nThe financial instability of an organization (13%).\r\nAn organization relocated (12%).\r\nAccording to an article on Time.com, one out of three people currently employed (as of 2008) spends about an hour per day searching for another position', 'third-post', '2021-09-04', 'Choose your own Taste'),
(8, 'New Post1', 'Hiii', 'Ashish', '2021-09-27', 'Helloooo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
