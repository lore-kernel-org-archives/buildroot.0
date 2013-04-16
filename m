From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 21:47:56 -0300
Subject: [Buildroot] [PATCH 1/4] ipset: bump to version 6.18
Message-ID: <1366073279-28652-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4628066..50915ef 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.17
+IPSET_VERSION = 6.18
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
1.8.1.5
