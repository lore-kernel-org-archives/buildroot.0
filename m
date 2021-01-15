From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 08:58:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/lftp: set LFTP_CPE_ID_VALID
Message-ID: <20210115075823.2077298-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:lftp_project:lftp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alftp_project%3Alftp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lftp/lftp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 1348e137de..483ca298cd 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,6 +9,7 @@ LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
 LFTP_LICENSE_FILES = COPYING
+LFTP_CPE_ID_VALID = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 # Help lftp finding readline and zlib
-- 
2.29.2
