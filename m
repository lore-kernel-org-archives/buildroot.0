From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Mar 2018 09:34:35 +0100
Subject: [Buildroot] [git commit] zyre: bump to v2.0.0
Message-ID: <20180308083523.C4E69827C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55ee1bd958885a2f2abe8a2bb07fd0af846e1c1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v2.0.0 has been released after commit
1d949e4bf79b694ea883c325f5813e87ddc2a687, which we currently use, and
it has the advantage of fixing the build with recent versions of czmq.

Fixes:

  http://autobuild.buildroot.net/results/f5804474033d5ff781af2bf195de2b81362f7be2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.hash | 2 +-
 package/zyre/zyre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.hash b/package/zyre/zyre.hash
index 5b38b8039d..8cc860232a 100644
--- a/package/zyre/zyre.hash
+++ b/package/zyre/zyre.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0ce8328a2b9fe46aafc4627fc4ebd4d815f4d9f7d9708088459306c87bf5fb4b zyre-1d949e4bf79b694ea883c325f5813e87ddc2a687.tar.gz
+sha256 b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91 zyre-v2.0.0.tar.gz
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index baaa57f5f6..82a0f517ce 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 1d949e4bf79b694ea883c325f5813e87ddc2a687
+ZYRE_VERSION = v2.0.0
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = MPL-2.0
 ZYRE_LICENSE_FILES = LICENSE
