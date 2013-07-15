From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Jul 2013 11:19:15 -0300
Subject: [Buildroot] [PATCH 5/7] nettle: bump to version 2.7.1
In-Reply-To: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373897957-5938-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index b772d3a..e86d3e8 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 2.7
+NETTLE_VERSION = 2.7.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
1.8.1.5
