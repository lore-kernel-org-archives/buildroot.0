From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 11 Oct 2015 20:52:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
	2.4.1
Message-ID: <1444589560-24258-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove applied upstream patch.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 36d5b82..bf1409b 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.4
+SHAIRPORT_SYNC_VERSION = 2.4.1
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
-SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
 
 # Touching configure.ac with the patches
 SHAIRPORT_SYNC_AUTORECONF = YES
-- 
2.6.1
