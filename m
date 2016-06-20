From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 20 Jun 2016 10:01:07 +0100
Subject: [Buildroot] [PATCH] screen: bump version to 4.4.0
Message-ID: <1466413267-47213-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/screen/screen.hash | 2 +-
 package/screen/screen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 10ba214..ee5105a 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63	screen-4.3.1.tar.gz
+sha256 ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b  screen-4.4.0.tar.gz
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 0316e3d..84c3d75 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.3.1
+SCREEN_VERSION = 4.4.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.7.3
