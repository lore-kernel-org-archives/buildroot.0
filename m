From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 12:14:41 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/mosquitto: bump
 to v1.6.8
Message-ID: <20191207110728.E39BB8853A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2a479d479876ee18595bb832099154fe9e8356c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

This is a bugfix release, see:
https://mosquitto.org/blog/2019/11/version-1-6-8-released/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4a848e4f4418918eaa5402ff8403535d439c77f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
