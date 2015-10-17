From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 17 Oct 2015 16:18:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
	2.4.2
Message-ID: <1445091507-2693-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash file - github release tarballs are considered stable now.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 2 ++
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/shairport-sync/shairport-sync.hash

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
-- 
2.6.1
