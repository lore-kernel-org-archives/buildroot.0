From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 22:53:54 +0100
Subject: [Buildroot] [git commit] package/mosquitto: bump to v1.6.9
Message-ID: <20200302215102.60BCD8F14A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=447b648e536a74df8dd4b334e44b2388ba477c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosquitto 1.6.9 is a bugfix release, see the announcement:
https://mosquitto.org/blog/2020/02/version-1-6-9-released/

Also update the indentation of the hash file to 2 spaces,
and add URL of the GPG signature in hash file comment.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 9 +++++----
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index ba7fd3c03c..ab3f7aeb26 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,7 +1,8 @@
 # Locally calculated after checking gpg signature
-sha256 7df23c81ca37f0e070574fe74414403cf25183016433d07add6134366fb45df6  mosquitto-1.6.8.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.9.tar.gz.asc
+sha256  412979b2db0a0020bd02fa64f0a0de9e7000b84462586e32b67f29bb1f6c1685  mosquitto-1.6.9.tar.gz
 
 # License files
-sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
-sha256 3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
-sha256 e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
+sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
+sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index aab193c14d..ea57d76933 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.8
+MOSQUITTO_VERSION = 1.6.9
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
