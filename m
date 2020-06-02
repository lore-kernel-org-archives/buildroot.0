From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:48 -0000
Subject: [Buildroot] [git commit] package/minetest: bump to version 5.2.0
Message-ID: <20200602200119.47A1581499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cff47c3887363295b645978ed51240d492a371b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation of hash file (two spaces)

See:
https://dev.minetest.net/Changelog#5.1.0_.E2.86.92_5.2.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minetest/minetest.hash | 4 ++--
 package/minetest/minetest.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index bedc7633c6..626f56a31c 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 ca53975eecf6a39383040658f41d697c8d7f8d5fe9176460f564979c73b53906  minetest-5.1.0.tar.gz
+sha256  4996c7c50a6600d0c7140680d4bd995cb9aae910f216b46373953b49d6b13a5d  minetest-5.2.0.tar.gz
 
-sha256 03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
+sha256  03ec12b2ba71d5e31c37bcf2700af2f278141df62e5a2ac0ce056c53bf266e44  LICENSE.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 3264792137..e8fe5b45ce 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.1.0
+MINETEST_VERSION = 5.2.0
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
 MINETEST_LICENSE_FILES = LICENSE.txt
