From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 15:05:51 +0100
Subject: [Buildroot] [git commit] runc: bump to version
	9df8b306d01f59d3a8029be411de015b7304dd8f
Message-ID: <20170301170424.148E57FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f07f07241ec413687a38eccdfd335698425ba0db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version bump as a dependency of docker-engine v1.13.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 0b6a24f..a053b6f 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 374822cc2895ed3899b7a3a03b566413ea782fccec1307231f27894e9c6d5bea  runc-50a19c6ff828c58e5dab13830bd3dacde268afe5.tar.gz
+sha256	11f69923a786efb82b65d9f1eec0ac665a985e631a67f3f4d466dac720efacdd	runc-9df8b306d01f59d3a8029be411de015b7304dd8f.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 95afcaa..5862733 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 50a19c6ff828c58e5dab13830bd3dacde268afe5
+RUNC_VERSION = 9df8b306d01f59d3a8029be411de015b7304dd8f
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
