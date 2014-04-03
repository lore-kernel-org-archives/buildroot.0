From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:25:37 +0200
Subject: [Buildroot] [git commit] taglib: version bump 1.9.1
Message-ID: <20140403192648.8F6C89B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f5612c568bb0fc530fbd4eb24a4bc77be59a6bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taglib/taglib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index c04c88b..8e6a3bd 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.8
-TAGLIB_SITE = http://github.com/downloads/taglib/taglib
+TAGLIB_VERSION = 1.9.1
+TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1 MPL
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
