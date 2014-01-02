From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Jan 2014 08:04:04 -0300
Subject: [Buildroot] [PATCH] lrzsz: add license info and fix typo
Message-ID: <1388660644-27883-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lrzsz/lrzsz.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index f90d528..4b8a12a 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -6,8 +6,9 @@
 
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
-
-LRZSR_CONF_OPT = --disable-timesync
+LRZSZ_CONF_OPT = --disable-timesync
+LRZSZ_LICENSE = GPLv2+
+LRZSZ_LICENSE_FILES = COPYING
 
 define LRZSZ_POST_CONFIGURE_HOOKS
 	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
-- 
1.8.3.2
