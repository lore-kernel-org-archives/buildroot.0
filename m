From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:14:23 +0100
Subject: [Buildroot] [git commit] package/transmission: add
 TRANSMISSION_CPE_ID_VENDOR
Message-ID: <20210304065255.4AC0186F0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=353395a0a6492291eb5f3f62de8994cdd6bbafc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:transmissionbt:transmission is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atransmissionbt%3Atransmission

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index ff3b41c328..1660d2c2b9 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -20,6 +20,7 @@ TRANSMISSION_CONF_OPTS = \
 	--enable-lightweight
 TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
+TRANSMISSION_CPE_ID_VENDOR = transmissionbt
 
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
 TRANSMISSION_DEPENDENCIES += libminiupnpc
