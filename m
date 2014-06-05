From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jun 2014 17:36:47 +0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1h
Message-ID: <44fa427ecf27cf613ec56738f0f85a23974d0370.1401979007.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-0224, CVE-2014-0221, CVE-2014-0195, CVE-2014-0198 among others.
See https://www.openssl.org/news/secadv_20140605.txt for details.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openssl/openssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 87bc2efcd499..743ca52ca93e 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1g
+OPENSSL_VERSION = 1.0.1h
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.0.0.rc2
