From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Feb 2013 12:06:53 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1d
Message-ID: <1360076813-14791-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-0169, CVE-2012-2686 and CVE-2013-0166.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index ed52577..b4a3674 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.1c
+OPENSSL_VERSION = 1.0.1d
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
1.7.12.4
