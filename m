From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:41:37 +0100
Subject: [Buildroot] [git commit] kmscube: bump version to fix build failures
Message-ID: <20170314224149.CA372822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71c71f5f38b3141cde36fb381440d1d2a41febf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kmscube version to fix build failures such as this one seen on sparc64:
http://autobuild.buildroot.net/results/d7e/d7e82c67e0b04b0aea990bfb19dd6e4fd914bebe/build-end.log

,and also the one reported by Gary Bisson with Linaro 2017.02 ARM
gnueabihf toolchain.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmscube/kmscube.hash | 2 +-
 package/kmscube/kmscube.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index 0c9e414..e88bff9 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 aee8375da730c2e59e8644d6bd5e011f06c88f723a8f8934bd5dac67d94a3b8a  kmscube-87e3ff5683ee54228b3e6e75f7d4de83901fadb0.tar.gz
+sha256 dbd3eedd7fa518e3fc8bbcd424e408846a67c2c57661db30b3f5adb25f7e1513  kmscube-db8c6fc0f625e3a3d36731363276c459661d4149.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 9d3074a..901c747 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = 87e3ff5683ee54228b3e6e75f7d4de83901fadb0
+KMSCUBE_VERSION = db8c6fc0f625e3a3d36731363276c459661d4149
 KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
