From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Sep 2013 21:43:07 +0200
Subject: [Buildroot] [git commit] orbit: fix ORBIT_LICENSE_FILES
Message-ID: <20130901194715.7A5DB9B6B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0279c7a1eb7038eb09aefcc146e224e415b03333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/33e/33e4e65301679e46cd80a1a123f45647376e60ce/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orbit/orbit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index af5f0af..ba1142f 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -7,7 +7,7 @@
 ORBIT_VERSION = 2.2.0
 ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
 ORBIT_LICENSE = MIT
-ORBIT_LICENSE_FILES = COPYRIGHT
+ORBIT_LICENSE_FILES = doc/us/license.md
 
 define ORBIT_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) \
