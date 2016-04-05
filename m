From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:31:05 +0200
Subject: [Buildroot] [git commit] feh: bump to version 2.14.2
Message-ID: <20160405194001.95FFE8024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0533bccd79440062f544c082c474139bb61becb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 396f33d..76d6248 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  3829cd8995ec7cc08095a2b22a6c98d1e2638bd87c8b4f0e85a059c6f0edbc48  feh-2.14.tar.bz2
+sha256  c80f3d3297b3b6ee4898572d19692f5e19eb3066a9ca078c3099d39004a7e0cf  feh-2.14.2.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 7381e25..f650938 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.14
+FEH_VERSION = 2.14.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
