From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Jul 2013 11:19:16 -0300
Subject: [Buildroot] [PATCH 6/7] gnutls: bump to version 3.2.2
In-Reply-To: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373897957-5938-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Closes bug #6374

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ba38239..6562d8e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.1
+GNUTLS_VERSION = 3.2.2
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.1.5
