From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 27 Jul 2017 12:01:21 +0200
Subject: [Buildroot] [PATCH] ninja: bump to version 1.7.2
Message-ID: <20170727100121.18025-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 47ec8229b9..4c666e3065 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 51581de53cf4705b89eb6b14a85baa73288ad08bff256e7d30d529155813be19  ninja-v1.7.1.tar.gz
+sha256  2edda0a5421ace3cf428309211270772dd35a91af60c96f93f90df6bc41b16d9  ninja-v1.7.2.tar.gz
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b0655766ab..b27f9cf341 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NINJA_VERSION = v1.7.1
+NINJA_VERSION = v1.7.2
 NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
-- 
2.13.3
