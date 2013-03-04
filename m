From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:00:02 -0300
Subject: [Buildroot] [PATCH 3/4] gnutls: bump to version 3.1.9
In-Reply-To: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362412803-11393-3-git-send-email-gustavo@zacarias.com.ar>
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
index ff9cffa..21ace1c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 3.1.8
+GNUTLS_VERSION = 3.1.9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1
 GNUTLS_LICENSE = GPLv3+ LGPLv3
-- 
1.7.12.4
