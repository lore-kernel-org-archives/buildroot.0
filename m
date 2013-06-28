From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:45:48 +0200
Subject: [Buildroot] [git commit] proftpd: define license
Message-ID: <20130628195145.DFBE49B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a24abef62e0bcb1047e78feb179582baf3f3bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proftpd/proftpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a8d0e59..78f952f 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -7,6 +7,8 @@
 PROFTPD_VERSION = 1.3.3g
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
+PROFTPD_LICENSE = GPLv2+
+PROFTPD_LICENSE_FILES = COPYING
 
 PROFTPD_CONF_ENV = ac_cv_func_setpgrp_void=yes \
 		ac_cv_func_setgrent_void=yes
