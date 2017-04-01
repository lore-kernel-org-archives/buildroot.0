From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Apr 2017 15:50:45 +0200
Subject: [Buildroot] [PATCH 1/3] runc: bump to version
	54296cf40ad8143b62dbcaa1d90e520a2136ddfe
Message-ID: <1491054647-4812-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a runtime dependency of docker-engine in version 17.03.1-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index a6fc983..916f164 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	ab7913b8062f77c0a2b16ae335d74eb78aa85e8d4dcccbf0793b14caf1a3f0b2	runc-a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70.tar.gz
+sha256	bdd0fc0b5db42bb1fc439d5a5d6347d97b285e676559afb620ffd9f62fc1de26	runc-54296cf40ad8143b62dbcaa1d90e520a2136ddfe.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 47de700..4282f4e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70
+RUNC_VERSION = 54296cf40ad8143b62dbcaa1d90e520a2136ddfe
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.5.0
