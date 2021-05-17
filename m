From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 17 May 2021 12:39:29 +0200
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.49
Message-ID: <20210517103929.1924621-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libcap/libcap.hash | 4 ++--
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 7499f2468..de9de3514 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  4de9590ee09a87c282d558737ffb5b6175ccbfd26d580add10df44d0f047f6c2  libcap-2.48.tar.xz
+sha256  e98bc4d93645082ec787730b0fd1a712b38882465c505777de17c338831ee181  libcap-2.49.tar.xz
 
 # Hash for license file:
-sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
+sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 79a130b45..34636a3a8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.48
+LIBCAP_VERSION = 2.49
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.30.2
