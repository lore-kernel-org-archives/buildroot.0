From: Christian Stewart <christian@paral.in>
Date: Sat, 13 Aug 2016 10:58:23 -0700
Subject: [Buildroot] [PATCH 1/1] package/runc: bump version to cc29e3
Message-ID: <1471111103-24971-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump runc to cc29e3dded8e27ba8f65738f40d251c885030a28

This version is required by Docker Engine v1.12.0.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index e6ec483..c409a66 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 77f9d4df1657fecc939be0261fcccccd34d5b22c02b8a49abad23fac33b4059a  runc-v1.0.0-rc1.tar.gz
+sha256 196b78c6caf1a4c6257314b393381baffa7c82bb2690ac02a7b3d6cd6cfe7776  runc-cc29e3dded8e27ba8f65738f40d251c885030a28.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 7ebba57..e2ab5ed 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc1
+RUNC_VERSION = cc29e3dded8e27ba8f65738f40d251c885030a28
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.7.3
