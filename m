From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:10 +0100
Subject: [Buildroot] [PATCH 7/8] package/links: add --disable-graphics
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455986411-14273-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 3486d94..f42f21c 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -36,6 +36,8 @@ LINKS_DEPENDENCIES += tiff
 else
 LINKS_CONF_OPTS += --without-libtiff
 endif
+else
+LINKS_CONF_OPTS += --disable-graphics
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.7.0
