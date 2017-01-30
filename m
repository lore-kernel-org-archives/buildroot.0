From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 15:16:58 +0100
Subject: [Buildroot] [git commit] shared-mime-info: bump to version 1.8
Message-ID: <20170130143937.952448040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e43e7c53a8e17b218ef1b43f2036f9727871357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shared-mime-info/shared-mime-info.hash | 2 +-
 package/shared-mime-info/shared-mime-info.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index 2007e0e..cf6c8f3 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	eacc781cfebaa2074e43cf9521dc7ab4391ace8a4712902b2841669c83144d2e	shared-mime-info-1.7.tar.xz
+sha256	2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9	shared-mime-info-1.8.tar.xz
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index e917ab5..64bb4d5 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 1.7
+SHARED_MIME_INFO_VERSION = 1.8
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
