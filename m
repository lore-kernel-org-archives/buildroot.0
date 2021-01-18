From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 18 Jan 2021 12:34:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.5.0
Message-ID: <20210118113419.3508147-1-thomas.claveirole@green-communications.fr>
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
index 2774b8064b..23683bd6e9 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	8371bbca2f7b33be0db5b416a78bc9559dd8f9afb6a406994daeeecf7b37f3f6	v6.4.3-dist.zip
+sha256	ab80014b15963404ec269a71f563fd3568581c55de160d5663600ea0787cf568	v6.5.0-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index c3e137adcd..db464ef8a6 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.4.3
+OPENLAYERS_VERSION = 6.5.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.30.0
