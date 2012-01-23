From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Jan 2012 10:49:15 +0100
Subject: [Buildroot] [git commit] feh: bump to 2.2
Message-ID: <20120123095016.2889490384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a4b5206d2431a22a0dbc2ce339ac054ee9ab835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/feh/feh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index eb68277..f036393 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.0
+FEH_VERSION = 2.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
