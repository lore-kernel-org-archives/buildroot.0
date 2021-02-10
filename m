From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:01:09 +0100
Subject: [Buildroot] [git commit] package/libvncserver: set
 LIBVNCSERVER_CPE_ID_VALID
Message-ID: <20210210184152.52E8483AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a63592fef58ab5e6aa6a2c971b57e091ec60a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libvncserver_project:libvncserver is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibvncserver_project%3Alibvncserver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 23ab40b7eb..db38e7d3cb 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -9,6 +9,7 @@ LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
+LIBVNCSERVER_CPE_ID_VALID = YES
 LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
