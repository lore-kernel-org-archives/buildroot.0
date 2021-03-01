From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 17:07:59 +0100
Subject: [Buildroot] [git commit] package/mosquitto: bump to v2.0.8
Message-ID: <20210301154837.471CF867A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6fed30fa8238046eafdf8d21803ffdd60be59d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mosquitto 2.0.8 is bugfix release. See the announcement:
https://mosquitto.org/blog/2021/02/version-2-0-8-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 225d4f2b36..fa83af7711 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.7.tar.gz.asc
-sha256  a98054f0b8161588975ef24e1d467550d3935f4c16ccee63ecb623248a28356e  mosquitto-2.0.7.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.8.tar.gz.asc
+sha256  b15da8fc4edcb91d554e1259e220ea0173ef639ceaa4b465e06feb7e125b84bf  mosquitto-2.0.8.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 7dfdf59451..be9d885976 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.7
+MOSQUITTO_VERSION = 2.0.8
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
