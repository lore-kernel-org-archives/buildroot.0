From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Dec 2018 22:51:59 +0100
Subject: [Buildroot] [git commit] package/mosquitto: security bump to
 version 1.5.5
Message-ID: <20181221215805.CB769827ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=726be29277933268a5fb564f7d5eaf8a6fe953cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

If per_listener_settings is set to true, then the acl_file setting was
ignored for the "default listener" only.  This has been fixed.  This does
not affect any listeners defined with the listener option.

https://mosquitto.org/blog/2018/12/version-155-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 96e2ae9369..831171c082 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 5fd7f3454fd6d286645d032bc07f44a1c8583cec02ef2422c9eb32e0a89a9b2f  mosquitto-1.5.4.tar.gz
+sha256 fcdb47e340864c545146681af7253399cc292e41775afd76400fda5b0d23d668  mosquitto-1.5.5.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 9f3e1d3d5a..1536a5ef26 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.4
+MOSQUITTO_VERSION = 1.5.5
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
