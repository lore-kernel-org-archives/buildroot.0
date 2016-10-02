From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  3 Oct 2016 01:39:37 +0200
Subject: [Buildroot] [PATCH 1/1] feh: bump to version 2.17.1
Message-ID: <20161002233937.18587-1-petr.vorel@gmail.com>
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
index 9d158e2..faca43d 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  6e55289a3be4495a437a0b037c7b5e86edf64ec74ab63d2d26fa50df1b62b6b3  feh-2.16.1.tar.bz2
+sha256  a9e818a4ad6ab427597e1799527a7576856c233525e67afb1eb2cb3ae709d853  feh-2.17.1.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index f5cc97f..0d5da06 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.16.1
+FEH_VERSION = 2.17.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.8.0
