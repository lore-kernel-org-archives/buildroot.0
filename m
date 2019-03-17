From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:00:26 +0100
Subject: [Buildroot] [git commit] package/feh: bump to version 3.1.3
Message-ID: <20190317110438.4807D81263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b9d15a24633307579cdcfffaea7c5a5df683c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index cb554858bf..02a88fbda9 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 6ec338f80c3f4c30d715f44780f1a09ebfbb99e92a1bb43316428744a839f383  feh-2.27.1.tar.bz2
+sha256 9fe840fbc6ce66dcf1e99296c90eb6fc44a4c2fad9a1069dfc7e0fad88eb56ef  feh-3.1.3.tar.bz2
 sha256 a289176a74d8e5d071456df5d4ee629aeb86f8eeeb6570076fe126f182c6b91d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 3bfd427e79..ac79a7da64 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.27.1
+FEH_VERSION = 3.1.3
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
