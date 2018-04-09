From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:42:53 +0200
Subject: [Buildroot] [git commit] package/flare-engine: fix license
Message-ID: <20180409194333.8F01B8134D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4316cad63dc971535160388f040d551536cabd17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is GPL-3.0+, not GPL-3.0. Indeed all source files have the
mention:

"either version 3 of the License, or (at your option) any later version"

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flare-engine/flare-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 394ddcfa5d..0aac3bd33c 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -6,7 +6,7 @@
 
 FLARE_ENGINE_VERSION = v1.0
 FLARE_ENGINE_SITE =  $(call github,clintbellanger,flare-engine,$(FLARE_ENGINE_VERSION))
-FLARE_ENGINE_LICENSE = GPL-3.0
+FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
 FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
