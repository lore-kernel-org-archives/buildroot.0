From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  2 Jun 2020 12:44:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.10
Message-ID: <20200602104432.7636-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release fix some bugs in the broker and client libraries,
as well as building with below C99 suport.

Read the whole announcement on:
https://mosquitto.org/blog/2020/05/version-1-6-8-released/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
(Yes, the URL is weird, but points to the 1.6.10 release)
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index ab3f7aeb26..482962490e 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.9.tar.gz.asc
-sha256  412979b2db0a0020bd02fa64f0a0de9e7000b84462586e32b67f29bb1f6c1685  mosquitto-1.6.9.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.10.tar.gz.asc
+sha256  92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232  mosquitto-1.6.10.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index ea57d76933..2a9b504eb8 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.9
+MOSQUITTO_VERSION = 1.6.10
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.25.3
