From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:05:56 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version 2.6
Message-ID: <20151018210611.6A24081A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0ecbd93943f127fa3cd5a905c3e595b91938dda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.hash |    2 +-
 package/shairport-sync/shairport-sync.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 3d2f404..c6f5fc2 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e3c70acc8a4516dfe0c77d7b0317c4a180cc722b22715b042ef8757d1a0e0f32  shairport-sync-2.4.2.tar.gz
+sha256  d04036241e5a811240c43a3ddfb05a119a6043e8c5f1f354872a88e6cbdaef07  shairport-sync-2.6.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 72708c3..4d80f0d 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.4.2
+SHAIRPORT_SYNC_VERSION = 2.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
