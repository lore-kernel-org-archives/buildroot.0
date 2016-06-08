From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  8 Jun 2016 16:10:58 +0200
Subject: [Buildroot] [PATCH] mosquitto: bump to version 1.4.9
Message-ID: <1465395058-17906-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 861136b..68dac00 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256  d96eb5610e57cc3e273f4527d3f54358ab7711459941a9e64bc4d0a85c2acfda  mosquitto-1.4.8.tar.gz
+# From https://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.9.tar.gz
+sha512  5994159d9a8da248a877f3032f36ca9a865d9b4efaafac329620864049992a77d414e02252cbbfef89ea2c37dc761b1885a89e19fc8e82b2a42d38f31e761d4d  mosquitto-1.4.9.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index dfef6e5..f2ede6c 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.8
+MOSQUITTO_VERSION = 1.4.9
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.7.0
