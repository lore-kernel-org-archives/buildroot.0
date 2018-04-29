From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:22:01 +0200
Subject: [Buildroot] [git commit] libdvbpsi: bump to version 1.3.2
Message-ID: <20180429162234.4F122884C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4b35bc3e8250bd305313034070bfb622e73823d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvbpsi/libdvbpsi.hash | 11 +++++++----
 package/libdvbpsi/libdvbpsi.mk   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/libdvbpsi/libdvbpsi.hash b/package/libdvbpsi/libdvbpsi.hash
index cf76616ff4..5623250dd3 100644
--- a/package/libdvbpsi/libdvbpsi.hash
+++ b/package/libdvbpsi/libdvbpsi.hash
@@ -1,4 +1,7 @@
-# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.md5
-md5	2b217039a1299000c39423441f77e76a	libdvbpsi-1.3.0.tar.bz2
-# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.sha256
-sha256	a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe	libdvbpsi-1.3.0.tar.bz2
+# From http://download.videolan.org/pub/libdvbpsi/1.3.2/libdvbpsi-1.3.2.tar.bz2.md5
+md5	be7398560955c69d318439fce3a2d84f	libdvbpsi-1.3.2.tar.bz2
+# From http://download.videolan.org/pub/libdvbpsi/1.3.2/libdvbpsi-1.3.2.tar.bz2.sha256
+sha256	ac4e39f2b9b1e15706ad261fa175a9430344d650a940be9aaf502d4cb683c5fe	libdvbpsi-1.3.2.tar.bz2
+
+# Hash for license file:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
index 9a0a4accdf..c4118b2652 100644
--- a/package/libdvbpsi/libdvbpsi.mk
+++ b/package/libdvbpsi/libdvbpsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVBPSI_VERSION = 1.3.0
+LIBDVBPSI_VERSION = 1.3.2
 LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
 LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
 LIBDVBPSI_LICENSE = LGPL-2.1+
