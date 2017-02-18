From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Feb 2017 16:45:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-17
In-Reply-To: <20170218091258.GK12810@waldemar-brodkorb.de>
References: <20170218072912.9279F20BAE@mail.free-electrons.com>
 <20170218091258.GK12810@waldemar-brodkorb.de>
Message-ID: <20170218164527.7a2edf9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 10:12:58 +0100, Waldemar Brodkorb wrote:

> just curious, is there a reason we see no bfin errors?

Believe it or not, but it seems like there are no bfin failures
anymore. We don't build that many bfin configurations per day, but over
the last 50 bfin builds, only 4 have failed, and it's been a while ago:

+--------+--------+---------------------+------------------------------------------+------------------------------------------+------------------------------------------+------+---------------+--------+--------+---------+----------+
| id     | status | builddate           | submitter                                | commitid                                 | identifier                               | arch | reason        | libc   | static | subarch | duration |
+--------+--------+---------------------+------------------------------------------+------------------------------------------+------------------------------------------+------+---------------+--------+--------+---------+----------+
| 365071 |      0 | 2017-02-17 16:09:26 | Yann E. MORIN                            | 426ffbe9522fe7e8d140c70747be28e369b3f7aa | e0fcbf9ff52cc5f6a07180a82c187c062b398157 | bfin | none          | uclibc |      0 | bf512   |     3306 |
| 365060 |      0 | 2017-02-17 14:58:50 | Thomas Petazzoni (Free Electrons server) | 426ffbe9522fe7e8d140c70747be28e369b3f7aa | 82b14a10768e1bfe3ddca0606f8820d634189721 | bfin | none          | uclibc |      0 | bf512   |     4435 |
| 364906 |      0 | 2017-02-17 02:45:26 | Yann E. MORIN                            | 426ffbe9522fe7e8d140c70747be28e369b3f7aa | 4dca4128f19521b3d93eb9856107a5a545fa620d | bfin | none          | uclibc |      0 | bf512   |      502 |
| 364788 |      0 | 2017-02-16 15:56:06 | Yann E. MORIN                            | 23fa0f66a0ef05358c340adf807033db69faeb19 | 8dc575407d84fbe3d53d6068120f4673be1b9003 | bfin | none          | uclibc |      0 | bf512   |     1260 |
| 364711 |      0 | 2017-02-16 08:07:34 | Yann E. MORIN                            | dd6893adad3693cd3440d0ced10e67b296a08c47 | 060beda1c9832c9c3a01ada14049fe98fffa1609 | bfin | none          | uclibc |      0 | bf512   |      797 |
| 364643 |      0 | 2017-02-16 03:04:03 | Yann E. MORIN                            | dd6893adad3693cd3440d0ced10e67b296a08c47 | a302d9236553e4df8708fefa2fba6bb9958859d8 | bfin | none          | uclibc |      0 | bf512   |      268 |
| 364620 |      0 | 2017-02-16 01:03:20 | Yann E. MORIN                            | dd6893adad3693cd3440d0ced10e67b296a08c47 | 30b9e9cd70adb0c01f9c2e9302ab8b562cee6868 | bfin | none          | uclibc |      0 | bf512   |     1929 |
| 364569 |      0 | 2017-02-15 20:40:23 | Thomas Petazzoni (Free Electrons server) | 258bb0381144d1c663756af72acff4602bcc2700 | 0b5170ef6d3f1b5e72afc5ef44fd998efc4338f9 | bfin | none          | uclibc |      0 | bf512   |     1375 |
| 364552 |      0 | 2017-02-15 18:54:23 | Thomas Petazzoni (Free Electrons server) | 258bb0381144d1c663756af72acff4602bcc2700 | 8b8bc84fa5d41d768a8cc6026ac5a332483f18d2 | bfin | none          | uclibc |      0 | bf512   |     2397 |
| 364520 |      0 | 2017-02-15 16:20:27 | Thomas Petazzoni (Free Electrons server) | 258bb0381144d1c663756af72acff4602bcc2700 | aa9c6a3e2685f5d72dbd51a9ac2cdad24e685c43 | bfin | none          | uclibc |      0 | bf512   |     1443 |
| 364406 |      0 | 2017-02-15 05:22:26 | Peter Korsgaard (gcc10)                  | d5c22302f9d1a73d40e5f4748440b37b22da04f2 | 2bd2616f705502851f43efd7ce50251191514c4c | bfin | none          | uclibc |      0 | bf512   |     5647 |
| 364377 |      0 | 2017-02-15 02:31:57 | Yann E. MORIN                            | d5c22302f9d1a73d40e5f4748440b37b22da04f2 | 01ca706ca56e61af18cdea341bfed87ca82cbaf3 | bfin | none          | uclibc |      0 | bf512   |     2713 |
| 364325 |      0 | 2017-02-14 21:23:57 | Richard Braun (sceen.net)                | 3a89cfc46489e0bedf27796134698878d0de9281 | a7a05e67857f3b1ad155f18dae8edc2cda79dcff | bfin | none          | uclibc |      0 | bf512   |     2611 |
| 364302 |      0 | 2017-02-14 19:46:13 | Matt Weber (U14.04 RC)                   | 3a89cfc46489e0bedf27796134698878d0de9281 | 8c16eecc739880ecb11eb6d0f1c591ab5c170e0c | bfin | none          | uclibc |      0 | bf512   |     2732 |
| 364247 |      0 | 2017-02-14 14:22:01 | Andre Hentschel                          | 6f971f354c14a8948477a0936668b8baae8ec86e | efeee3f27f275210ddaaf35fa06b912ada66a7d2 | bfin | none          | uclibc |      0 | bf512   |     2269 |
| 364229 |      0 | 2017-02-14 12:33:22 | Yann E. MORIN                            | 6f971f354c14a8948477a0936668b8baae8ec86e | ff75b5ab5c70eb33d3273b5b6355d70d5a6b5a4e | bfin | none          | uclibc |      1 | bf512   |     1180 |
| 364142 |      0 | 2017-02-14 05:16:39 | Thomas Petazzoni (Free Electrons server) | 8b8b4f7bfe50a33bbda9ed0cbbdc5170c3147625 | 6b7aad75ebaa033642cb4971780ce240d1f2441a | bfin | none          | uclibc |      0 | bf512   |     1717 |
| 364114 |      0 | 2017-02-14 03:01:51 | Peter Korsgaard (gcc10)                  | 8b8b4f7bfe50a33bbda9ed0cbbdc5170c3147625 | 287dc6084aad549512f7eae2edb9acd0095c199e | bfin | none          | uclibc |      0 | bf512   |     6093 |
| 364095 |      0 | 2017-02-14 01:18:04 | Yann E. MORIN                            | 8b8b4f7bfe50a33bbda9ed0cbbdc5170c3147625 | c61f893916f706c3acab22fa067f47a71ad036ea | bfin | none          | uclibc |      0 | bf512   |     4529 |
| 364014 |      0 | 2017-02-13 17:35:05 | Peter Korsgaard (gcc10)                  | 5bf12ad141f5de02c79c04a773e7709b87070229 | 53bd0e3d0bbc587a79e10487b2a6b4b031afd23a | bfin | none          | uclibc |      0 | bf512   |     3785 |
| 363879 |      0 | 2017-02-13 04:04:00 | Thomas Petazzoni (Free Electrons server) | 5bf12ad141f5de02c79c04a773e7709b87070229 | 58507d4bbcf02b2f36da203b1a0245a1086a486b | bfin | none          | uclibc |      0 | bf512   |     3354 |
| 363875 |      0 | 2017-02-13 03:34:53 | Peter Korsgaard (gcc10)                  | 5bf12ad141f5de02c79c04a773e7709b87070229 | bc3873aa2c8a6928dfffa6543e857b3ff3668b4f | bfin | none          | uclibc |      0 | bf512   |     3966 |
| 363710 |      0 | 2017-02-12 12:13:56 | Yann E. MORIN                            | 80522943010ab2f0b4233fe3cbe6799505081990 | 6f6b5e795656f7354ecec85472033fa497c58dc3 | bfin | none          | uclibc |      0 | bf512   |     3294 |
| 363550 |      0 | 2017-02-11 21:30:23 | Yann E. MORIN                            | 80522943010ab2f0b4233fe3cbe6799505081990 | 193891b552023fd239b0fb56a826f908e56648ef | bfin | none          | uclibc |      0 | bf512   |     2523 |
| 363485 |      0 | 2017-02-11 16:04:31 | Yann E. MORIN                            | 4f17e8cfcce1f8625f11a38a1739bf0fe35eeeae | 799cf8d0858d46b9bd2e15e14cd00fe238b58b9b | bfin | none          | uclibc |      0 | bf512   |      389 |
| 363484 |      0 | 2017-02-11 16:04:16 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | bec71e9310bfb59da4d4b5d62bb515415ca5920c | bfin | none          | uclibc |      0 | bf512   |     2769 |
| 363454 |      0 | 2017-02-11 13:54:40 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 52d780ee4c8dfb426918ab94747f3414d776ea67 | bfin | none          | uclibc |      0 | bf512   |     2760 |
| 363332 |      0 | 2017-02-11 02:22:44 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | d3a0a9654fd8e78a658b99fe48350aea507e49ec | bfin | none          | uclibc |      0 | bf512   |     1752 |
| 363322 |      0 | 2017-02-11 01:07:55 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 91312689e4021d3fd4fd088aef72c6e68a8202e6 | bfin | none          | uclibc |      0 | bf512   |     1297 |
| 363299 |      0 | 2017-02-10 22:17:10 | Yann E. MORIN                            | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 81d0089d45a94fd838e319b8b4ea096b2874bdb2 | bfin | none          | uclibc |      0 | bf512   |     3867 |
| 363290 |      0 | 2017-02-10 21:43:00 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 3c483621dd2c5666f1f1b4644cec2c6dd007b5d5 | bfin | none          | uclibc |      0 | bf512   |     3193 |
| 363269 |      0 | 2017-02-10 19:44:18 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | a67db86bd3ef9242094f8eea8ae5df5fa8ed369d | bfin | none          | uclibc |      0 | bf512   |     3865 |
| 363204 |      0 | 2017-02-10 13:16:20 | Richard Braun (sceen.net)                | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 71b53103f0f134f4a3b26b28716b6dd939d4873e | bfin | none          | uclibc |      0 | bf512   |     3117 |
| 363197 |      0 | 2017-02-10 12:33:59 | Thomas Petazzoni (Free Electrons server) | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 2d74b184e9a5d05bde71c8dfb3ca9aaa8c22a1cf | bfin | none          | uclibc |      0 | bf512   |     3987 |
| 363164 |      0 | 2017-02-10 08:18:31 | Yann E. MORIN                            | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | b8df538490c8891c9649e6b81cc91254e0278c0e | bfin | none          | uclibc |      0 | bf512   |     3382 |
| 363124 |      0 | 2017-02-10 04:44:39 | Matt Weber (U14.04 RC)                   | 29c00e40af7799153d78c62cb2536ba877ffc2d4 | 33ec5f3d92a4f9e2a69d6a790d08dd74718dbd3c | bfin | none          | uclibc |      0 | bf512   |     3864 |
| 362904 |      1 | 2017-02-09 05:44:07 | Yann E. MORIN                            | 5d065ef1da3c213ad6fc0d039f92dbbb68dca921 | 209ab80c3069d9c93ffa983c5209c949f7378602 | bfin | ibrdtnd-1.0.1 | uclibc |      1 | bf512   |      955 |
| 362883 |      1 | 2017-02-09 04:19:10 | Thomas Petazzoni (Free Electrons server) | 5d065ef1da3c213ad6fc0d039f92dbbb68dca921 | 499d607643e11cd4c4bed00344eff8ac8dd5ad82 | bfin | icu-58.2      | uclibc |      1 | bf512   |       87 |
| 362822 |      0 | 2017-02-08 21:53:45 | Yann E. MORIN                            | 5d065ef1da3c213ad6fc0d039f92dbbb68dca921 | f882fd6721c4a9534239c12d87138ad91e6dc53b | bfin | none          | uclibc |      0 | bf512   |     3277 |
| 362808 |      0 | 2017-02-08 20:39:03 | Peter Korsgaard (gcc20)                  | 5d065ef1da3c213ad6fc0d039f92dbbb68dca921 | a39b4c0da435bdc1114837e8b99d04be409d96c9 | bfin | none          | uclibc |      0 | bf512   |     4844 |
| 362754 |      0 | 2017-02-08 15:50:08 | Thomas Petazzoni (Free Electrons server) | 54a94951231ce624cf6a2e297c806c1677efdeb8 | 99d5b3d3e217bda21b154a88a9f579b3c81f88be | bfin | none          | uclibc |      0 | bf512   |     3793 |
| 362724 |      0 | 2017-02-08 13:30:31 | Yann E. MORIN                            | 54a94951231ce624cf6a2e297c806c1677efdeb8 | c37d74b990dca44728c0de02551c4d34575111e2 | bfin | none          | uclibc |      0 | bf512   |      248 |
| 362722 |      1 | 2017-02-08 13:26:01 | Yann E. MORIN                            | 54a94951231ce624cf6a2e297c806c1677efdeb8 | 6ad6e0d3cada397b69bc49649b12db7d211bfd1e | bfin | sngrep-v1.4.2 | uclibc |      1 | bf512   |     1763 |
| 362692 |      0 | 2017-02-08 10:18:57 | Yann E. MORIN                            | a1071d7169e00b805dbcdaec33082ad2365dfd23 | 9a14877fa836726a9164ebb31c9b74c201e9b8aa | bfin | none          | uclibc |      0 | bf512   |     1435 |
| 362635 |      0 | 2017-02-08 03:07:06 | Thomas Petazzoni (Free Electrons server) | 9eba09a48e4e69f084f29523b0f0f34f3305925d | 4e77a004b2ab53cd452342f5b157579c66f10340 | bfin | none          | uclibc |      0 | bf512   |     2395 |
| 362555 |      0 | 2017-02-07 19:14:01 | Yann E. MORIN                            | ac73162553699d0a1f21e4d1a766b0b772d77b08 | 0f26e4f630c6b5a12c84d90d538451c2fe44de77 | bfin | none          | uclibc |      0 | bf512   |     3438 |
| 362400 |      0 | 2017-02-07 03:19:27 | Thomas Petazzoni (Free Electrons server) | 76e1594f0004098fc01aeac2b9a8292fd8c5c104 | c7abdead28ca9d3a00b5ae67110eea37e1002790 | bfin | none          | uclibc |      0 | bf512   |     3361 |
| 362361 |      0 | 2017-02-06 23:27:17 | Yann E. MORIN                            | 896ae3f9616d124c934f09d14de8cdc61ef0cec4 | ec9aa858366c404ac33be484724f2635ec5c8ce6 | bfin | none          | uclibc |      0 | bf512   |     2779 |
| 362228 |      0 | 2017-02-06 07:52:04 | Yann E. MORIN                            | a7399b257a522023c497db351e17b233fdd29f61 | 48aed7df4566fe100e4957815fb104e079c062ba | bfin | none          | uclibc |      0 | bf512   |     2290 |
| 362175 |      1 | 2017-02-06 01:40:42 | Thomas Petazzoni (Free Electrons server) | a7399b257a522023c497db351e17b233fdd29f61 | d8d7a0bf17fc9af77df73858bacdbea037630e7b | bfin | libcec-4.0.2  | uclibc |      0 | bf512   |      551 |
+--------+--------+---------------------+------------------------------------------+------------------------------------------+------------------------------------------+------+---------------+--------+--------+---------+----------+

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
