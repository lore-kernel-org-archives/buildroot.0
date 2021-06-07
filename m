From: Christian Stewart <christian@paral.in>
Date: Sun,  6 Jun 2021 22:57:49 -0700
Subject: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version 2021.1
Message-ID: <20210607055749.1466644-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/batman-adv/batman-adv.hash | 4 ++--
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 2422723f40..f81df11000 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,5 +1,5 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.0/batman-adv-2021.0.tar.gz.sha1
-sha1  7edd4dfb9434f80adf791990d4e383c7ef80a256  batman-adv-2021.0.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.1/batman-adv-2021.1.tar.gz.sha1
+sha1  27a0dc7cb74b868bc0ab52794ecedd0448f0fb61  batman-adv-2021.1.tar.gz
 
 # Hash for license files
 sha256  5a989ba580897268373bd516b87b588061f344af773a0f6b038a3d8d2af028a1  batman-adv-2021.0.tar.gz
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index cb802d6939..e58ac85bef 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2021.0
+BATMAN_ADV_VERSION = 2021.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.31.1
