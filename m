From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Dec 2014 21:08:52 -0300
Subject: [Buildroot] [PATCH] libcgicc: bump to version 3.2.16
Message-ID: <1418083732-10076-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcgicc/libcgicc.hash | 2 ++
 package/libcgicc/libcgicc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/libcgicc/libcgicc.hash

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
new file mode 100644
index 0000000..313478d
--- /dev/null
+++ b/package/libcgicc/libcgicc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d94a2b5dec6d5eb6f05f114e2c7a64aeb7da71708ebe7b5f32bd6ebde1dfbc96	cgicc-3.2.16.tar.bz2
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 447b2a5..1c36d42 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.15
+LIBCGICC_VERSION = 3.2.16
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
-LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.bz2
 LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
 LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
-- 
2.0.4
