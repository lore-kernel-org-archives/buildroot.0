From: Ismael Luceno <ismael@iodev.co.uk>
Date: Tue, 23 Jul 2019 21:34:52 +0200
Subject: [Buildroot] [PATCH v2] axel: bump to version 2.17.5
Message-ID: <20190723193452.26899-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index c317fb886f64..2de602ae479a 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1 @@
-sha256 d34094eb63eaebc989f96eabdda091dcfb28e840bb8d274a5f216775941f59e4  axel-2.16.1.tar.xz
+sha256 5c5c682617d498071ff9083029fcecc2c2fdeeedc366c35d2bdf8663355616cc  axel-2.17.5.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 129ea2952f94..2ad8ff088101 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.16.1
+AXEL_VERSION = 2.17.5
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.22.0
