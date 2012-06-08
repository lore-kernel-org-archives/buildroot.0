From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:42 -0300
Subject: [Buildroot] [PATCH 3/7] dnsmasq: bump to version 2.62
In-Reply-To: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339169446-26972-3-git-send-email-gustavo@zacarias.com.ar>
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
index 4aa7cfb..2b22c10 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.61
+DNSMASQ_VERSION = 2.62
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-- 
1.7.3.4
