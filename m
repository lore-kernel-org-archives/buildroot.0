From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jun 2019 22:00:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version to 20190623-2245
Message-ID: <20190624200032.11841-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index da4ff5945d..0cbdc03a9c 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 94a67986dcb2c659752df767e81fd59a494fb7fb5c9d4fc8aff4f004353a42df  x264-snapshot-20181002-2245.tar.bz2
+sha256 88bbb8f7453497be4ee85cbc6f7d27c02822c4a3744b5ae6042c9c0159ad0747  x264-snapshot-20190623-2245.tar.bz2
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index d529871a8d..f3654d46b0 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 20181002-2245
+X264_VERSION = 20190623-2245
 X264_SITE = http://download.videolan.org/x264/snapshots
 X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
 X264_LICENSE = GPL-2.0+
-- 
2.20.1
