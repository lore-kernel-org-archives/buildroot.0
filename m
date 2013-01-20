From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:42:54 +0100
Subject: [Buildroot] [git commit] pkgconf: add license informations
Message-ID: <20130120202431.2F8C082750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcd02088b300c99b262be26a53f493ad0c82903b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkgconf/pkgconf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 36a5bb8..4b00ad3 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -7,6 +7,8 @@
 PKGCONF_VERSION = 0.8.9
 PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
+PKGCONF_LICENSE = pkgconf license
+PKGCONF_LICENSE_FILES = COPYING
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
 
