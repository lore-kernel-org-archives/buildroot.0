From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 16 Mar 2015 09:18:24 +0100
Subject: [Buildroot] [PATCH 2/2] ofono: bump to version 1.16
In-Reply-To: <1426493904-16521-1-git-send-email-petr.vorel@gmail.com>
References: <1426493904-16521-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <1426493904-16521-2-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ofono/ofono.hash | 1 +
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 package/ofono/ofono.hash

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
new file mode 100644
index 0000000..e607ba5
--- /dev/null
+++ b/package/ofono/ofono.hash
@@ -0,0 +1 @@
+sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index e964376..caf6aab 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.14
+OFONO_VERSION = 1.16
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
2.1.4
