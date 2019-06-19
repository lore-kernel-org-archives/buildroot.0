From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 Jun 2019 20:22:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdin2: bump to version 2.2.0
Message-ID: <20190619182235.5832-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 300cedb479..3dae7f7590 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256	032398dbaa9537af43f51a8d94e967e3718848547b1b2a4eb3138b20cad11d32	libidn2-2.1.0.tar.gz
+sha256	fc734732b506d878753ec6606982bf7b936e868c25c30ddb0d83f7d7056381fe	libidn2-2.2.0.tar.gz
 
 # Hash for license files:
 sha256	73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76	COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 7112553fea..10f179ebcc 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.1.0
+LIBIDN2_VERSION = 2.2.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE := GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.20.1
