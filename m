From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:23:37 +0200
Subject: [Buildroot] [git commit] feh: bump to version 2.16.1
Message-ID: <20160626202507.7FA6F81D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c45c69409a481c92858f67da3e318ec7fb6412c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.hash | 4 ++--
 package/feh/feh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 76d6248..9d158e2 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  c80f3d3297b3b6ee4898572d19692f5e19eb3066a9ca078c3099d39004a7e0cf  feh-2.14.2.tar.bz2
+# Locally calculated after checking pgp signature
+sha256  6e55289a3be4495a437a0b037c7b5e86edf64ec74ab63d2d26fa50df1b62b6b3  feh-2.16.1.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index f650938..f5cc97f 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.14.2
+FEH_VERSION = 2.16.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
