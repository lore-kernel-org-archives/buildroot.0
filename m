From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  2 Jun 2015 23:11:34 +0200
Subject: [Buildroot] [PATCH 1/2] netcat-openbsd: fix license typo
Message-ID: <1433279495-5370-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/netcat-openbsd/netcat-openbsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index bf5c4b7..5abfc7e 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -7,7 +7,7 @@
 NETCAT_OPENBSD_VERSION = debian/1.105-7
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3c
-NETCAT_OPENBSD_LICENSE_FILE = debian/copyright
+NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
 # Ensure Busybox gets built/installed before, so that this package
-- 
1.9.1
