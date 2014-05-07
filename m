From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 May 2014 22:10:02 +0200
Subject: [Buildroot] [PATCH v5 28/32] xbmc: Disable broken rsxs screensaver
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399493406-7247-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index b1dce2c..9b52d18 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -40,6 +40,7 @@ XBMC_CONF_OPT +=  \
 	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
+	--disable-rsxs \
 	--enable-optimizations
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-- 
1.7.10.4
