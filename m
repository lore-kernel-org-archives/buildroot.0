From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:27:36 +0100
Subject: [Buildroot] [git commit] package/grpc: bump to version 1.35.0
Message-ID: <20210129082032.A268D815DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c3df4fc497ce010a22ef9f0a4654794c97c5893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 68d0d27c65..52d25fc5ed 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7372a881122cd85a7224435a1d58bc5e11c88d4fb98a64b83f36f3d1c2f16d39  grpc-1.34.0.tar.gz
+sha256  27dd2fc5c9809ddcde8eb6fa1fa278a3486566dfc28335fca13eb8df8bd3b958  grpc-1.35.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index f7ddffd386..857064327d 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.34.0
+GRPC_VERSION = 1.35.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
