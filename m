From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:31:08 +0100
Subject: [Buildroot] [git commit] autoconf: add license info
Message-ID: <20121114214723.4E05599FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29cf4090705781f764653c5ed36e585d78fc27d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/autoconf.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0cb50db..8807c10 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -7,6 +7,9 @@
 AUTOCONF_VERSION = 2.68
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
+AUTOCONF_LICENSE = GPLv3+ with exceptions
+AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
+
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
