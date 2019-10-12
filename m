From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Oct 2019 01:12:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/minetest: bump to version 5.1.0
Message-ID: <20191012231254.231432-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://dev.minetest.net/Changelog#5.0.1_.E2.86.92_5.1.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/minetest/minetest.hash | 2 +-
 package/minetest/minetest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index 12507957bf..bedc7633c6 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 aa771cf178ad1b436d5723e5d6dd24e42b5d56f1cfe9c930f6426b7f24bb1635  minetest-5.0.1.tar.gz
+sha256 ca53975eecf6a39383040658f41d697c8d7f8d5fe9176460f564979c73b53906  minetest-5.1.0.tar.gz
 
 sha256 03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 96a66a3f19..3264792137 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.0.1
+MINETEST_VERSION = 5.1.0
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
-- 
2.23.0
