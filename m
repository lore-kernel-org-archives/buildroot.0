From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Mar 2019 12:55:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump to version 1.9.5
Message-ID: <20190316115503.21555-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/arp-scan/arp-scan.hash | 3 ++-
 package/arp-scan/arp-scan.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index 4b2ddf1816..62f12d3d20 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	ce908ac71c48e85dddf6dd4fe5151d13c7528b1f49717a98b2a2535bd797d892	arp-scan-1.9.tar.gz
+sha256	aa9498af84158a315b7e0ea6c2cddfa746660ca3987cbe7e32c0c90f5382d9d2	arp-scan-1.9.5.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index b46e941d10..a87fa35151 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9
-ARP_SCAN_SITE = https://github.com/royhills/arp-scan/releases/download/$(ARP_SCAN_VERSION)
+ARP_SCAN_VERSION = 1.9.5
+ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
 ARP_SCAN_DEPENDENCIES = libpcap
-- 
2.14.1
