From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:53 +0100
Subject: [Buildroot] [git commit] package/libssh: add LIBSSH_CPE_ID_VENDOR
Message-ID: <20210121204358.7012588F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bae85e44304e5558dfad44c3335347ab582cf4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libssh:libssh is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibssh%3Alibssh

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 67e3ad9f91..c8cb821616 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -10,6 +10,7 @@ LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
 LIBSSH_LICENSE_FILES = COPYING
+LIBSSH_CPE_ID_VENDOR = libssh
 LIBSSH_INSTALL_STAGING = YES
 LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBSSH_CONF_OPTS = \
