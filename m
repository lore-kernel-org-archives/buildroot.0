From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Apr 2016 08:49:33 +0200
Subject: [Buildroot] [git commit] shairport-sync: bump to version 2.8.3
Message-ID: <20160429065012.2688D80DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b639c7f318aec5a18907ae11a1f13e70be7eab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 5667d2c..a452bbd 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  de7d9002b87ce2f62e70cb625c9a1d312056144e01812e708f5c6d2bd376fdba  shairport-sync-2.8.2.tar.gz
+sha256  4dfdaf0883b94c7061c894be295c878ede3048355bd415905db14ccb74159b72  shairport-sync-2.8.3.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index bd95941..32127b1 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.2
+SHAIRPORT_SYNC_VERSION = 2.8.3
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
