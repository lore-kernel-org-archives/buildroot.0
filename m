From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Jan 2021 23:29:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsocketcan: bump to version 0.0.12
Message-ID: <20210121222918.2376671-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

A single change in the source code:
https://git.pengutronix.de/cgit/tools/libsocketcan/commit/?id=b5823dc86f8d0c2ff5f46fcda6e8b75728fc69ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsocketcan/libsocketcan.hash | 4 ++--
 package/libsocketcan/libsocketcan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsocketcan/libsocketcan.hash b/package/libsocketcan/libsocketcan.hash
index 7e40493fbf..c2ad23554b 100644
--- a/package/libsocketcan/libsocketcan.hash
+++ b/package/libsocketcan/libsocketcan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	28923f47b3f3191ff966866aa45823325b6e3b4fce72f056e5d87d64e4d6699d	libsocketcan-0.0.11.tar.bz2
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE
+sha256  be8280124707701935e6294d366e2474158b758fa4b2e3cae571d5b256d2fe34  libsocketcan-0.0.12.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index dca8ede6e9..0261b33c11 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOCKETCAN_VERSION = 0.0.11
+LIBSOCKETCAN_VERSION = 0.0.12
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
-- 
2.29.2
