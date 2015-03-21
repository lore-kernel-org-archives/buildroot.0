From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 21 Mar 2015 16:38:32 +0100
Subject: [Buildroot] [PATCH 3/4] wine: 1.6.2 has no netapi configure option
Message-ID: <550D9078.7080803@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

Oops, that accidentally crept in

 package/wine/wine.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 188c7cc..c201186 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -23,7 +23,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-netapi \
 	--without-openal \
 	--without-opencl \
 	--without-osmesa \
@@ -304,7 +303,6 @@ HOST_WINE_CONF_OPTS += \
 	--without-jpeg \
 	--without-ldap \
 	--without-mpg123 \
-	--without-netapi \
 	--without-openal \
 	--without-opencl \
 	--without-opengl \
-- 
1.9.1
