From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jul 2020 22:16:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/spdlog: bump version to 1.7.0
Message-ID: <20200718201625.29899-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This bump adds compatibility to fmt version >= 7.x and needs to be
applied before the fmt bump.

 package/spdlog/spdlog.hash | 4 ++--
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index d4799f92f3..db6c811753 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 378a040d91f787aec96d269b0c39189f58a6b852e4cbf9150ccfacbe85ebbbfc  spdlog-1.6.1.tar.gz
-sha256 a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
+sha256  f0114a4d3c88be9e696762f37a7c379619443ce9d668546c61b21d41affe5b62  spdlog-1.7.0.tar.gz
+sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 49b4bd3acd..41a4442e80 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.6.1
+SPDLOG_VERSION = 1.7.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.27.0
