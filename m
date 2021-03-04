From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:31:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: set RTMPDUMP_CPE_ID_VALID
Message-ID: <20210304113113.1236017-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rtmpdump_project:rtmpdump is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Artmpdump_project%3Artmpdump

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtmpdump/rtmpdump.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index bc68b7a836..35b3ec1846 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -11,6 +11,7 @@ RTMPDUMP_INSTALL_STAGING = YES
 # care about librtmp, it's LGPL-2.1+
 RTMPDUMP_LICENSE = LGPL-2.1+
 RTMPDUMP_LICENSE_FILES = librtmp/COPYING
+RTMPDUMP_CPE_ID_VALID = YES
 RTMPDUMP_DEPENDENCIES = zlib
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.30.0
