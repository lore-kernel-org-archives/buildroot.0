From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 16 Jun 2019 16:05:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/libsocketcan: add license file
 details
In-Reply-To: <1560693940-10828-1-git-send-email-pjtexier@koncepto.io>
References: <1560693940-10828-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1560693940-10828-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add LICENSE file

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libsocketcan/libsocketcan.hash | 1 +
 package/libsocketcan/libsocketcan.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/libsocketcan/libsocketcan.hash b/package/libsocketcan/libsocketcan.hash
index 7cb5c8e..7e40493 100644
--- a/package/libsocketcan/libsocketcan.hash
+++ b/package/libsocketcan/libsocketcan.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	28923f47b3f3191ff966866aa45823325b6e3b4fce72f056e5d87d64e4d6699d	libsocketcan-0.0.11.tar.bz2
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 7456e0b..dca8ede 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -9,5 +9,6 @@ LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
 LIBSOCKETCAN_LICENSE = LGPL-2.1+
+LIBSOCKETCAN_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
2.7.4
