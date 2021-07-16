From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Jul 2021 23:44:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: add LINUXPTP_CPE_ID_VENDOR
Message-ID: <20210716214444.344130-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:linuxptp_project:linuxptp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxptp_project%3Alinuxptp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linuxptp/linuxptp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index f91be921af..9f6b9f5582 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -9,6 +9,7 @@ LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
+LINUXPTP_CPE_ID_VENDOR = linuxptp_project
 
 LINUXPTP_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
-- 
2.30.2
