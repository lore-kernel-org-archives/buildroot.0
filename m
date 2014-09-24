From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Sep 2014 15:26:56 -0300
Subject: [Buildroot] [PATCH] dnsmasq: bump to version 2.72
Message-ID: <1411583216-12169-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.hash | 2 ++
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/dnsmasq/dnsmasq.hash

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
new file mode 100644
index 0000000..d5e5740
--- /dev/null
+++ b/package/dnsmasq/dnsmasq.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7d0bd23f5d74b3a6b26a75d5ffcf9db81d461b47cbe578cb65a83a98008600b1	dnsmasq-2.72.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 6e97c68..e7f5776 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.71
+DNSMASQ_VERSION = 2.72
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
1.8.5.5
