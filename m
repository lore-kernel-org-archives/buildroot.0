From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:58:42 +0100
Subject: [Buildroot] [git commit] package/libsrtp: add LIBSRTP_CPE_ID_VENDOR
Message-ID: <20210305123920.0426B812C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c35140ae1be062360880531ad798518874f8a276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cisco:libsrtp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acisco%3Alibsrtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsrtp/libsrtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index f816f4c3e0..5cbd97957a 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -9,6 +9,7 @@ LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
 LIBSRTP_LICENSE_FILES = LICENSE
+LIBSRTP_CPE_ID_VENDOR = cisco
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBSRTP_MAKE_OPTS = libsrtp2.a
