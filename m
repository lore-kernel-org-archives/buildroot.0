From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:55:34 +0200
Subject: [Buildroot] [git commit] libsvgtiny: add license information
Message-ID: <20140625211213.F3F2D9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9722e7f70fe1e054145436fd4abbfc96c5dbc83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsvgtiny/libsvgtiny.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index dd40452..a2d494e 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -8,6 +8,8 @@ LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
 LIBSVGTINY_VERSION = 12121
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
+LIBSVGTINY_LICENSE = MIT
+LIBSVGTINY_LICENSE_FILES = README
 
 define LIBSVGTINY_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
