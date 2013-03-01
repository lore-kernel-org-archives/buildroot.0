From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:23:23 -0300
Subject: [Buildroot] [PATCH 3/7] ipset: bump to version 6.17
In-Reply-To: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362133407-5840-3-git-send-email-gustavo@zacarias.com.ar>
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
index 3ef9747..4628066 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.16.1
+IPSET_VERSION = 6.17
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
1.7.12.4
