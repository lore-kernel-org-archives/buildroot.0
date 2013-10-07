From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 12:00:45 +0200
Subject: [Buildroot] [git commit] lcms2: bump to version 2.5
Message-ID: <20131007100135.0CF7A9B975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c9bd09556a58241647a6b602f345253567c7f33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcms2/lcms2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index c997ac3..993677b 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.4
+LCMS2_VERSION = 2.5
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
