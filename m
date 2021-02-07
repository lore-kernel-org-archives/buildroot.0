From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 23:04:40 +0100
Subject: [Buildroot] [git commit] package/mosquitto: add
 MOSQUITTO_CPE_ID_VENDOR
Message-ID: <20210207214540.C16A67FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46451e6cdda7d9cf922f8a60c4c429482bde5252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:eclipse:mosquitto is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aeclipse%3Amosquitto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d5fe6de3b1..7dfdf59451 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -8,6 +8,7 @@ MOSQUITTO_VERSION = 2.0.7
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
+MOSQUITTO_CPE_ID_VENDOR = eclipse
 MOSQUITTO_INSTALL_STAGING = YES
 
 MOSQUITTO_MAKE_OPTS = \
