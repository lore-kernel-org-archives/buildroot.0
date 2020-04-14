From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 17:55:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: bump version to 2.14.0
Message-ID: <20200414155541.143326-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://botan.randombit.net/news.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/botan/botan.hash | 3 ++-
 package/botan/botan.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 29efddb35c..15e79bbe40 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,3 +1,4 @@
+# From https://botan.randombit.net/releases/sha256sums.txt
+sha256  0c10f12b424a40ee19bde00292098e201d7498535c062d8d5b586d07861a54b5  Botan-2.14.0.tar.xz
 # Locally computed
-sha256  f57ae42a41e1091bca58f44f41addebd9a390b651603952c881ec89d50187e90  Botan-2.13.0.tar.xz
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 6394b5ef95..a5551b110f 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.13.0
+BOTAN_VERSION = 2.14.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.25.0
