From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 24 Apr 2013 15:57:04 -0700
Subject: [Buildroot] [PATCH] htop: bump to version 1.0.2
Message-ID: <1366844224-14348-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
