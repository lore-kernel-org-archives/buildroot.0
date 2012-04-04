From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 22:09:51 +0200
Subject: [Buildroot] [git commit] feh: bump to 2.5
Message-ID: <20120405111656.0427B96A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd86fe21d59fb196ed27fd0f71ab9e09302618d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/feh/feh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index c461ac6..4f326ef 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -1,4 +1,4 @@
-FEH_VERSION = 2.4
+FEH_VERSION = 2.5
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
