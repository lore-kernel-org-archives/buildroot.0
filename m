From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:15:07 +0200
Subject: [Buildroot] [git commit] package/minetest{-game}: bump to version
 5.4.1
Message-ID: <20210429084946.7DEC5866C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f62aa54676d9dacbc48b4cb7b7382388e2c11711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See Changelog [1]

Update minetest-game licence file hash for:
  mods/player_api/license.txt [2]

Update minetest license file hash for:
  LICENSE.txt [3][4]

[1] https://dev.minetest.net/Changelog#5.3.0_.E2.86.92_5.4.0
[2] https://github.com/minetest/minetest_game/commit/63cffc4bd1851af2acd145f09dbd462287c76068
[3] https://github.com/minetest/minetest/commit/5066fe75830b98f592717b593099a757337c952d
[4] https://github.com/minetest/minetest/commit/92aac69b36d37ace8d2e06721cfa5e488427dcdf

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minetest-game/minetest-game.hash | 4 ++--
 package/minetest-game/minetest-game.mk   | 2 +-
 package/minetest/minetest.hash           | 4 ++--
 package/minetest/minetest.mk             | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 1d22b62fc8..3f057e4ee5 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  06c6c1d4b97af211dd0fa518a3e68a205f594e9816a4b2477e48d4d21d278e2d  minetest-game-5.3.0.tar.gz
+sha256  b4bfa0755b88230cf4bdb6af6a0951dd1248f6cdf87fecc340e43ac12c80b0b2  minetest-game-5.4.1.tar.gz
 
 sha256  f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0  LICENSE.txt
 sha256  ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3  mods/beds/license.txt
@@ -22,7 +22,7 @@ sha256  d92ac36a0235f4c02f8cfe2137d7d632bd53374c44ead97f20c152dddf475837  mods/f
 sha256  ffbac006d197fcb8e36e9cdda638053ac80eef4e6446bbe36cb94bd28f54ba0b  mods/game_commands/license.txt
 sha256  857f64cd62c13e27f25363584342fe049885b16c6b2392f1ebd7c3a7fb6ca436  mods/give_initial_stuff/license.txt
 sha256  dcbab8d7dc4137789958d19471807b37447fd303bced310d7d76d901eefca8ff  mods/map/license.txt
-sha256  65133ccf7fb7bf8ffe5e9bc148b193af7362bba925b15ab507da28494156297a  mods/player_api/license.txt
+sha256  88385cd60d15c4fb4856c3c4c551c76c30958268c5c1160c1aa4e520c037a623  mods/player_api/license.txt
 sha256  0066e63d682d54a014ad3359794365a1abb87562d2b1e5e32093976d88c295b4  mods/screwdriver/license.txt
 sha256  b903866d052774e4127952690ce62ca26aa5bc4c2ddd48fceae501fa0d24ed74  mods/sethome/license.txt
 sha256  478b9944a446b4d88496d10736ddcd8ad5a3ca52f8b75f747315583d4012cb3c  mods/sfinv/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index 7f1927b78e..df118b9e52 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.3.0
+MINETEST_GAME_VERSION = 5.4.1
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index 3459c9d1a5..7eb57cb2a9 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  65dc2049f24c93fa544500f310a61e289c1b8fa47bf60877b746a2c27a7238d6  minetest-5.3.0.tar.gz
+sha256  de9e4410583c845c104b4be25f9d0b8743d8573c120149b8910ae2519f9ab14e  minetest-5.4.1.tar.gz
 
-sha256  d2a488e385226c5b865219c6acc2aa98ba2e01e74dd0ac9dd8c0663bbbe31eb1  LICENSE.txt
+sha256  5bc4bb4ff369d5039bcfff5a83a378335240ca86c58299e7de25097153c70132  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index d120353a5f..e046ec2851 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.3.0
+MINETEST_VERSION = 5.4.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
