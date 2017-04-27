From: Steve Kenton <skenton@ou.edu>
Date: Thu, 27 Apr 2017 05:29:21 +0000
Subject: [Buildroot] [PATCH 1/1] tovid: bump version to 0.35.2
Message-ID: <20170427052921.3343-1-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 package/tovid/tovid.hash | 4 ++--
 package/tovid/tovid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
index 9ddd750..0bd7668 100644
--- a/package/tovid/tovid.hash
+++ b/package/tovid/tovid.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz
+# Locally calculated
+sha256 3193d081a7aa8e00f946b7514066f1fb7647f533ab1ebcc36b5ced927b0a1ab5  tovid-0.35.2.tar.gz
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index 079fada..c904b98 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TOVID_VERSION = 0.35.0
-TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
+TOVID_VERSION = 0.35.2
+TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/$(TOVID_VERSION)
 TOVID_LICENSE = GPL-2.0+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
-- 
2.9.0.137.gcf4c2cf
