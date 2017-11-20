From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:09:05 -0500
Subject: [Buildroot] [NEXT v3 8/8] libpjsip: enable resample
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resampling support is essential to most sip devices.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None
  
Changes v2 -> v3:
  - Add this patch to the series.

 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 149810d..d584216 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-resample \
 	--disable-libwebrtc \
 	--disable-oss \
 	--disable-ext-sound \
-- 
2.13.6
