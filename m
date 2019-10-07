From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:10:36 +0200
Subject: [Buildroot] [git commit] package/libdvbpsi: bump version to 1.3.3
Message-ID: <20191007210751.2EE0C82DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f09a0cc2993834c44c4208753da42609729f9ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvbpsi/libdvbpsi.hash | 9 ++++-----
 package/libdvbpsi/libdvbpsi.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libdvbpsi/libdvbpsi.hash b/package/libdvbpsi/libdvbpsi.hash
index 5623250dd3..727b1cf497 100644
--- a/package/libdvbpsi/libdvbpsi.hash
+++ b/package/libdvbpsi/libdvbpsi.hash
@@ -1,7 +1,6 @@
-# From http://download.videolan.org/pub/libdvbpsi/1.3.2/libdvbpsi-1.3.2.tar.bz2.md5
-md5	be7398560955c69d318439fce3a2d84f	libdvbpsi-1.3.2.tar.bz2
-# From http://download.videolan.org/pub/libdvbpsi/1.3.2/libdvbpsi-1.3.2.tar.bz2.sha256
-sha256	ac4e39f2b9b1e15706ad261fa175a9430344d650a940be9aaf502d4cb683c5fe	libdvbpsi-1.3.2.tar.bz2
-
+# From http://download.videolan.org/pub/libdvbpsi/1.3.3/libdvbpsi-1.3.3.tar.bz2.md5
+md5 9b556ab08bb62a8bec61f5c1649bc9a8  libdvbpsi-1.3.3.tar.bz2
+# From http://download.videolan.org/pub/libdvbpsi/1.3.3/libdvbpsi-1.3.3.tar.bz2.sha256
+sha256 02b5998bcf289cdfbd8757bedd5987e681309b0a25b3ffe6cebae599f7a00112  libdvbpsi-1.3.3.tar.bz2
 # Hash for license file:
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
index c4118b2652..5a07ad0cbe 100644
--- a/package/libdvbpsi/libdvbpsi.mk
+++ b/package/libdvbpsi/libdvbpsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVBPSI_VERSION = 1.3.2
+LIBDVBPSI_VERSION = 1.3.3
 LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
 LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
 LIBDVBPSI_LICENSE = LGPL-2.1+
