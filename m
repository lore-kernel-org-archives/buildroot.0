From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed,  4 Sep 2019 19:10:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/tree: bump to version 1.8.0
Message-ID: <1567617055-6167-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See http://mama.indstate.edu/users/ice/tree/changes.html

Also add a hash for license file.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/tree/tree.hash | 3 ++-
 package/tree/tree.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index ab79df8..6bffaa5 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12	tree-1.7.0.tgz
+sha256	715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2	tree-1.8.0.tgz
+sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 34b6c60..b6c63c0 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 1.7.0
+TREE_VERSION = 1.8.0
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPL-2.0+
-- 
2.7.4
