From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:05:14 +0100
Subject: [Buildroot] [git commit] package/stunnel: add STUNNEL_CPE_ID_VENDOR
Message-ID: <20210304065254.BAC0486DAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01024f5612ddff11c73878c3e4dd61b28dad06a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:stunnel:stunnel is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astunnel%3Astunnel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index e0cc5630e4..51cb4a4db4 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -15,6 +15,7 @@ STUNNEL_CONF_ENV = \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
+STUNNEL_CPE_ID_VENDOR = stunnel
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
