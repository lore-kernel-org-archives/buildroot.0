From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2015 22:02:48 -0000
Subject: [Buildroot] [git commit] mosquitto: bump version
Message-ID: <20150601220247.D51997FD8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89cc05b66f06859883e74db2b11c517698967674
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash |    2 +-
 package/mosquitto/mosquitto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 2f38bdb..90133d7 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	75a8b051c7859a2426ffc15bf45b44f79c8288395a325d791ba54e5df9af58a8  mosquitto-1.4.1.tar.gz
+sha256	5ebc3800a0018bfbec62dcc3748fb29f628df068acd39c62c4ef651d9276647e  mosquitto-1.4.2.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 0016750..281833c 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.1
+MOSQUITTO_VERSION = 1.4.2
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
