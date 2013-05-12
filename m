From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 May 2013 10:53:50 -0300
Subject: [Buildroot] [PATCH 2/4] ipset: bump to version 6.19
In-Reply-To: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368366832-30354-2-git-send-email-gustavo@zacarias.com.ar>
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
index 50915ef..daadc9e 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.18
+IPSET_VERSION = 6.19
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
1.8.1.5
