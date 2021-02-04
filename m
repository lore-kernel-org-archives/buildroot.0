From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 18:15:52 +0100
Subject: [Buildroot] [git commit] package/iputils: bump version to 20210202
Message-ID: <20210204170218.CAE2381839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea422f99508f85665c421d3de9c7a1ceb9f99f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed version scheme: dropped leading 's', reflect it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 11f46bac28..3e30ca9383 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/s20200821/sha256sum.asc
-sha256 f265da0d02dd2259efd8c57a9c2e0c8bb3361abb14639fcffb26707be5783a5b  iputils-20200821.tar.gz
+# https://github.com/iputils/iputils/releases/download/20210202/sha256sum.asc
+sha256 3f557ecfd2ace873801231d2c1f42de73ced9fbc1ef3a438d847688b5fb0e8ab  iputils-20210202.tar.gz
 # Locally computed
 sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
 sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 92974592a6..0273e295d6 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,8 +11,8 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20200821
-IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
+IPUTILS_VERSION = 20210202
+IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
