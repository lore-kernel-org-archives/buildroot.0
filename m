From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon, 21 Jun 2021 10:53:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to v2.0.11
Message-ID: <20210621085307.105631-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Versions 2.0.11 and 1.6.15 of Mosquitto has been released.
These are a security and bugfix releases.

Read the full announcement on the blog:
https://mosquitto.org/blog/2021/06/version-2-0-11-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index aa052979ff..baa2a90c5a 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.10.tar.gz.asc
-sha256  0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44  mosquitto-2.0.10.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.11.tar.gz.asc
+sha256  7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a  mosquitto-2.0.11.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 7820e8fea5..52f9c98733 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.10
+MOSQUITTO_VERSION = 2.0.11
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.25.3
