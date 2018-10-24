From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 Oct 2018 22:07:58 +0200
Subject: [Buildroot] [PATCH 1/3] package/mjpg-streamer: bump version
Message-ID: <20181024200800.32300-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump includes
https://github.com/jacksonliam/mjpg-streamer/commit/2b751f1f2ab1dfaf1d12bedf98d4fe37a42d3edd

which fixes
http://autobuild.buildroot.net/results/247/247a55398aed37a08c67cc21db6836ad342d24ca/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index a98aaffffd..0d995834d2 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 617c6cdcf5ad6e9135e8bcd83d7acd33cc4a563b9104bca7def57d807164ae89  mjpg-streamer-75c6c4a7809c735b201df949d55287fb60397744.tar.gz
+sha256 e5cb7936c316998b53bc46404eca5bc4a69c45fccedeecbf95f1d3902cb6556f  mjpg-streamer-686c3be31ca7a0cdc8772641e445fe9e1c9211e5.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index c09d55b727..bfde26e548 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = 75c6c4a7809c735b201df949d55287fb60397744
+MJPG_STREAMER_VERSION = 686c3be31ca7a0cdc8772641e445fe9e1c9211e5
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
-- 
2.19.1
