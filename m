From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 15:53:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/ccid: bump version to 1.4.26
Message-ID: <20170421135303.8899-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE according to
http://lists.alioth.debian.org/pipermail/pcsclite-muscle/Week-of-Mon-20170102/000780.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccid/ccid.hash | 5 +++--
 package/ccid/ccid.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index a0e91da46..3e1e962a5 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,2 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid/ccid_1.4.18-1.dsc
-sha256	5fdba97a2d2eb1c652b7dd4aa0bb8cee4814bab0cf61aecb84b32b57272541aa	ccid_1.4.18.orig.tar.bz2
+# From http://cdn-fastly.deb.debian.org/debian/pool/main/c/ccid/ccid_1.4.26-1.dsc
+sha1 20e22c23b8458548a6b572b044e5dbe4ecdc42e5  ccid_1.4.26.tar.bz2
+sha256 3267bf708ab780c02f01f6241b7c7277cb892d30fd1179a9926a8cc0ca40be2f  ccid_1.4.26.tar.bz2
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index cfe6d3995..7fbf025a6 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.18
-CCID_SOURCE = ccid_$(CCID_VERSION).orig.tar.bz2
-CCID_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid
+CCID_VERSION = 1.4.26
+CCID_SOURCE = ccid_$(CCID_VERSION).tar.bz2
+CCID_SITE = https://alioth.debian.org/frs/download.php/file/4205
 CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
2.11.0
