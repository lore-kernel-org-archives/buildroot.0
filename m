From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 28 Aug 2012 01:24:10 +0300
Subject: [Buildroot] [PATCH 2/2] remove rest of the BR2_SOURCEFORGE_MIRROR
	references
Message-ID: <1346106250-20776-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/poco/poco.mk       |    7 ++++---
 package/synergy/synergy.mk |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index e59e812..69ef314 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,9 +3,10 @@
 # poco
 #
 #############################################################
-POCO_VERSION = 1.4.3
-POCO_SOURCE = poco-$(POCO_VERSION)p1-all.tar.gz
-POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION)
+POCO_VERSION_MAJOR = 1.4.3
+POCO_VERSION = $(POCO_VERSION_MAJOR)p1
+POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
+POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 0f492e7..240f83c 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -1,4 +1,4 @@
-	#############################################################
+#############################################################
 #
 # synergy
 #
-- 
1.7.7.6
