From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:19:18 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
	2.4.2
Message-ID: <20151017142156.6826281D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=507d9088741b1267bbcda39fc2f92f559b33961c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash file - github release tarballs are considered stable now.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/shairport-sync.hash |    2 ++
 package/shairport-sync/shairport-sync.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
new file mode 100644
index 0000000..3d2f404
--- /dev/null
+++ b/package/shairport-sync/shairport-sync.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e3c70acc8a4516dfe0c77d7b0317c4a180cc722b22715b042ef8757d1a0e0f32  shairport-sync-2.4.2.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index fa7100a..72708c3 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.4.1
+SHAIRPORT_SYNC_VERSION = 2.4.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
