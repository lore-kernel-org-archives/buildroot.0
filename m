From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:53 +0200
Subject: [Buildroot] [PATCH v8 25/28] xbmc: Disable broken rsxs screensaver
In-Reply-To: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400342276-10303-26-git-send-email-bernd.kuhls@t-online.de>
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
index af0c32c..361380d 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -41,6 +41,7 @@ XBMC_CONF_OPT +=  \
 	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
+	--disable-rsxs \
 	--enable-optimizations
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-- 
1.7.10.4
