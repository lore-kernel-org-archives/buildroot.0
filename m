From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:52:38 +0100
Subject: [Buildroot] [git commit] runc: bump to version
	a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70
Message-ID: <20170303225251.A4E6681909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6af324a61f218153cdf26608161655f013922c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a runtime dependency of docker-engine in version 17.03.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
