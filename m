From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 16 Mar 2019 20:25:39 +0100
Subject: [Buildroot] [PATCH 1/1] feh: Bump to version 3.1.3
Message-ID: <20190316192539.12600-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
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
-- 
2.21.0
