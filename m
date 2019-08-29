From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:49:47 +0200
Subject: [Buildroot] [git commit branch/next] package/glmark2: bump to the
 latest version
Message-ID: <20190829205349.ACF7C884FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=151da9661ea2b64d205da5ede126752c410be885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to the latest git version, containing multiple fixes and support
for render-only GPUs (lima, panfrost, ...) and missing DRM driver
names to run like meson, rockchip, sun4i-drm.

Tested on Khadas VIM2 (aarch64) and Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glmark2/glmark2.hash | 2 +-
 package/glmark2/glmark2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index aeb8a78568..c8772422eb 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8800f3cab0575df217adc166b181930e1f881efb6f764f35872993ee78dea5f0 glmark2-9b1070fe9c5cf908f323909d3c8cbed08022abe8.tar.gz
+sha256 6a9de46c098406895411b629fe8fadfdce92360500f0f10e4cc60a889a1692eb glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e.tar.gz
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 4eeaec79c3..c2b9265edb 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = 9b1070fe9c5cf908f323909d3c8cbed08022abe8
+GLMARK2_VERSION = 9e01aef1a786b28aca73135a5b00f85c357e8f5e
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
