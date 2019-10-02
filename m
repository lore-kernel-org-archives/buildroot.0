From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:09:25 +0200
Subject: [Buildroot] [git commit] package/putty: security bump version to
 0.73
Message-ID: <20191002060608.9FBE6840EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71d2911e26a8e1df3b01ba3838adf0604c893d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream-provided sha1 hash.

Changelog:
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 7 ++++---
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 7df3b2c666..8600281efc 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,6 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.72/{sha256,sha512}sums
-sha256 f236b5a26b0905809b3cd190158e8b95d81f86ad34fdd97a4312c1877f2cec5f                                                                 putty-0.72.tar.gz
-sha512 a963985e55dcd589c08ef51085808a6364629edd8ce6708ebdf516e0339a41b7f186f91d7d7f26b1fec03d60767f365246e6fa06e9ef042898355c2f90f355dd putty-0.72.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.73/{sha1,sha256,sha512}sums
+sha1 17daebb82e476adfd578f6934c28f4d2c209b7d8  putty-0.73.tar.gz
+sha256 3db0b5403fb41aecd3aa506611366650d927650b6eb3d839ad4dcc782519df1c  putty-0.73.tar.gz
+sha512 4ada4b8c6d68be44afede2676bc661fedfd1ea0b574b8232ad9aaa6f3a48baa9f4f0ded2955b3f2677a14db85a508f53c965cb00fcd7538a1ed9844031f0c5e5  putty-0.73.tar.gz
 
 # Locally calculated
 sha256 b517b4a9504ba0f651d5e590245197b88d9a81d073905cc798cc9464c5ca7ba8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index af82904f7f..5313a4f8be 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.72
+PUTTY_VERSION = 0.73
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
