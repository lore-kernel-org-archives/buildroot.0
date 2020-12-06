From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Dec 2020 14:56:07 +0100
Subject: [Buildroot] [PATCH 3/3] package/flare-game: bump to version 1.11
In-Reply-To: <20201206135607.667917-1-romain.naour@gmail.com>
References: <20201206135607.667917-1-romain.naour@gmail.com>
Message-ID: <20201206135607.667917-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A LICENSE.txt file has been added since 1.01 [1].

[1] https://github.com/flareteam/flare-game/commit/b39f98ffc5e2d0bba7cf62f18570082cb5a1f112

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-game/flare-game.hash | 4 ++--
 package/flare-game/flare-game.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index 51646269a3..983c23200f 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5c8e9d72fcbe59f1861f79ac7b76ceffe3ec61d1df241c32d9133fe158fba4c1  flare-game-1.0.tar.gz
-sha256  9fce5eb663f136449e11293a871ed96db5ba579116a927fc6a70dd20a4a5b9e6  README
+sha256  c13231c7dd021252487f6cf117f7f2bb24bbda40af0a2b2902d72b5e2d4c242a  flare-game-1.11.tar.gz
+sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index a70e998d0e..4bebc79595 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = 1.0
-FLARE_GAME_SITE =  $(call github,clintbellanger,flare-game,v$(FLARE_GAME_VERSION))
+FLARE_GAME_VERSION = 1.11
+FLARE_GAME_SITE =  $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
 FLARE_GAME_LICENSE_FILES = README
-- 
2.25.4
