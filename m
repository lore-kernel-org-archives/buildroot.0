From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Oct 2011 09:19:58 -0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.59
Message-ID: <1319199599-1967-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1b2b95b..0f8db9d 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.58
+DNSMASQ_VERSION = 2.59
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-- 
1.7.3.4
