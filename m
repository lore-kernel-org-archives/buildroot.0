From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2015 12:47:59 +0100
Subject: [Buildroot] [PATCH 2/4] package/gnutls: add host variant
In-Reply-To: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427543281-11901-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnutls/gnutls.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0154b4d..103abb3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -67,3 +67,4 @@ GNUTLS_POST_PATCH_HOOKS += GNUTLS_DISABLE_DOCS
 GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
