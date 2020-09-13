From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:50:42 +0200
Subject: [Buildroot] [git commit] package/cairo: enable script for host
Message-ID: <20200913134546.B2FBF80FEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59f3c02a2565109e887456093b047287953a5f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

script support on host-cairo is needed for host-librsvg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
