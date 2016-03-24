From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:31:25 +0100
Subject: [Buildroot] [git commit] tree: bump to version 1.7.0
Message-ID: <20160324213130.88455803B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15bc4761e631d284fb88b25e9dfb0630e9bc0911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
