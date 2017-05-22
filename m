From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 14:08:36 +0200
Subject: [Buildroot] [git commit branch/next] package/bitstream: bump
	version to 1.2
Message-ID: <20170522120918.A58F28288B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bc8809064bd2460c174323454ee33e4a25954e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitstream/bitstream.hash | 8 ++++----
 package/bitstream/bitstream.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index 7a3b7f8..a62f733 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,4 +1,4 @@
-# from https://get.videolan.org/bitstream/1.1/bitstream-1.1.tar.bz2.md5
-md5 88e6e786242196b4d73a5b6075aeb1a2 bitstream-1.1.tar.bz2
-# locally calculated
-sha256 90b65f619895d31e652386d5d7d2d2d62cccd44383c1fac9145d659013a2de9e bitstream-1.1.tar.bz2
+# From https://get.videolan.org/bitstream/1.2/bitstream-1.2.tar.bz2
+sha256 ccfbb438711606de1fad881b58c8f134e2d82b4d53a88ea48f2d1bcb49ca5ad2  bitstream-1.2.tar.bz2
+# From https://get.videolan.org/bitstream/1.2/bitstream-1.2.tar.bz2.md5
+md5 c4b2dbd84eb5799f1525eb9a4e01dc56  bitstream-1.2.tar.bz2
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 9c8c6f5..0b28ffe 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITSTREAM_VERSION = 1.1
+BITSTREAM_VERSION = 1.2
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
 BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
