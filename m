From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Oct 2016 22:38:16 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.21.3
Message-ID: <1476304696-19238-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 8abbd96..6c82bdc 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.21.2-release
-sha256	a877645dc70aee71141013888863b69a1029f575f685e285b570db7c736f253a 	enlightenment-0.21.2.tar.xz
+# From https://www.enlightenment.org/news/e-0.21.3-release
+sha256	b90517d3de780023043b6e3ade30f686bd2cdcf5b66d24155b50da720e665fd2 	enlightenment-0.21.3.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index d77421f..98f537d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.2
+ENLIGHTENMENT_VERSION = 0.21.3
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.5.5
