From: Arthur Courtel <arthur.courtel@smile.fr>
Date: Fri, 31 Jan 2020 14:32:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump version to 1.9.7
Message-ID: <20200131133213.339171-1-arthur.courtel@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arthur <arthur.courtel@smile.fr>

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
---
 package/arp-scan/arp-scan.hash | 2 +-
 package/arp-scan/arp-scan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index d14e6ba270..5600f5136f 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	971b45c3369816467994797fbcd0076eb8f0ffb9c42764ea6dba25ab3fd490da	arp-scan-1.9.6.tar.gz
+sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039  arp-scan-1.9.7.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 20e9cb62fe..cc1efe84a7 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.6
+ARP_SCAN_VERSION = 1.9.7
 ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
-- 
2.24.1
