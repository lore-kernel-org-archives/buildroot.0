From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:44:39 +0200
Subject: [Buildroot] [git commit] htop: bump to version 1.0.2
Message-ID: <20130425205440.A34FE9B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a4b2642aa0534d21b9377e763e8431e6eade115
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/htop/htop.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index e7061bb..fd78662 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-HTOP_VERSION = 1.0.1
+HTOP_VERSION = 1.0.2
 HTOP_SITE = http://downloads.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT = --disable-unicode
 HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
+HTOP_LICENSE = GPLv2
+HTOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
