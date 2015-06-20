From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jun 2015 09:56:16 -0300
Subject: [Buildroot] [PATCH] dnsmasq: bump to version 2.73
Message-ID: <1434804976-8637-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.hash | 2 +-
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index d5e5740..2d6e78c 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7d0bd23f5d74b3a6b26a75d5ffcf9db81d461b47cbe578cb65a83a98008600b1	dnsmasq-2.72.tar.xz
+sha256	0bff81103e53fcab3a3c4d0fd6df1882f9446dca4fa74ff8270e1d2ab872d8f6	dnsmasq-2.73.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 4b0999b..13352a9 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.72
+DNSMASQ_VERSION = 2.73
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.3.6
