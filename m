From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:38:46 +0100
Subject: [Buildroot] [git commit] package/mjpg-streamer: bump version,
	add hash
Message-ID: <20160201224703.C91027F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe8827ada21769273a28f7f5a91acb2297156892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 ++
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
