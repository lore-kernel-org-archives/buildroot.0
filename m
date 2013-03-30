From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:47:24 +0100
Subject: [Buildroot] [git commit] genimage: needs host-pkgconf
Message-ID: <20130330194755.AB6FE9B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f2b3f9605c92f6a9fa2247b12d11985c1688f17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1561c26e45d0604f058eb0c7a8bebf08d4abe756/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/genimage/genimage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 6ed44a4..2c45a8d 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -7,7 +7,7 @@
 GENIMAGE_VERSION        = 4
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
-GENIMAGE_DEPENDENCIES   = libconfuse
+GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
 GENIMAGE_LICENSE        = GPLv2
 
 $(eval $(host-autotools-package))
