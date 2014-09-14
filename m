From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 00:31:02 +0200
Subject: [Buildroot] [git commit] libqrencode: needs host-pkgconf
Message-ID: <20140914223201.2C6929D629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=139cb9d99932dc4b31e72aa53e6f42306d265baa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses PKG_CHECK_MODULES to check for libpng.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqrencode/libqrencode.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index b407195..7d4387d 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -7,6 +7,7 @@
 LIBQRENCODE_VERSION = 3.4.2
 LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
+LIBQRENCODE_DEPENDENCIES = host-pkgconf
 LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPLv2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
