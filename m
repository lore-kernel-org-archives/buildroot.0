From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu, 30 Apr 2020 11:53:32 +0200
Subject: [Buildroot] [PATCH] package/openlayers: bump to version 6.3.1
Message-ID: <20200430095332.98544-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index f1678507d7..e652fa2571 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	e133a2ad952f4a31002b1a3217f6b4b68bc9f02bcf6c0b9970638a2627887101	v6.2.1-dist.zip
+sha256	587ec16666e16abc5804b37ae11d3d6c14c3b51883cb2a2057191d1101da54b9	v6.3.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 65a1fe00fa..ab2c8b371d 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.2.1
+OPENLAYERS_VERSION = 6.3.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.26.2
