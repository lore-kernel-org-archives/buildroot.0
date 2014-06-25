From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jun 2014 16:01:27 -0300
Subject: [Buildroot] [PATCH 2/2] nftables: bump to version 0.3
In-Reply-To: <1403722887-21049-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403722887-21049-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403722887-21049-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nftables/nftables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 4cfffd1..b25e8f2 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.2
+NFTABLES_VERSION = 0.3
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
-- 
1.8.5.5
