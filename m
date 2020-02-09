From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Feb 2020 22:28:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox-player: remove 'v'
 prefix
Message-ID: <20200209212825.4044875-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glslsandbox-player/glslsandbox-player.hash | 2 +-
 package/glslsandbox-player/glslsandbox-player.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/glslsandbox-player.hash b/package/glslsandbox-player/glslsandbox-player.hash
index 2d25b4bb40..66dac9354a 100644
--- a/package/glslsandbox-player/glslsandbox-player.hash
+++ b/package/glslsandbox-player/glslsandbox-player.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3458294a50c3d2fd54f806e46dd7bfba5f1e6aedadd6c396c76d70793419432b  glslsandbox-player-v2019.08.23.tar.gz
+sha256  3458294a50c3d2fd54f806e46dd7bfba5f1e6aedadd6c396c76d70793419432b  glslsandbox-player-2019.08.23.tar.gz
 sha256  06a79395e8f3a4cc7ad068c6b59dfbe12c0efa4d27791e532345ceb1f41aea8a  LICENSE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index d6dfb8fc91..5ace69d7dd 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLSLSANDBOX_PLAYER_VERSION = v2019.08.23
-GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,$(GLSLSANDBOX_PLAYER_VERSION))
+GLSLSANDBOX_PLAYER_VERSION = 2019.08.23
+GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,v$(GLSLSANDBOX_PLAYER_VERSION))
 GLSLSANDBOX_PLAYER_AUTORECONF = YES
 GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
 
-- 
2.24.1
