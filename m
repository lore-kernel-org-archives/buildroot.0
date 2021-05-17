From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:26:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gstreamer1: add CPE variables
Message-ID: <20210517210058.9424D86BD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6f44942178c7962a087a4a26cf0806a8bd8997e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gstreamer_project:gstreamer is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agstreamer_project%3Agstreamer

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 38fb1ad2a00d7584e2a7fdc1b966e9fa7e844e11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 99846c1be5..171ea2b8e3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,6 +10,8 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
+GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
 	-Dexamples=disabled \
