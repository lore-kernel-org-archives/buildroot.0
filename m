From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:52:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/ninja: bump version to 1.8.2
Message-ID: <20170913125238.17879-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://groups.google.com/forum/#!topic/ninja-build/Xt3NdAA0KQU/discussion

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 4c666e3065..6334c0420b 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  2edda0a5421ace3cf428309211270772dd35a91af60c96f93f90df6bc41b16d9  ninja-v1.7.2.tar.gz
+sha256 86b8700c3d0880c2b44c2ff67ce42774aaf8c28cbf57725cb881569288c1c6f4  ninja-v1.8.2.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b27f9cf341..259a87d216 100644
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
-- 
2.11.0
