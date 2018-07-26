From: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Date: Thu, 26 Jul 2018 03:57:33 -0500 (CDT)
Subject: [Buildroot] ghostscript: wrong fonts path set in target
 application
In-Reply-To: <1532594669999-0.post@n4.nabble.com>
References: <1532519188355-0.post@n4.nabble.com>
 <20180725163732.66eb4956@windsurf> <1532594669999-0.post@n4.nabble.com>
Message-ID: <1532595453473-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com> 
---
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -40,7 +40,7 @@
        --disable-compile-inits \
        --disable-cups \
        --enable-fontconfig \
-       --with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
+       --with-fontpath=/usr/share/fonts \
        --enable-freetype \
        --disable-gtk \
        --without-jbig2dec \





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
