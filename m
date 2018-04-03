From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 23:17:53 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.28.3
Message-ID: <20180403211845.CB69F813A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3081c69de57424bae4911889d44d4e372643825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes fixes for ash, cpio, grep and hush.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 9 +++++----
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 538aa04b9b..8537ceb4b7 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,6 +1,7 @@
-# From https://busybox.net/downloads/busybox-1.28.2.tar.bz2.sign
-md5 5db059384469827ab19dac69d3fcd092  busybox-1.28.2.tar.bz2
-sha1 5ddba42aa14b875688727f0a3a9973e42fc51c23  busybox-1.28.2.tar.bz2
+# From https://busybox.net/downloads/busybox-1.28.3.tar.bz2.sign
+md5 82e5ad09ae4a07c266fc179492b51757  busybox-1.28.3.tar.bz2
+sha1 64b47e83dccc5db7fe4ca596b28c9b901a136fe3  busybox-1.28.3.tar.bz2
+
 # Locally calculated
-sha256 b64a94a60877c96838ee60e75765576ecc8756bf3636485117637604acb84b0d  busybox-1.28.2.tar.bz2
+sha256 ad0d22033f23e696f9a71a4c2f9210194dda39b024a79151f4ac278995332a6e  busybox-1.28.3.tar.bz2
 sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d2d2e86636..fd4ac600c2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.28.2
+BUSYBOX_VERSION = 1.28.3
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
