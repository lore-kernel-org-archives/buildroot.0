From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 16:54:30 +0200
Subject: [Buildroot] [git commit] libpng: security bump to version 1.4.11
Message-ID: <20120403150545.F2877969F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56ece03c81a792f2dba0c5cbff609a45a13bde59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2011-3048

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 19d2a71..56d0377 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPNG_VERSION = 1.4.10
+LIBPNG_VERSION = 1.4.11
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
