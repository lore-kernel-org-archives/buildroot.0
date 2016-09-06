From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] e2fsprogs: bump to version 1.43.3
Message-ID: <20160906193115.CD64F8226C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b2ba364b00e46a93c451477b252d170822b4fe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 57287f4..5fd9f3d 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.2/sha256sums.asc
-sha256 ddba23e44e06cbe32c7b1026bc92f9487b9cb08c89e961d007cb2a5e87c4ef5e  e2fsprogs-1.43.2.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.3/sha256sums.asc
+sha256 744ca4e9a8e6c943601b2744d1ae658e5f37d35b5ea5b1dea86985320bd87f37  e2fsprogs-1.43.3.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3f3b1c0..022ba52 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.2
+E2FSPROGS_VERSION = 1.43.3
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
