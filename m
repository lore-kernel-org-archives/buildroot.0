From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:47 +0100
Subject: [Buildroot] [PATCH v2 2/7] directfb: erase unsupported configure
	options
In-Reply-To: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425075952-24699-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable-sysfs
- disable-explicit-deps

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb/directfb.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index b41e5c6..ed997dc 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -14,11 +14,9 @@ DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES
 
 DIRECTFB_CONF_OPTS = \
-	--disable-explicit-deps \
 	--enable-zlib \
 	--enable-freetype \
 	--enable-fbdev \
-	--disable-sysfs \
 	--disable-sdl \
 	--disable-vnc \
 	--disable-osx \
-- 
2.1.4
