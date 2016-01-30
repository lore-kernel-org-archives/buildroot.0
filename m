From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2016 08:43:04 +0100
Subject: [Buildroot] [git commit] mosquitto: bump to version 1.4.7
Message-ID: <20160201224704.C75227F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f16d42a002d406d6b031acaeea628c9e14889645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 31c5061..a8de658 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  b432e19fee0c549f4a0fb0e866d1b6a897b38dbf1ddfda92bb43e2a24f01df66  mosquitto-1.4.5.tar.gz
+sha256  71a1cb37893403e00b7db85c5db4af50b40d055ce61e5d21092c2594f2023b8b  mosquitto-1.4.7.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 2db3173..d6a5fb2 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.5
+MOSQUITTO_VERSION = 1.4.7
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
