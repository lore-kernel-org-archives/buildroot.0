From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Aug 2012 19:50:49 -0300
Subject: [Buildroot] [PATCH] openssl: bump to version 1.0.1c
Message-ID: <1345675849-472-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4ae65b1..0917344 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0j
+OPENSSL_VERSION = 1.0.1c
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
1.7.8.6
