From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 21:52:54 +0200
Subject: [Buildroot] [git commit] putty: bump to version 0.70
Message-ID: <20170720195113.202D880400@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=569ec19b90d861c5b7b08b86981f918e97d78bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 6 +++---
 package/putty/putty.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 23c6b3d..e052710 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,3 +1,3 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.68/{sha256,sha512}sums
-sha256 7ba256f46e5a353cafe811ce7914d0e22a52bdfc0e6e2d183ad28b5af44cd09c                                                                 putty-0.68.tar.gz
-sha512 e3a6e4f45e1fce70d4cbb6d4769ab72b23c10920e48a88bba95b3f4c225b0193ddc1444e69d572bdec5e505d2c56fed365f07d990c156b35f272b56f978ef5d3 putty-0.68.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.70/{sha256,sha512}sums
+sha256 bb8aa49d6e96c5a8e18a057f3150a1695ed99a24eef699e783651d1f24e7b0be                                                                 putty-0.70.tar.gz
+sha512 2aaf4fa2b4ad2d82eb5cdc4419ade79e0c5d8bd3c093db92b3c048e6107f85a5f1647f9d8203cda0906ce2b926725a75319f981cb32e6f1ebf50b1f738564fed putty-0.70.tar.gz
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index a2a731e..52f2d4c 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.68
+PUTTY_VERSION = 0.70
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
