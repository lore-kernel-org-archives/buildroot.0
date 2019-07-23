From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:11:18 +0200
Subject: [Buildroot] [git commit] package/axel: bump to version 2.17.5
Message-ID: <20190723220902.2DE35873EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9673770c3a8937434c347c357598eb3f45f6813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index c317fb886f..2de602ae47 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1 @@
-sha256 d34094eb63eaebc989f96eabdda091dcfb28e840bb8d274a5f216775941f59e4  axel-2.16.1.tar.xz
+sha256 5c5c682617d498071ff9083029fcecc2c2fdeeedc366c35d2bdf8663355616cc  axel-2.17.5.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 129ea2952f..2ad8ff0881 100644
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
