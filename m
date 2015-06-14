From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jun 2015 14:14:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
	2.2.4
Message-ID: <1434284095-10507-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supersedes patch "package/shairport-sync: Add musl patches" [1]. Both patches
are applied upstream.

[1]
http://patchwork.ozlabs.org/patch/477479/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index bfcdb35..881cced 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.2.3
+SHAIRPORT_SYNC_VERSION = 2.2.4
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
-- 
2.4.3
