From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 19:52:55 +0100
Subject: [Buildroot] [git commit] libsigc: needs host-m4
Message-ID: <20130327193218.CDBD99B356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b41f4081a6be0fa8768208d4459bd62e001253a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e0e5ec38208ac6cc163b6ca882690de177cb8c51/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsigc/libsigc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 3f58686..c0a0835 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -7,6 +7,7 @@
 LIBSIGC_VERSION = 2.2.11
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_DEPENDENCIES = host-m4
 LIBSIGC_INSTALL_STAGING = YES
 LIBSIGC_LICENSE = LGPLv2.1+
 LIBSIGC_LICENSE_FILES = COPYING
