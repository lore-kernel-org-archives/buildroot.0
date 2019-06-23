From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:54:23 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: bump version
Message-ID: <20190623105426.7A4E6811F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f32464af61decac8cbd02eaa3947f8f2321a3098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 76716266b9..0a08151a4b 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d2c2c9dbc95332245f34247f4a0791d741d1ae875084f9886442f48a01b01d81  mjpg-streamer-ddb69b7b4f114f3c2ca01adf55712792ca8aed43.tar.gz
+sha256 bd934363b5cb6ef3665aa2dfa15d08b72bbfe84ca60f7c342fe8ae1f94e19201  mjpg-streamer-501f6362c5afddcfb41055f97ae484252c85c912.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 4077a3dcbc..d5980dbf15 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = ddb69b7b4f114f3c2ca01adf55712792ca8aed43
+MJPG_STREAMER_VERSION = 501f6362c5afddcfb41055f97ae484252c85c912
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
