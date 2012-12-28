From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 17:39:53 -0300
Subject: [Buildroot] [PATCH] nettle: add license info
Message-ID: <1356727193-9272-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index ef7640a..ae09ecc 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -2,6 +2,8 @@ NETTLE_VERSION = 2.5
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
+NETTLE_LICENSE = LGPLv2.1+
+NETTLE_LICENSE_FILES = COPYING.LIB
 
 define NETTLE_DITCH_DEBUGGING_CFLAGS
 	$(SED) '/CFLAGS/ s/ -ggdb3//' $(@D)/configure
-- 
1.7.8.6
