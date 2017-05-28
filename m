From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:34:24 +0200
Subject: [Buildroot] [git commit branch/next] package/feh: bump version to
	2.18.3
Message-ID: <20170528133448.1BF497F9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d427e98a6424a66d312b6dda9c28df60db044bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index faca43d..c11ff64 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  a9e818a4ad6ab427597e1799527a7576856c233525e67afb1eb2cb3ae709d853  feh-2.17.1.tar.bz2
+sha256 d82f68c7a96e1860dab3584ed58bda69446b692ae79a4ca999018507da310563  feh-2.18.3.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 03651cd..ac8f683 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.17.1
+FEH_VERSION = 2.18.3
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
