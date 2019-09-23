From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 23 Sep 2019 17:15:42 -0600
Subject: [Buildroot] [PATCH 1/2] sdl2_gfx: bump to version 1.0.4
Message-ID: <20190923231543.21874-1-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

bump sdl2_gfx from version 1.0.1 to 1.0.4 to upgrade to most recent version

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_gfx/sdl2_gfx.hash | 4 ++--
 package/sdl2_gfx/sdl2_gfx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_gfx/sdl2_gfx.hash b/package/sdl2_gfx/sdl2_gfx.hash
index 4cb07ee935..eacb2fa422 100644
--- a/package/sdl2_gfx/sdl2_gfx.hash
+++ b/package/sdl2_gfx/sdl2_gfx.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 d69bcbceb811b4e5712fbad3ede737166327f44b727f1388c32581dbbe8c599a  SDL2_gfx-1.0.1.tar.gz
+# Locally calculated 
+sha256 63e0e01addedc9df2f85b93a248f06e8a04affa014a835c2ea34bfe34e576262  SDL2_gfx-1.0.4.tar.gz
diff --git a/package/sdl2_gfx/sdl2_gfx.mk b/package/sdl2_gfx/sdl2_gfx.mk
index 1ec138714b..6817391b21 100644
--- a/package/sdl2_gfx/sdl2_gfx.mk
+++ b/package/sdl2_gfx/sdl2_gfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_GFX_VERSION = 1.0.1
+SDL2_GFX_VERSION = 1.0.4
 SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
 SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
 SDL2_GFX_LICENSE = Zlib
-- 
2.11.0
