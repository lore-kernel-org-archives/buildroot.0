From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Oct 2013 10:48:35 -0300
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.2.5
Message-ID: <1382622515-15730-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix for GNUTLS-SA-2013-3.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 5a05f65..1e3e267 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.4
+GNUTLS_VERSION = 3.2.5
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.1.5
