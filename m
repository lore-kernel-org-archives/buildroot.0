From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Dec 2012 21:32:28 -0300
Subject: [Buildroot] [PATCH 2/2] dnsmasq: bump to version 2.64
In-Reply-To: <1354840348-24951-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354840348-24951-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354840348-24951-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dac30e5..afa51e2 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.63
+DNSMASQ_VERSION = 2.64
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-- 
1.7.8.6
