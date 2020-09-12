From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Sep 2020 19:23:59 +0200
Subject: [Buildroot] [PATCH v2,2/3] package/cairo: enable script for host
In-Reply-To: <20200912172400.327527-1-fontaine.fabrice@gmail.com>
References: <20200912172400.327527-1-fontaine.fabrice@gmail.com>
Message-ID: <20200912172400.327527-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

script support on host-cairo is needed for host-librsvg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 1d1ab108ef..3d2fdbd5de 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -51,7 +51,7 @@ HOST_CAIRO_CONF_OPTS = \
 	--disable-ps \
 	--disable-pdf \
 	--enable-png \
-	--disable-script \
+	--enable-script \
 	--disable-svg \
 	--disable-tee \
 	--disable-xml
-- 
2.28.0
