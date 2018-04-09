From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:12:54 +0200
Subject: [Buildroot] [git commit] libmms: bump to version 0.6.4
Message-ID: <20180409091401.58D0980E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8aaf954ab924c3354b8e93478c8cba53a9d9b3d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmms/libmms.hash | 3 ++-
 package/libmms/libmms.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmms/libmms.hash b/package/libmms/libmms.hash
index 69865f7c3e..f424e3afbb 100644
--- a/package/libmms/libmms.hash
+++ b/package/libmms/libmms.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  01931b62172d7d7050fc9ef9b1b64162f3b6e9f6cc4415170192a32a0b7ea432  libmms-0.6.2.tar.gz
+sha256  3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f  libmms-0.6.4.tar.gz
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index dd0b1df538..236fe1376e 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMMS_VERSION = 0.6.2
+LIBMMS_VERSION = 0.6.4
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
 LIBMMS_INSTALL_STAGING = YES
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
