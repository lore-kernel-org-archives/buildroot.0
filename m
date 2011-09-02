From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:05:01 -0300
Subject: [Buildroot] [PATCH 13/13] dnsmasq: bump to version 2.58
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-15-git-send-email-gustavo@zacarias.com.ar>
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
index d8f4d77..f62ec21 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.57
+DNSMASQ_VERSION = 2.58
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-- 
1.7.3.4
