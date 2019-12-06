From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri,  6 Dec 2019 21:55:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.8
Message-ID: <20191206205556.138901-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bugfix release, see:
https://mosquitto.org/blog/2019/11/version-1-6-8-released/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 14975d1fb3..ba7fd3c03c 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 bcd31a8fbbd053fee328986fadd8666d3058357ded56b9782f7d4f19931d178e  mosquitto-1.6.7.tar.gz
+sha256 7df23c81ca37f0e070574fe74414403cf25183016433d07add6134366fb45df6  mosquitto-1.6.8.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 533d44a088..d0ffffd1d6 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.7
+MOSQUITTO_VERSION = 1.6.8
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.21.0
