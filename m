From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 11:10:33 +0200
Subject: [Buildroot] [PATCH 4/4] package/kodi/kodi: Remove hyperflous option
	--disable-dvdcss
In-Reply-To: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434273033-31723-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option is controlled later on inside this if-clause

ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi/kodi.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/kodi/kodi.mk b/package/kodi/kodi/kodi.mk
index cecc41f..2b21e1f 100644
--- a/package/kodi/kodi/kodi.mk
+++ b/package/kodi/kodi/kodi.mk
@@ -34,7 +34,6 @@ KODI_CONF_ENV = \
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
 	--disable-crystalhd \
-	--disable-dvdcss \
 	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
-- 
1.7.10.4
