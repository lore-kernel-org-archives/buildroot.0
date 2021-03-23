From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 22:37:21 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mosquitto:
 security bump to v1.6.14
Message-ID: <20210323213805.A0BFF81383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b825501902805cc5ad5aa18a40fc99d2c764fe9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This is a bugfix release and include a minor security fix.
Read the announcement on https://mosquitto.org/blog/2021/03/version-2-0-9-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 731a6ad80f..65cf42cc96 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.13.tar.gz.asc
-sha256  ce205248dd323e4e562ff83e9e84d0f9a16f4bda87183c367c66a7163c0fc287  mosquitto-1.6.13.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.14.tar.gz.asc
+sha256  5ea7e342bfbd212a0addb915036be168040dea945e5de5fe739c43c5ff3823e4  mosquitto-1.6.14.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 11e94ea7b0..0c90811c9d 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.13
+MOSQUITTO_VERSION = 1.6.14
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
