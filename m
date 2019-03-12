From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:38:16 +0100
Subject: [Buildroot] [git commit] package/mosquitto: bump version to 1.5.8
Message-ID: <20190312204744.E36998EC68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24cc2eaa335a34633b71a7db7c972ab64b5e7739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of issues discovered post-1.5.7

https://mosquitto.org/blog/2019/02/version-1-5-8-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 17a467a721..25b9910138 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 d4024c3388502d50be4192991e90d66dfb344376104df3f63846c9f201779955  mosquitto-1.5.7.tar.gz
+sha256 78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4  mosquitto-1.5.8.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d17fae5df6..51c0abd0ba 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.7
+MOSQUITTO_VERSION = 1.5.8
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
