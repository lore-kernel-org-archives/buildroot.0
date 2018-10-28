From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Oct 2018 08:01:28 +0100
Subject: [Buildroot] [git commit] package/mjpg-streamer: bump version
Message-ID: <20181028071412.C4BD582BDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=367d7dc7a1621f26bc8f8b9a45adc131e0580820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes
https://github.com/jacksonliam/mjpg-streamer/commit/2b751f1f2ab1dfaf1d12bedf98d4fe37a42d3edd

which fixes
http://autobuild.buildroot.net/results/247/247a55398aed37a08c67cc21db6836ad342d24ca/

and includes
https://github.com/jacksonliam/mjpg-streamer/commit/ddb69b7b4f114f3c2ca01adf55712792ca8aed43

which fixes
http://autobuild.buildroot.net/results/dad/dad054954de76cab56333747274520f269be2066/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index a98aaffffd..76716266b9 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 617c6cdcf5ad6e9135e8bcd83d7acd33cc4a563b9104bca7def57d807164ae89  mjpg-streamer-75c6c4a7809c735b201df949d55287fb60397744.tar.gz
+sha256 d2c2c9dbc95332245f34247f4a0791d741d1ae875084f9886442f48a01b01d81  mjpg-streamer-ddb69b7b4f114f3c2ca01adf55712792ca8aed43.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index c09d55b727..de8bad0c03 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = 75c6c4a7809c735b201df949d55287fb60397744
+MJPG_STREAMER_VERSION = ddb69b7b4f114f3c2ca01adf55712792ca8aed43
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
