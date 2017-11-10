From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:53 -0500
Subject: [Buildroot] [NEXT 01/17] libpjsip: remove deprecated config options
Message-ID: <20171110202109.25215-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

disable-small-filter and disable-large-filter have been depricated as
of 2.7, causing messages during compile time complaining about how they
are deprecated and have no effect.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/libpjsip.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 6f3f9e3f1a..c772d4117a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -38,8 +38,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
-	--disable-small-filter \
-	--disable-large-filter \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-- 
2.13.6
