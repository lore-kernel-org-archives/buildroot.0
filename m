From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 22:30:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinyxml2: bump version to 4.0.1
Message-ID: <20170429203024.15595-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinyxml2/tinyxml2.hash | 2 +-
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index acbee0931a..e5e4d238ab 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 128aa1553e88403833e0cccf1b651f45ce87bc207871f53fdcc8e7f9ec795747 tinyxml2-3.0.0.tar.gz
+sha256 14b38ef25cc136d71339ceeafb4856bb638d486614103453eccd323849267f20  tinyxml2-4.0.1.tar.gz
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 461c36cf98..bb1e16776f 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 3.0.0
+TINYXML2_VERSION = 4.0.1
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
-- 
2.11.0
