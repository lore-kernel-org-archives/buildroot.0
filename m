From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:05:42 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
 3.3.5
Message-ID: <20191208221346.3DB1F88F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da9bf180ddf33b255fe6216e5b87b324a7d003fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 9b5611af16..b072fad045 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8f580fa8eb71172f6237c0cdbf23287b27f41f5399f5addf8cd0115a47a4b2b  shairport-sync-3.3.2.tar.gz
+sha256  9757dd7f19c0bc28cb06a6753305c3ed89da2d271d069b36d1b12173309c1459  shairport-sync-3.3.5.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index b5f57faac1..d7c8baa30c 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.2
+SHAIRPORT_SYNC_VERSION = 3.3.5
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
