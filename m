From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 23 Mar 2016 23:04:44 -0300
Subject: [Buildroot] [PATCH] tree: bump to version 1.7.0
Message-ID: <1458785084-12864-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/tree/tree.hash | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 82994a9..ab79df8 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4dc470a74880338b01da41701d8db90d0fb178877e526d385931a007d68d7591	tree-1.6.0.tgz
+sha256	6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12	tree-1.7.0.tgz
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 83ea472..b8988bd 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 1.6.0
+TREE_VERSION = 1.7.0
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPLv2+
-- 
2.7.4
