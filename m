From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 16:44:59 -0300
Subject: [Buildroot] [PATCH 3/3] weston: enable nested wayland compositor
In-Reply-To: <1464291899-1854-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464291899-1854-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1464291899-1854-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It may be useful in some scenarios and size growth is marginal at best.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 38a0d37..8455a94 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -18,7 +18,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-colord \
 	--disable-setuid-install
-- 
2.7.3
