From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 12 Oct 2016 21:11:13 +0200
Subject: [Buildroot] [PATCH v2] package/shairport-sync: bump to version 2.8.5
Message-ID: <20161012191113.22520-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2:
 - remove setting sysconfdir locally as it is already passed globally
   (suggested by Thomas)
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 907a71e..dfe0d05 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  80dd94c5f37b43e9b157dd5335f8edaf11109859d0144e0046c7b86fe88f6547  shairport-sync-2.8.4.tar.gz
+sha256  d19f6cd3d53f5010abcf24cc20a301934372b41efc3ff2a2e4e7d8fa49200cdc  shairport-sync-2.8.5.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 49c6604..7af030b 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.4
+SHAIRPORT_SYNC_VERSION = 2.8.5
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
-- 
2.10.0
