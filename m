From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 19:40:07 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: bump version to
	2.8.6
Message-ID: <20161206185828.28CD480DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dd5b1aafbf1f52a3cfe7ecb7804c3280b61ad11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index dfe0d05..45bce10 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d19f6cd3d53f5010abcf24cc20a301934372b41efc3ff2a2e4e7d8fa49200cdc  shairport-sync-2.8.5.tar.gz
+sha256  2e73416ac8fdda1657034afaa143f1710852ebed06e0aa43dafc2b7dc5eb653d  shairport-sync-2.8.6.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 7af030b..00d6a69 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.5
+SHAIRPORT_SYNC_VERSION = 2.8.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
