From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:29:45 +0100
Subject: [Buildroot] [git commit] package/mosquitto: bump version to 2.0.7
Message-ID: <20210207091616.008328122F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0886898da2df75810490d9b99f2e55e30cf131dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes a number of bugfixes.  For details, see the announcement:
https://mosquitto.org/blog/2021/02/version-2-0-7-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index e57a036b4a..225d4f2b36 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.4.tar.gz.asc
-sha256  ba3126d82533fe40a18cf1a989e61eaea887e81829cd93518149e73553d20f10  mosquitto-2.0.4.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.7.tar.gz.asc
+sha256  a98054f0b8161588975ef24e1d467550d3935f4c16ccee63ecb623248a28356e  mosquitto-2.0.7.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6842ee4e49..d5fe6de3b1 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.4
+MOSQUITTO_VERSION = 2.0.7
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
