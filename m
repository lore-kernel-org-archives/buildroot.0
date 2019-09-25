From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 17:40:11 +0200
Subject: [Buildroot] [PATCH] package/mosquitto: bump version to 1.6.7
Message-ID: <20190925154011.24285-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of issues after 1.6.6:
https://mosquitto.org/blog/2019/09/version-1-6-7-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 23854bd401..14975d1fb3 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 82676bf4201ff102be1511b56b041a9450fbbfeda40b21aa28be0fee56e8de17  mosquitto-1.6.6.tar.gz
+sha256 bcd31a8fbbd053fee328986fadd8666d3058357ded56b9782f7d4f19931d178e  mosquitto-1.6.7.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 932855107e..533d44a088 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.6
+MOSQUITTO_VERSION = 1.6.7
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.20.1
