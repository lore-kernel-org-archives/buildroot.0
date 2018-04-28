From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:25:53 +0200
Subject: [Buildroot] [git commit] libcgicc: bump to version 3.2.19
Message-ID: <20180428132845.C88BA88F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e930b5844550dc1a49f3b7ee836dce9567bea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use tar.gz archive (tar.bz2 is not available since 3.2.17)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcgicc/libcgicc.hash | 2 +-
 package/libcgicc/libcgicc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
index 313478d468..eb99115833 100644
--- a/package/libcgicc/libcgicc.hash
+++ b/package/libcgicc/libcgicc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d94a2b5dec6d5eb6f05f114e2c7a64aeb7da71708ebe7b5f32bd6ebde1dfbc96	cgicc-3.2.16.tar.bz2
+sha256	2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0	cgicc-3.2.19.tar.gz
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 09df3a1bcb..e9ce4043f5 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.16
+LIBCGICC_VERSION = 3.2.19
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
-LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.bz2
+LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPL-3.0+ (library), GFDL-1.2+ (docs)
 LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
