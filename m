From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 15:12:58 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/mjpg-streamer: bump version,
	add hash
Message-ID: <1453644779-7961-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added hash (Arnout)

 package/mjpg-streamer/mjpg-streamer.hash | 2 ++
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/mjpg-streamer/mjpg-streamer.hash

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
new file mode 100644
index 0000000..8bbac29
--- /dev/null
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	756a60cbc3404ac21109bb66091774ac8e1d64ebf60e2bf2c0d08a06d1abb9be	mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.tar.gz
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index e10e9a8..e54c600 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -8,7 +8,7 @@
 # http://sourceforge.net/p/mjpg-streamer/code/commit_browser
 # oliv3r forked the repo to add support for 3.16 and 3.17 kernels:
 # http://sourceforge.net/p/mjpg-streamer/patches/14/
-MJPG_STREAMER_VERSION = 730b5bcdc378b6a201131c6c2620eedbe0f6eb30
+MJPG_STREAMER_VERSION = bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b
 MJPG_STREAMER_SITE = $(call github,oliv3r,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_LICENSE = GPLv2+
 MJPG_STREAMER_LICENSE_FILES = LICENSE
-- 
2.7.0.rc3
