From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Apr 2019 11:37:48 +0200
Subject: [Buildroot] [PATCH] package/corkscrew: bump to version v2.0
Message-ID: <1556098668-19479-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps corkscrew package to version v2.0.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/corkscrew/corkscrew.hash | 2 +-
 package/corkscrew/corkscrew.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/corkscrew/corkscrew.hash b/package/corkscrew/corkscrew.hash
index 5a580d1..c6dee95 100644
--- a/package/corkscrew/corkscrew.hash
+++ b/package/corkscrew/corkscrew.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ba28a7d123fe607b87ff9d399b33e7549d9ef1a13ae3b61e8f61982e8ae5571d  corkscrew-a94f745b40077172b8fe7d77e2d583b9cf900281.tar.gz
+sha256  09d70daaa3145070a1e463dbab6ae1cbc62449b1e09c94e158f6017e7c79c9f6  corkscrew-v2.0.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/corkscrew/corkscrew.mk b/package/corkscrew/corkscrew.mk
index 13612d4..ae90df8 100644
--- a/package/corkscrew/corkscrew.mk
+++ b/package/corkscrew/corkscrew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CORKSCREW_VERSION = a94f745b40077172b8fe7d77e2d583b9cf900281
+CORKSCREW_VERSION = v2.0
 CORKSCREW_SITE = $(call github,bryanpkc,corkscrew,$(CORKSCREW_VERSION))
 CORKSCREW_LICENSE = GPL-2.0
 CORKSCREW_LICENSE_FILES = COPYING
-- 
2.7.4
