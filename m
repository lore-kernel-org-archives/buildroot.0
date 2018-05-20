From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 17:22:32 +0200
Subject: [Buildroot] [PATCH 2/2] phidgetwebservice: bump to version
 2.1.8.20170607
In-Reply-To: <20180520152232.17504-1-fontaine.fabrice@gmail.com>
References: <20180520152232.17504-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520152232.17504-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
