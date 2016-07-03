From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:55:36 +0200
Subject: [Buildroot] [git commit] genimage: add explicit dependencies for
	host variant
Message-ID: <20160703065707.1A9A5817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e9dc4fc6884e352340b7229736652a29be1ee04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/genimage/genimage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2dffbc5..489e8d0 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -7,7 +7,7 @@
 GENIMAGE_VERSION = 8
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
-GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
+HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
 GENIMAGE_LICENSE = GPLv2
 
 $(eval $(host-autotools-package))
