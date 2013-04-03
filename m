From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:11:05 -0300
Subject: [Buildroot] [PATCH] vtun: requires host-bison and host-flex
Message-ID: <1364983865-26684-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f321700d2b060d11e3f98ff37be24c647a77a405/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vtun/vtun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2affa2e..6aeca65 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -10,7 +10,7 @@
 VTUN_VERSION = 3.0.3
 VTUN_SOURCE = vtun-$(VTUN_VERSION).tar.gz
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
-VTUN_DEPENDENCIES = zlib lzo openssl
+VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
 
 VTUN_CONF_OPT = \
-- 
1.8.1.5
