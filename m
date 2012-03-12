From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 22:58:49 -0300
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/intltool/intltool.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 6d13cc1..1e749ea 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -9,8 +9,6 @@ INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
 INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
 
 HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.3.4
