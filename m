From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:50:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mosquitto: bump
 version to 1.6.13
Message-ID: <20210210193801.3A7E483977@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab7bd882828b8bcda09163e0db859c9d04cebb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Includes a number of bugfixes.  For details, see the announcement:
https://mosquitto.org/blog/2021/02/version-2-0-7-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 13f0c8de23..731a6ad80f 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.12.tar.gz.asc
-sha256  548d73d19fb787dd0530334e398fd256ef3a581181678488a741a995c4f007fb  mosquitto-1.6.12.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.13.tar.gz.asc
+sha256  ce205248dd323e4e562ff83e9e84d0f9a16f4bda87183c367c66a7163c0fc287  mosquitto-1.6.13.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 8cee0d7b0b..11e94ea7b0 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.12
+MOSQUITTO_VERSION = 1.6.13
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
