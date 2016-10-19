From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 00:53:23 -0400
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
Message-ID: <1476852805-11450-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index c409a66..5b5400e 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 196b78c6caf1a4c6257314b393381baffa7c82bb2690ac02a7b3d6cd6cfe7776  runc-cc29e3dded8e27ba8f65738f40d251c885030a28.tar.gz
+sha256 638742c48426b9a3281aeb619e27513d972de228bdbd43b478baea99c186d491  runc-v1.0.0-rc2.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index e2ab5ed..ef151ed 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = cc29e3dded8e27ba8f65738f40d251c885030a28
+RUNC_VERSION = v1.0.0-rc2
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.7.3
