From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 11:52:54 +0200
Subject: [Buildroot] [git commit] orc: bump version
Message-ID: <20140623102251.4FE289D09E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c86be2236954564ea6c39964338c97118b8cafa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

  - Add libtool versioning to the linker flags again. This was accidentially
    removed in 0.4.20 but should not cause any problems on platforms other
    than OS X (Sebastian Dr??ge)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index a2165f7..b23584c 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.20
+ORC_VERSION = 0.4.21
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc/
 ORC_LICENSE = BSD-2c, BSD-3c
