From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:44:26 +0200
Subject: [Buildroot] [git commit branch/next] phidgetwebservice: bump to
 version 2.1.8.20170607
Message-ID: <20180520164418.85EFA812E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=743ac2d53b1a263054a815e1e9c8b184adbf250d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/phidgetwebservice/phidgetwebservice.hash | 3 ++-
 package/phidgetwebservice/phidgetwebservice.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/phidgetwebservice/phidgetwebservice.hash b/package/phidgetwebservice/phidgetwebservice.hash
index 7cd85da79a..e369049c1c 100644
--- a/package/phidgetwebservice/phidgetwebservice.hash
+++ b/package/phidgetwebservice/phidgetwebservice.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  e8add82fd41d9cb274b88ee369a1f7366e35f85abcfcabb9e2a383574bb779c5  phidgetwebservice_2.1.8.20140319.tar.gz
+sha256  904af15ecd13ae4e807ed8af181e3a4521e59f8f3791be0aa4ceb1afdbf764a2  phidgetwebservice_2.1.8.20170607.tar.gz
+sha256  ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1  COPYING
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
index 36c0185e72..bdcc388b26 100644
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHIDGETWEBSERVICE_VERSION = 2.1.8.20140319
+PHIDGETWEBSERVICE_VERSION = 2.1.8.20170607
 PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
 PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries
 PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
