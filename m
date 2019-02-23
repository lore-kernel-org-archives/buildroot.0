From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 23 Feb 2019 17:53:35 +0100
Subject: [Buildroot] [PATCH v2] package/imagemagick: bump to version 7.0.8-27
Message-ID: <1550940815-4821-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch bumps imagemagick to version 7.0.8-27

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1 -> v2:

Fixed LICENSE hash

 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 9d5a395..09bfb2a 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e7c1b19923bb97ed456c78b63b3259b809ebc8e3967c6d086450370c67eedf06  7.0.7-39.tar.gz
-sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
+sha256 94866968a447f8f92a969bf5342d612d05a64c71fc75e63bb2d8ecf887dc7fa2  7.0.8-27.tar.gz
+sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7678980..b5d0d56 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-39
+IMAGEMAGICK_VERSION = 7.0.8-27
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.7.4
