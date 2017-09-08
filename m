From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Sep 2017 11:16:33 +0200
Subject: [Buildroot] [git commit] shairport-sync: bump to version 3.1.1
Message-ID: <20170908091617.80F6D7F9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e19178c53f6f9fd886d02f4be19c73743ad30a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 45dbbe8..899348a 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b348b9b3cf3994d9222430bc514c94a22f2ed173956fdb097f3354cdba8fd198  shairport-sync-3.0.2.tar.gz
+sha256  731e23f12ca1d645989843a15259ea0bf4d18adea94cf55f6fcc63d7b55fb53b  shairport-sync-3.1.1.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 208a9b3..898db9d 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.0.2
+SHAIRPORT_SYNC_VERSION = 3.1.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
