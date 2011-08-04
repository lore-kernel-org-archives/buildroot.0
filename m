From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 4 Aug 2011 21:56:33 +0200
Subject: [Buildroot] [git commit] iptables: bump to version 1.4.12
Message-ID: <20110804195756.A3F278B756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b4d1882f7e74d448abe37c5a57d9bf39f05e46b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump iptables to version 1.4.12 for linux kernel 3.0 support

[Peter: Rename patch]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ibxt_TCPMSS.c-unbreak-build-without-ipv6.patch} |    0
 package/iptables/iptables.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/iptables/{iptables-1.4.11.1-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch => iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch} (100%)

diff --git a/package/iptables/iptables-1.4.11.1-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch b/package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch
similarity index 100%
rename from package/iptables/iptables-1.4.11.1-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch
rename to package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index c464e6b..1ee8828 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.11.1
+IPTABLES_VERSION = 1.4.12
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4
