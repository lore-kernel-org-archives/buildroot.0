From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 22:35:42 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/mosquitto:
 security bump to v2.0.9
Message-ID: <20210323213736.7F17F81963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b53434c5f0cdab4e9a0ba0055227b1e1b352af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This is a bugfix release and include a minor security fix.
Read the announcement on https://mosquitto.org/blog/2021/03/version-2-0-9-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 521597d47f116d2baad7df0b5404e3285dfcb14b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index fa83af7711..e2c5181223 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.8.tar.gz.asc
-sha256  b15da8fc4edcb91d554e1259e220ea0173ef639ceaa4b465e06feb7e125b84bf  mosquitto-2.0.8.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.9.tar.gz.asc
+sha256  1b8553ef64a1cf5e4f4cfbe098330ae612adccd3d37f35b2db6f6fab501b01d4  mosquitto-2.0.9.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index be9d885976..d1699ab860 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.8
+MOSQUITTO_VERSION = 2.0.9
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
