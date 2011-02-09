From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 11:33:03 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to 1.0.0d
Message-ID: <1297261983-4152-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2011-0014
http://www.openssl.org/news/secadv_20110208.txt

OCSP stapling vulnerability in OpenSSL

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 95459ec..6300e88 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0c
+OPENSSL_VERSION = 1.0.0d
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.3.4
