From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:08:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/librelp: add LIBRELP_CPE_ID_VENDOR
Message-ID: <20210516170842.4061-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rsyslog:librelp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arsyslog%3Alibrelp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librelp/librelp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index 0b2f5a20c9..f8bbdb131c 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -8,6 +8,7 @@ LIBRELP_VERSION = 1.10.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
+LIBRELP_CPE_ID_VENDOR = rsyslog
 LIBRELP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.30.2
