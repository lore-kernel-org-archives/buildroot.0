From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:35:15 +0200
Subject: [Buildroot] [git commit branch/next] shairport-sync: bump to
	version 3.0.2
Message-ID: <20170529203608.7AC1782A1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5cc2ea7129369b18cbbb41d522efd04472c72f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 9e305da..45dbbe8 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3fbde4f6e7f5cbc7200f782bd9faca25f7e91edf7dd7a3b514cd616e556a1fee  shairport-sync-3.0.1.tar.gz
+sha256  b348b9b3cf3994d9222430bc514c94a22f2ed173956fdb097f3354cdba8fd198  shairport-sync-3.0.2.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 650c6d7..208a9b3 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.0.1
+SHAIRPORT_SYNC_VERSION = 3.0.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
