From: Daniel Nicoletti <dantti12@gmail.com>
Date: Thu,  2 Aug 2018 10:38:13 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: Update micro version for
 build fix
Message-ID: <20180802133813.12698-1-dantti12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
---
 package/cutelyst/cutelyst.hash | 2 +-
 package/cutelyst/cutelyst.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index 58645e50c2..edc83f3886 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a5d40c5e0027982181529449ffa807492f5759c2c604cdc467e748445721ff28    cutelyst-2.5.1.tar.gz
+sha256  d088e6dbbb9a1ef03b4481d44746a2b086724842f5ee85abe8095e2eb6fe0da4    cutelyst-2.5.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 498d2d5545..e8695a7b3a 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.5.1
+CUTELYST_VERSION = 2.5.2
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.17.0
