From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 Mar 2017 19:58:25 +0100
Subject: [Buildroot] [PATCH 1/3] runc: bump to version
	a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70
Message-ID: <1488481107-97917-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a runtime dependency of docker-engine in version 17.03.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index a053b6f..a6fc983 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	11f69923a786efb82b65d9f1eec0ac665a985e631a67f3f4d466dac720efacdd	runc-9df8b306d01f59d3a8029be411de015b7304dd8f.tar.gz
+sha256	ab7913b8062f77c0a2b16ae335d74eb78aa85e8d4dcccbf0793b14caf1a3f0b2	runc-a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 5862733..47de700 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 9df8b306d01f59d3a8029be411de015b7304dd8f
+RUNC_VERSION = a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.5.0
