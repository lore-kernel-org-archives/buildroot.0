From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Oct 2019 17:45:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump version to
 3.3.2
Message-ID: <20191005154502.11748-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump includes patches to fix a build error for static
builds.

Fixes:
http://autobuild.buildroot.org/results/7edc8f8bafdc9982f8f35e171010227d6b00da46

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch makes http://patchwork.ozlabs.org/patch/1156023/ obsolete.

 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 6f73d109e4..9b5611af16 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4f1ee142b887842727ae0c310e21c83ea2386518e841a25c7ddb015d08b54eba  shairport-sync-3.2.2.tar.gz
+sha256  a8f580fa8eb71172f6237c0cdbf23287b27f41f5399f5addf8cd0115a47a4b2b  shairport-sync-3.3.2.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 5f93f1b8ea..b5f57faac1 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.2.2
+SHAIRPORT_SYNC_VERSION = 3.3.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.20.1
