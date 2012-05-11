From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 16:37:38 -0300
Subject: [Buildroot] [PATCH 09/10] gnutls: bump to version 2.12.19
In-Reply-To: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336765059-20673-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ce570d5..f7238aa 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.12.18
+GNUTLS_VERSION = 2.12.19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
-- 
1.7.3.4
