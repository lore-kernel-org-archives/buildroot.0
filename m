From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 16 Jun 2019 16:05:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/libsocketcan: bump to version 0.0.11
Message-ID: <1560693940-10828-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the following changes:

0ff01ae v0.0.11
b217774 Add configure switch for error logging
15af38a Add compile option to disable error logging
9679a3f Add interface to retrieve link statistics
6f13cef Get link information only from specified interface
f5392c3 Fix parse_rtattr() does not completely initialize
4ea9ec7 Update can_set_ctrlmode() documentation
5938ac7 Update CAN netlink header
0c91940 GNUmakefile: include LICENSE file in tarball
4608afb configure: back to trunk

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libsocketcan/libsocketcan.hash | 2 +-
 package/libsocketcan/libsocketcan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsocketcan/libsocketcan.hash b/package/libsocketcan/libsocketcan.hash
index 2546c66..7cb5c8e 100644
--- a/package/libsocketcan/libsocketcan.hash
+++ b/package/libsocketcan/libsocketcan.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3c83e386c3fa7673141658472ae0b0e2a9f5849bf52fd9f7b22b04fd98ec7b6e	libsocketcan-0.0.10.tar.bz2
+sha256	28923f47b3f3191ff966866aa45823325b6e3b4fce72f056e5d87d64e4d6699d	libsocketcan-0.0.11.tar.bz2
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 31ed0d3..7456e0b 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOCKETCAN_VERSION = 0.0.10
+LIBSOCKETCAN_VERSION = 0.0.11
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
-- 
2.7.4
