From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Sep 2014 07:31:01 -0300
Subject: [Buildroot] [PATCH] ipset: bump to version 6.22
Message-ID: <1410863461-31593-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 5050d11..d31d433 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.21.1
+IPSET_VERSION = 6.22
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
1.8.5.5
