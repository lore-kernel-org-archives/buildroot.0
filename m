From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 16:31:41 +0100
Subject: [Buildroot] [git commit] domoticz: bump to version 3.5834
Message-ID: <20161030153147.1ED4C81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0a93f5975f71cade8fb854c7f3ff550a4d5268e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index b56bb95..6ac223c 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	f5eaa8db192c314374deb8d58471f3a338da1397be635ebaa4b1a5f664450b05	domoticz-87286ee76ad15420c52689f1e4eeeab56fb04d40.tar.gz
+sha256	75148651fc17ff2730c172e25b6bac14e16e099733dda2f5ef2f0bc65fc46750	domoticz-3.5834.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index aceae2d..0ffa510 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 87286ee76ad15420c52689f1e4eeeab56fb04d40
+DOMOTICZ_VERSION = 3.5834
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPLv3
 DOMOTICZ_LICENSE_FILES = License.txt
