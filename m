From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 11:28:40 +0100
Subject: [Buildroot] [PATCH] busybox: bump to version 1.24.0
Message-ID: <1444732120-14687-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/busybox/busybox.hash |    6 +++---
 package/busybox/busybox.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index cfd4937..1a9b2ff 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.23.2.tar.bz2.sign
-md5	7925683d7dd105aabe9b6b618d48cc73	busybox-1.23.2.tar.bz2
-sha1	7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16	busybox-1.23.2.tar.bz2
+# From http://busybox.net/downloads/busybox-1.24.0.tar.bz2.sign
+md5 2fa3110042e518e0e1225c799294664c  busybox-1.24.0.tar.bz2
+sha1 238a9b8a66c31fdcdd00790a840ef03cc77482c7  busybox-1.24.0.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6e302f4..3494456 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.23.2
+BUSYBOX_VERSION = 1.24.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
-- 
1.7.1
