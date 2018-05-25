From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 May 2018 16:17:07 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.28.4
Message-ID: <20180525141648.7A8238270E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=021e2d776463817fe9410fa847fca65c8caccf2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes to dpkg and nsenter.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 8 ++++----
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 8537ceb4b7..066817aefb 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,7 +1,7 @@
-# From https://busybox.net/downloads/busybox-1.28.3.tar.bz2.sign
-md5 82e5ad09ae4a07c266fc179492b51757  busybox-1.28.3.tar.bz2
-sha1 64b47e83dccc5db7fe4ca596b28c9b901a136fe3  busybox-1.28.3.tar.bz2
+# From https://busybox.net/downloads/busybox-1.28.4.tar.bz2.sign
+md5 5661d013c9ef7cc31a453640c320f56b  busybox-1.28.4.tar.bz2
+sha1 acd0558a659b795da1dfbd7e0ed5353d6836fa37  busybox-1.28.4.tar.bz2
 
 # Locally calculated
-sha256 ad0d22033f23e696f9a71a4c2f9210194dda39b024a79151f4ac278995332a6e  busybox-1.28.3.tar.bz2
+sha256 e3c14a3699dc7e82fed397392957afc78e37bdf25398ac38ead6e84621b2ae6a  busybox-1.28.4.tar.bz2
 sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 60a55a2c78..4ead637d65 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.28.3
+BUSYBOX_VERSION = 1.28.4
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
