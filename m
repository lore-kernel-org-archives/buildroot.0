From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:42:18 +0200
Subject: [Buildroot] [git commit] libgail: add license information
Message-ID: <20140625211213.C34579D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e9b9934aae3834efb6b47e95ee8e48e0b85119a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgail/libgail.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 3034b41..02b2735 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -10,6 +10,8 @@ LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
 LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
 LIBGAIL_AUTORECONF = YES
 LIBGAIL_INSTALL_STAGING = YES
+LIBGAIL_LICENSE = LGPLv2+
+LIBGAIL_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 LIBGAIL_CONF_OPT += --disable-x
