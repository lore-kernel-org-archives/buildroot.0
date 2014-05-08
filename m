From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 May 2014 13:52:29 -0300
Subject: [Buildroot] [PATCH 3/3] gnutls: bump to version 3.2.14
In-Reply-To: <1399567949-3832-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399567949-3832-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399567949-3832-3-git-send-email-gustavo@zacarias.com.ar>
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
index 11d65d0..8b2af57 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.5.5
