From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Sep 2014 09:44:29 +0200
Subject: [Buildroot] [git commit] genimage: bump to version 7
Message-ID: <20140927075529.B26B69D6FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d58ae30d13d3913783059764c9427ff6b760ff1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index a353c62..0c0c1e5 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION        = 6
+GENIMAGE_VERSION        = 7
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
