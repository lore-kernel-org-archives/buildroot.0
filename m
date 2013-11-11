From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Nov 2013 11:25:21 -0300
Subject: [Buildroot] [PATCH 3/4] gnutls: bump to version 3.2.6
In-Reply-To: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1384179922-14765-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1e3e267..8ab0665 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.5
+GNUTLS_VERSION = 3.2.6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.3.2
