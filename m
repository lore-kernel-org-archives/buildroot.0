From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 17 Feb 2020 11:39:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump version to 6.2.1
Message-ID: <20200217103944.70798-1-thomas.claveirole@green-communications.fr>
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
index b9efd448a1..f1678507d7 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	9513cf83d5a2c6093e8c4321fc50ef03cb16fb7c455858924059f5924b0fa20c	v6.1.1-dist.zip
+sha256	e133a2ad952f4a31002b1a3217f6b4b68bc9f02bcf6c0b9970638a2627887101	v6.2.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 85003b620d..65a1fe00fa 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.1.1
+OPENLAYERS_VERSION = 6.2.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.25.0
