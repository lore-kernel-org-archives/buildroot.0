From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  6 Jun 2020 17:37:39 -0600
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: bump to version
 5a6e0a2db163e6ae9461552b59079870d0959340
Message-ID: <20200606233739.1998087-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 0a08151a4b..63dcdb9fbe 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bd934363b5cb6ef3665aa2dfa15d08b72bbfe84ca60f7c342fe8ae1f94e19201  mjpg-streamer-501f6362c5afddcfb41055f97ae484252c85c912.tar.gz
+sha256 5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index d5980dbf15..64404e21fa 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = 501f6362c5afddcfb41055f97ae484252c85c912
+MJPG_STREAMER_VERSION = 5a6e0a2db163e6ae9461552b59079870d0959340
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
-- 
2.25.1
