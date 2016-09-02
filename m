From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:37 -0000
Subject: [Buildroot] [git commit] igd2-for-linux: bump to version 1.2
Message-ID: <20160902142936.0078D822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02fa3ceaebd995580ae2aab6848e9ff797ea3b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/igd2-for-linux/igd2-for-linux.hash | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index a46fe5f..f1c9a7b 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	a8edc4c14aa104dcffa79d1f3057b8b9c5cef0f8f43901f61e306120a4efe01f	igd2-for-linux-v1.1.tar.gz
+sha256	523545a26b0d662e9f6913bec2518df6e70f4d497935d88983d994336a1b0ea9	igd2-for-linux-v1.2.tar.gz
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 8b63c04..8944c05 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = v1.1
+IGD2_FOR_LINUX_VERSION = v1.2
 IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
 
 IGD2_FOR_LINUX_LICENSE = GPLv2
