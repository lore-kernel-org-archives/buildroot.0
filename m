From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:51:19 +0200
Subject: [Buildroot] [git commit] package/minetest-game: bump to version
 5.1.0
Message-ID: <20191017074511.8053582286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8134a71e920b5d89fc88d5f6c6604de42ca248de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file hash for mods/sfinv/license.txt
(new crafting arrow texture), mods/tnt/license.txt
(new TNT sounds) and mods/xpanes/license.txt
(steel bar door and steel bar trapdoor).

Add new license files: env_sounds, fireflies and
spawn.

See:
https://dev.minetest.net/Changelog#5.0.1_.E2.86.92_5.1.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest-game/minetest-game.hash | 11 +++++++----
 package/minetest-game/minetest-game.mk   |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index e766b6b6c4..a618f32d11 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 965d2cf3ac8c822bc9e60fb8f508182fb2f24dde46f46b000caf225ebe2ec519 minetest-game-5.0.1.tar.gz
+sha256 f165fac0081bf4797cf9094282cc25034b2347b3ea94e6bb8d9329c5ee63f41b minetest-game-5.1.0.tar.gz
 
 sha256 f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0 LICENSE.txt
 sha256 ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3 mods/beds/license.txt
@@ -14,8 +14,10 @@ sha256 66f93a58a7418b86f2ca54e8de931f5c38d9f3e07d407c2c095b632fcda72956 mods/def
 sha256 c0c652890fc80af8eefedbcfe1cd0d16b13b14cd1c7105c9c2bc9abe8cf1620c mods/doors/license.txt
 sha256 33d0b8726dd27c8f0c96d6dfd611e0e980bbdbb8075fac7476d055518319ec1c mods/dungeon_loot/license.txt
 sha256 011ebc82e96df3b825777e7531cb5d34cfce1f6ca27b7d3c80793c033d7c4f4e mods/dye/license.txt
+sha256 29a05b102726b9a3115f7ec06d5188dac7b1c005d8cf1c4d6dc2d5544405a45c mods/env_sounds/license.txt
 sha256 163ad77a427a21a900a8fe2333dfc82d115e8e799b7e13ca71f6bd47dcf0ec13 mods/farming/license.txt
 sha256 61f826be9adee70ef0e37f3bf4891fecc4b027a21637b32981b98220723d6f37 mods/fire/license.txt
+sha256 01370a00e7b2157a07ee21fa4dac9cc108c7449442f612a3e55cfe18b5b03c2b mods/fireflies/license.txt
 sha256 d92ac36a0235f4c02f8cfe2137d7d632bd53374c44ead97f20c152dddf475837 mods/flowers/license.txt
 sha256 ffbac006d197fcb8e36e9cdda638053ac80eef4e6446bbe36cb94bd28f54ba0b mods/game_commands/license.txt
 sha256 857f64cd62c13e27f25363584342fe049885b16c6b2392f1ebd7c3a7fb6ca436 mods/give_initial_stuff/license.txt
@@ -23,10 +25,11 @@ sha256 dcbab8d7dc4137789958d19471807b37447fd303bced310d7d76d901eefca8ff mods/map
 sha256 8acd4a18781a508f641b9364a0b491fccb0affd4c638b74b215238d0b0ee7b76 mods/player_api/license.txt
 sha256 0066e63d682d54a014ad3359794365a1abb87562d2b1e5e32093976d88c295b4 mods/screwdriver/license.txt
 sha256 b903866d052774e4127952690ce62ca26aa5bc4c2ddd48fceae501fa0d24ed74 mods/sethome/license.txt
-sha256 d74d3e98885a807a1922e3ed2d0af1708b60465a49937f456059e7b9efd4a428 mods/sfinv/license.txt
+sha256 478b9944a446b4d88496d10736ddcd8ad5a3ca52f8b75f747315583d4012cb3c mods/sfinv/license.txt
+sha256 e361fc900d9203859391d35c38c3284c91600d23c1617076c641ff7e9fe10b15 mods/spawn/license.txt
 sha256 eab4c0cb318bb83c13362047a5a0fc5cb650a4e561ceb5a9124e5a1253cbc21a mods/stairs/license.txt
-sha256 e0c007cf51c9e77e7ec8b1c65400748c45676e5ed05aecdc4a5bc447e7f2820c mods/tnt/license.txt
+sha256 e8593deed04ed4199ce9303db900f32276e0b629fd7f0089074d13370c12d00a mods/tnt/license.txt
 sha256 a0814bccd28157a160049efeac03864ff4c4dd6a34bc9cfcd3cc62de66fb156a mods/vessels/license.txt
 sha256 e9ebf1b4b170e64a0ea6e246edd03689aeb859d6560b8372a8081c004b30cb65 mods/walls/license.txt
 sha256 551b19e2c8b18c143301e090a1ceb5dc5d4ca243cad846de179d693439910816 mods/wool/license.txt
-sha256 54fd170807a31712e3d6489287a27cdf5aa42eaff10e321aea040fb5b3e5a60a mods/xpanes/license.txt
+sha256 c71155c9a68a5242223c5f814c1b9b1270492729b0ff0add770b6418bccf17c9 mods/xpanes/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index 736d361458..1e6bb4d0c4 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.0.1
+MINETEST_GAME_VERSION = 5.1.0
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
@@ -21,8 +21,10 @@ MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
 	mods/doors/license.txt \
 	mods/dungeon_loot/license.txt \
 	mods/dye/license.txt \
+	mods/env_sounds/license.txt \
 	mods/farming/license.txt \
 	mods/fire/license.txt \
+	mods/fireflies/license.txt \
 	mods/flowers/license.txt \
 	mods/game_commands/license.txt \
 	mods/give_initial_stuff/license.txt \
@@ -31,6 +33,7 @@ MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
 	mods/screwdriver/license.txt \
 	mods/sethome/license.txt \
 	mods/sfinv/license.txt \
+	mods/spawn/license.txt \
 	mods/stairs/license.txt \
 	mods/tnt/license.txt \
 	mods/vessels/license.txt \
