From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 23:59:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/lshw: bump version to B.02.17
Message-ID: <1454194758-19349-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lshw/lshw.hash | 2 +-
 package/lshw/lshw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index d829369..4f3a2e8 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	809882429555b93259785cc261dbff04c16c93d064db5f445a51945bc47157cb	lshw-B.02.16.tar.gz
+sha256	eb9cc053fa0f1e78685cb695596e73931bfb55d2377e3bc3b8b94aff4c5a489c	lshw-B.02.17.tar.gz
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index e0c81d4..f516933 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSHW_VERSION = B.02.16
+LSHW_VERSION = B.02.17
 LSHW_SITE = http://ezix.org/software/files
 LSHW_LICENSE = GPLv2
 LSHW_LICENSE_FILES = COPYING
-- 
2.7.0.rc3
