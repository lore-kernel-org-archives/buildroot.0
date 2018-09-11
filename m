From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 11 Sep 2018 23:04:33 +0200
Subject: [Buildroot] [PATCH 1/1] feh: Bump to version 2.27.1
Message-ID: <20180911210433.32300-1-petr.vorel@gmail.com>
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
index 0653fc2eee..e8dcb7624d 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b1d6bfdd79060d864b8eff05b916153be04801998148620125e3ac31f99f6c86  feh-2.26.tar.bz2
+sha256 6ec338f80c3f4c30d715f44780f1a09ebfbb99e92a1bb43316428744a839f383  feh-2.27.1.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 0bbec23111..403485c550 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.26
+FEH_VERSION = 2.27.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
2.19.0.rc2
