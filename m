From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 22:42:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/msmtp: add MSMTP_CPE_ID_VENDOR
Message-ID: <20210522204209.284119-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:marlam:msmtp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amarlam%3Amsmtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index cae03d7724..3db36f4cd0 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -11,6 +11,7 @@ MSMTP_DEPENDENCIES = host-pkgconf
 MSMTP_CONF_OPTS = --disable-gai-idn
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
+MSMTP_CPE_ID_VENDOR = marlam
 
 # msmtpd needs fork
 ifeq ($(BR2_USE_MMU),y)
-- 
2.30.2
