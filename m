From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 May 2013 11:55:36 +0200
Subject: [Buildroot] [git commit branch/next] pixman: Version bump to 0.30.0
Message-ID: <20130517100451.51C609A2BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=686d4f433b4acb7846cd8d881a03803b911d418c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pixman/pixman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 607f82e..326f9eb 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,7 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.28.2
+PIXMAN_VERSION = 0.30.0
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
