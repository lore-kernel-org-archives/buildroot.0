From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Aug 2015 10:37:02 +0200
Subject: [Buildroot] [git commit] mosquitto: bump version
Message-ID: <20150901083107.5A12181E93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b309d194286c3e8e5aa2e6652ed5351c0d879dec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash |    2 +-
 package/mosquitto/mosquitto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 90133d7..2ca1d17 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5ebc3800a0018bfbec62dcc3748fb29f628df068acd39c62c4ef651d9276647e  mosquitto-1.4.2.tar.gz
+sha256	773d7436f729b5a6088035708c9277a9c6ba5651e127b63c8f29fe39e152479c  mosquitto-1.4.3.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 281833c..d9703fb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.2
+MOSQUITTO_VERSION = 1.4.3
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
