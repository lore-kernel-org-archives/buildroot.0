From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:39:17 +0100
Subject: [Buildroot] [git commit] domoticz: bump to version 3.5837
Message-ID: <20161103213921.7858781823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e45b0314b64dff4882a5e2d3cf77a164e7c4ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 6ac223c..fef72f5 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	75148651fc17ff2730c172e25b6bac14e16e099733dda2f5ef2f0bc65fc46750	domoticz-3.5834.tar.gz
+sha256	4b2d59c2bd70e61c486b372059164a688c53b8aa9f1aedb4beb3316ae2a130c5	domoticz-3.5837.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 0ffa510..2272da8 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 3.5834
+DOMOTICZ_VERSION = 3.5837
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPLv3
 DOMOTICZ_LICENSE_FILES = License.txt
