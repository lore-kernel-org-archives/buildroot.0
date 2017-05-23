From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 May 2017 23:05:22 +0200
Subject: [Buildroot] [PATCH/next] package/ccid: bump version to 1.4.27
Message-ID: <20170523210522.10138-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccid/ccid.hash | 6 +++---
 package/ccid/ccid.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index 3e1e962a5..a7d4875c0 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
-# From http://cdn-fastly.deb.debian.org/debian/pool/main/c/ccid/ccid_1.4.26-1.dsc
-sha1 20e22c23b8458548a6b572b044e5dbe4ecdc42e5  ccid_1.4.26.tar.bz2
-sha256 3267bf708ab780c02f01f6241b7c7277cb892d30fd1179a9926a8cc0ca40be2f  ccid_1.4.26.tar.bz2
+# From http://cdn-fastly.deb.debian.org/debian/pool/main/c/ccid/ccid_1.4.27-1.dsc
+sha1 d72ee816422183a86006e0083ccd643236b4e12a  ccid_1.4.27.tar.bz2
+sha256 a660e269606986cb94840ad5ba802ffb0cd23dd12b98f69a35035e0deb9dd137  ccid_1.4.27.tar.bz2
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 7fbf025a6..e566afe07 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.26
+CCID_VERSION = 1.4.27
 CCID_SOURCE = ccid_$(CCID_VERSION).tar.bz2
-CCID_SITE = https://alioth.debian.org/frs/download.php/file/4205
+CCID_SITE = https://alioth.debian.org/frs/download.php/file/4218
 CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
2.11.0
