From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:41:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libconfuse: set
 LIBCONFUSE_CPE_ID_VALID
Message-ID: <20210303144136.501063-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libconfuse_project:libconfuse is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibconfuse_project%3Alibconfuse

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libconfuse/libconfuse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 516c0056d1..b4523d069c 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -11,6 +11,7 @@ LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
+LIBCONFUSE_CPE_ID_VALID = YES
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
-- 
2.30.0
