From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:13 -0300
Subject: [Buildroot] [PATCH 16/19] proftpd: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proftpd/proftpd.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.1.5
