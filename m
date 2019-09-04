From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:35:01 +0200
Subject: [Buildroot] [git commit] package/tree: bump to version 1.8.0
Message-ID: <20190904194020.1127A8B45A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bc166f6e788205aa8c50b232e38ec13a9edd971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://mama.indstate.edu/users/ice/tree/changes.html

Also add a hash for license file.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tree/tree.hash | 3 ++-
 package/tree/tree.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index ab79df8e28..6bffaa5ec0 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12	tree-1.7.0.tgz
+sha256	715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2	tree-1.8.0.tgz
+sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 34b6c60adb..b6c63c0244 100644
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
