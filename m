From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:25:54 +0200
Subject: [Buildroot] [git commit] package/libsocketcan: add license file
 details
Message-ID: <20190617182558.F1F3B7FE0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=315580e8e734335a6d3bb8592bce7eaa8175abcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add LICENSE file

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsocketcan/libsocketcan.hash | 1 +
 package/libsocketcan/libsocketcan.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/libsocketcan/libsocketcan.hash b/package/libsocketcan/libsocketcan.hash
index 7cb5c8ebbf..7e40493fbf 100644
--- a/package/libsocketcan/libsocketcan.hash
+++ b/package/libsocketcan/libsocketcan.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	28923f47b3f3191ff966866aa45823325b6e3b4fce72f056e5d87d64e4d6699d	libsocketcan-0.0.11.tar.bz2
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 7456e0b75b..dca8ede6e9 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -9,5 +9,6 @@ LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
 LIBSOCKETCAN_LICENSE = LGPL-2.1+
+LIBSOCKETCAN_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
