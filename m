From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Sep 2015 22:49:18 +0200
Subject: [Buildroot] [PATCH] mosquitto: bump version
Message-ID: <1443386958-24125-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 2ca1d17..e2db213 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	773d7436f729b5a6088035708c9277a9c6ba5651e127b63c8f29fe39e152479c  mosquitto-1.4.3.tar.gz
+sha256  c643c7123708aadcd29287dda7b5ce7c910f75b02956a8fc4fe65ad2ea767a5f  mosquitto-1.4.4.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d9703fb..73365f9 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.3
+MOSQUITTO_VERSION = 1.4.4
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.1.4
