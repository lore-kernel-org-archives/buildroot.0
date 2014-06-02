From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:46:33 +0200
Subject: [Buildroot] [git commit] package/libbsd: do not line-up variables
Message-ID: <20140602111141.7BF8C9CE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8862585c278888cec01037080f770561b669a0f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/libbsd.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 761a440..c1cd59e 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBBSD_VERSION         = 0.4.2
-LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE         = BSD-3c MIT
-LIBBSD_LICENSE_FILES   = COPYING
+LIBBSD_VERSION = 0.4.2
+LIBBSD_SITE = http://libbsd.freedesktop.org/releases
+LIBBSD_LICENSE = BSD-3c MIT
+LIBBSD_LICENSE_FILES = COPYING
 
 LIBBSD_INSTALL_STAGING = YES
 
