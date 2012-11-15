From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:15:24 +0100
Subject: [Buildroot] [git commit] libnfc: bump version
Message-ID: <20121115213533.E86789A02C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75ed0f2effa939c59726e7c6478276da0b6f5b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that libnfc has also switched from Subversion to Git.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnfc/libnfc.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index c343551..b9ff583 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -3,9 +3,9 @@
 # libnfc
 #
 #############################################################
-LIBNFC_VERSION = 1446
-LIBNFC_SITE = http://libnfc.googlecode.com/svn/trunk/
-LIBNFC_SITE_METHOD = svn
+LIBNFC_VERSION = fda8d60ce062
+LIBNFC_SITE = http://libnfc.googlecode.com/git/
+LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
 LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
