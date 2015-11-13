From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 15:45:37 +0100
Subject: [Buildroot] [git commit branch/next] mosquitto: bump to version
	1.4.5
Message-ID: <20151113144610.CC2B681EB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56ad2ea8d581a645f344095988d2ef93834a9a0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash |    2 +-
 package/mosquitto/mosquitto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index e2db213..31c5061 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  c643c7123708aadcd29287dda7b5ce7c910f75b02956a8fc4fe65ad2ea767a5f  mosquitto-1.4.4.tar.gz
+sha256  b432e19fee0c549f4a0fb0e866d1b6a897b38dbf1ddfda92bb43e2a24f01df66  mosquitto-1.4.5.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index efeb32d..2db3173 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.4
+MOSQUITTO_VERSION = 1.4.5
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
