From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Oct 2019 19:01:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: bump version to 0.2.7
Message-ID: <20191017170113.31451-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/waylandpp/waylandpp.hash | 2 +-
 package/waylandpp/waylandpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 2b47ad7ac0..39ea3e1708 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 3461bf82d1d7b1222bab6b9adb642cbe1a5afa22231f27a42c25ed47c6ee6780  waylandpp-0.2.6.tar.gz
+sha256 fa31b659a6bb93b322e1068831c9a0135a4687d8ef9ceb2e7660c909ce10bfa6  waylandpp-0.2.7.tar.gz
 sha256 8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 0bd1e4cab8..8630b05bb3 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.6
+WAYLANDPP_VERSION = 0.2.7
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
-- 
2.20.1
