From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 18:02:20 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.0h
Message-ID: <1331586140-13015-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.0.0h to fix CMS and S/MIME Bleichenbacher attack (CVE-2012-0884)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index d638ce1..4ef0b2f 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0g
+OPENSSL_VERSION = 1.0.0h
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.3.4
