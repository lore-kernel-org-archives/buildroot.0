From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:13 -0000
Subject: [Buildroot] [git commit] package/ninja: bump version to 1.9.0
Message-ID: <20190305095735.E76FA8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3777dc4bc8dc63a823d54c97392a672c4eced255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 6334c0420b..3f5bd3a279 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 86b8700c3d0880c2b44c2ff67ce42774aaf8c28cbf57725cb881569288c1c6f4  ninja-v1.8.2.tar.gz
+sha256 5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9 ninja-v1.9.0.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 259a87d216..9d6f30e9fe 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NINJA_VERSION = v1.8.2
+NINJA_VERSION = v1.9.0
 NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
