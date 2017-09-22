From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:26:11 +0200
Subject: [Buildroot] [git commit] package/ninja: bump version to 1.8.2
Message-ID: <20170922212108.54A0A7FCBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98fa5ecc0c6a53a1be9f8593208c989238c76c64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://groups.google.com/forum/#!topic/ninja-build/Xt3NdAA0KQU/discussion

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 4c666e3..6334c04 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  2edda0a5421ace3cf428309211270772dd35a91af60c96f93f90df6bc41b16d9  ninja-v1.7.2.tar.gz
+sha256 86b8700c3d0880c2b44c2ff67ce42774aaf8c28cbf57725cb881569288c1c6f4  ninja-v1.8.2.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b27f9cf..259a87d 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NINJA_VERSION = v1.7.2
+NINJA_VERSION = v1.8.2
 NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
