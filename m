From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:37:55 +0200
Subject: [Buildroot] [git commit] package/minetest: bump to version 5.0.1
Message-ID: <20190424203441.58F7F812A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c1ec794837921b1f58abefad2368a8fa16c9712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://forum.minetest.net/viewtopic.php?t=22463

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest-game/minetest-game.hash | 2 +-
 package/minetest-game/minetest-game.mk   | 2 +-
 package/minetest/minetest.hash           | 2 +-
 package/minetest/minetest.mk             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 4299df26c2..e766b6b6c4 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 83688d802f9d8308acf6f95e6845cdbe1ee1bc088a963a30f94cf72ec7265cf8 minetest-game-5.0.0.tar.gz
+sha256 965d2cf3ac8c822bc9e60fb8f508182fb2f24dde46f46b000caf225ebe2ec519 minetest-game-5.0.1.tar.gz
 
 sha256 f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0 LICENSE.txt
 sha256 ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3 mods/beds/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index 05471e6738..736d361458 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.0.0
+MINETEST_GAME_VERSION = 5.0.1
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index f9f92fbb6c..12507957bf 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 1ba816f77dc9dbd5a4995f0c1d482f8f22b9aa75b6d6999dbfd1f3d698363d0a  minetest-5.0.0.tar.gz
+sha256 aa771cf178ad1b436d5723e5d6dd24e42b5d56f1cfe9c930f6426b7f24bb1635  minetest-5.0.1.tar.gz
 
 sha256 03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 69bca691e2..96a66a3f19 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.0.0
+MINETEST_VERSION = 5.0.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
