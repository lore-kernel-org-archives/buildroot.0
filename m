From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Nov 2016 15:14:43 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: bump to version 3.5877
Message-ID: <1479046483-60584-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index fef72f5..7feab8f 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4b2d59c2bd70e61c486b372059164a688c53b8aa9f1aedb4beb3316ae2a130c5	domoticz-3.5837.tar.gz
+sha256	fb88edbe428851a7a337a85faa93f6da00713b3ad086ff6957031dc9b3b58bba	domoticz-3.5877.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 2272da8..f43dbda 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 3.5837
+DOMOTICZ_VERSION = 3.5877
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPLv3
 DOMOTICZ_LICENSE_FILES = License.txt
-- 
2.5.0
