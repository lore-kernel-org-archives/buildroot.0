From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:25:08 +0200
Subject: [Buildroot] [git commit branch/next] package/libatomic_ops: bump
 version to 7.6.10
Message-ID: <20190828122706.EDD6F86C03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04869ca17f8859808b26bfd551447244e4071b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 902bd10332..3fca4a8c5e 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 61754aa60bb8052ea64175794df2afae8baacca5420e06eb150230681e71ff5e  libatomic_ops-7.6.6.tar.gz
+sha256 e6b0909cf4e63cec693fe6c48191ce864c32c5113e16c3f517aa2a244b46992f  libatomic_ops-7.6.10.tar.gz
 sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index b298be1ea5..cc890a7f28 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.6
+LIBATOMIC_OPS_VERSION = 7.6.10
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
