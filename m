From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 19:28:08 +0200
Subject: [Buildroot] [git commit] package/librelp: add LIBRELP_CPE_ID_VENDOR
Message-ID: <20210516171207.1711381FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10f8934c59ed8201bf38e00a18425ca1f49dc045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rsyslog:librelp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arsyslog%3Alibrelp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librelp/librelp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index 0b2f5a20c9..f8bbdb131c 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -8,6 +8,7 @@ LIBRELP_VERSION = 1.10.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
+LIBRELP_CPE_ID_VENDOR = rsyslog
 LIBRELP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
